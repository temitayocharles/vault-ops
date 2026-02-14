#!/usr/bin/env python3
"""Generate Vault policies + Kubernetes auth roles + ESO ClusterSecretStores.

Inputs:
- inventory YAML (repos/services)
Outputs:
- policies/*.hcl
- roles/*.json (Vault k8s auth role payloads)
- manifests/serviceaccounts/*.yaml
- manifests/clustersecretstores/*.yaml

Assumptions:
- Vault KV v2 mount is `kv/`
- Environment is a single env (default: staging)
- ESO runs in `external-secrets` namespace

Path convention:
- kv/temitayo/<env>/<repo>/<service>
- kv/temitayo/<env>/<repo>/_global
- kv/temitayo/<env>/_global
"""

from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import yaml


@dataclass(frozen=True)
class Service:
    repo: str
    service: str
    namespace: str


def slug(s: str) -> str:
    s = s.lower().strip()
    s = re.sub(r"[^a-z0-9-]+", "-", s)
    s = re.sub(r"-+", "-", s).strip("-")
    return s


def load_inventory(path: Path) -> list[Service]:
    raw = yaml.safe_load(path.read_text())
    out: list[Service] = []

    # expected shape:
    # env: staging
    # services:
    #   - repo: fintech-user-service
    #     service: api
    #     namespace: apps
    env = raw.get("env")
    if not env:
        raise SystemExit("inventory missing env")

    for item in raw.get("services", []):
        out.append(
            Service(
                repo=str(item["repo"]),
                service=str(item["service"]),
                namespace=str(item.get("namespace", "apps")),
            )
        )

    return out


def policy_hcl(*, kv_mount: str, base: str, env: str, repo: str, service: str) -> str:
    # Vault KV v2 uses /data and /metadata endpoints.
    # We allow read/list only; CI/bootstrap writes use a separate admin workflow.
    svc_path = f"{base}/{env}/{repo}/{service}"
    repo_global = f"{base}/{env}/{repo}/_global"
    global_path = f"{base}/{env}/_global"

    # Translate to v2 API paths.
    def data(p: str) -> str:
        return f"{kv_mount}/data/{p}/*".replace("//", "/")

    def meta(p: str) -> str:
        return f"{kv_mount}/metadata/{p}/*".replace("//", "/")

    def data_self(p: str) -> str:
        return f"{kv_mount}/data/{p}".replace("//", "/")

    def meta_self(p: str) -> str:
        return f"{kv_mount}/metadata/{p}".replace("//", "/")

    return "\n".join(
        [
            f'# Service policy for {repo}/{service} ({env})',
            '',
            f'path "{data_self(svc_path)}" {{ capabilities = ["read"] }}',
            f'path "{data(svc_path)}" {{ capabilities = ["read"] }}',
            f'path "{meta_self(svc_path)}" {{ capabilities = ["list"] }}',
            f'path "{meta(svc_path)}" {{ capabilities = ["list"] }}',
            '',
            f'path "{data_self(repo_global)}" {{ capabilities = ["read"] }}',
            f'path "{data(repo_global)}" {{ capabilities = ["read"] }}',
            f'path "{meta_self(repo_global)}" {{ capabilities = ["list"] }}',
            f'path "{meta(repo_global)}" {{ capabilities = ["list"] }}',
            '',
            f'path "{data_self(global_path)}" {{ capabilities = ["read"] }}',
            f'path "{data(global_path)}" {{ capabilities = ["read"] }}',
            f'path "{meta_self(global_path)}" {{ capabilities = ["list"] }}',
            f'path "{meta(global_path)}" {{ capabilities = ["list"] }}',
            '',
        ]
    )


def role_payload(*, role_name: str, policy_name: str, bound_sa: str, bound_ns: str) -> dict[str, Any]:
    return {
        "bound_service_account_names": [bound_sa],
        "bound_service_account_namespaces": [bound_ns],
        "policies": [policy_name],
        "ttl": "24h",
    }


def k8s_service_account_yaml(*, name: str, namespace: str) -> str:
    return "\n".join(
        [
            "apiVersion: v1",
            "kind: ServiceAccount",
            "metadata:",
            f"  name: {name}",
            f"  namespace: {namespace}",
            "",
        ]
    )


def cluster_secret_store_yaml(*, name: str, role: str, sa_name: str, vault_server: str, kv_mount: str) -> str:
    return "\n".join(
        [
            "apiVersion: external-secrets.io/v1",
            "kind: ClusterSecretStore",
            "metadata:",
            f"  name: {name}",
            "spec:",
            "  provider:",
            "    vault:",
            f"      server: {vault_server}",
            f"      path: {kv_mount}",
            "      version: v2",
            "      auth:",
            "        kubernetes:",
            "          mountPath: kubernetes",
            f"          role: {role}",
            "          serviceAccountRef:",
            f"            name: {sa_name}",
            "            namespace: external-secrets",
            "",
        ]
    )


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--inventory", required=True)
    ap.add_argument("--out", default=".")
    ap.add_argument("--kv-mount", default="kv")
    ap.add_argument("--base", default="temitayo")
    ap.add_argument("--vault-server", default="http://vault.vault.svc:8200")
    args = ap.parse_args()

    inv = Path(args.inventory).resolve()
    out = Path(args.out).resolve()
    services = load_inventory(inv)

    raw = yaml.safe_load(inv.read_text())
    env = str(raw["env"])

    policies_dir = out / "policies"
    roles_dir = out / "roles"
    sa_dir = out / "manifests" / "serviceaccounts"
    stores_dir = out / "manifests" / "clustersecretstores"

    for d in (policies_dir, roles_dir, sa_dir, stores_dir):
        d.mkdir(parents=True, exist_ok=True)

    for s in services:
        pol_name = slug(f"{env}-{s.repo}-{s.service}")
        role_name = pol_name

        hcl = policy_hcl(kv_mount=args.kv_mount, base=args.base, env=env, repo=s.repo, service=s.service)
        (policies_dir / f"{pol_name}.hcl").write_text(hcl)

        sa_name = slug(f"eso-{s.repo}-{s.service}")
        (sa_dir / f"{sa_name}.yaml").write_text(k8s_service_account_yaml(name=sa_name, namespace="external-secrets"))

        payload = role_payload(role_name=role_name, policy_name=pol_name, bound_sa=sa_name, bound_ns="external-secrets")
        (roles_dir / f"{role_name}.yaml").write_text(yaml.safe_dump(payload, sort_keys=False))

        store_name = slug(f"vault-{s.repo}-{s.service}")
        (stores_dir / f"{store_name}.yaml").write_text(
            cluster_secret_store_yaml(
                name=store_name,
                role=role_name,
                sa_name=sa_name,
                vault_server=args.vault_server,
                kv_mount=args.kv_mount,
            )
        )

    print(f"Generated {len(services)} services into {out}")


if __name__ == "__main__":
    main()
