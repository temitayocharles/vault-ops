#!/usr/bin/env python3
"""Apply policies + Kubernetes auth roles to Vault via HTTP API.

This uses userpass login to obtain a token.

Required env (or flags):
- VAULT_ADDR (e.g. http://vault.vault.svc:8200)
- VAULT_USERNAME / VAULT_PASSWORD

Usage:
  python3 apply_to_vault.py --policies ./policies --roles ./roles --k8s-mount kubernetes
"""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
from urllib import request

import yaml


def http_json(method: str, url: str, token: str | None = None, payload: dict | None = None):
    data = None
    headers = {"Content-Type": "application/json"}
    if token:
        headers["X-Vault-Token"] = token
    if payload is not None:
        data = json.dumps(payload).encode()
    req = request.Request(url, data=data, method=method, headers=headers)
    with request.urlopen(req) as resp:
        body = resp.read()
        if body:
            return json.loads(body.decode())
        return {}


def login_userpass(addr: str, username: str, password: str) -> str:
    url = f"{addr.rstrip('/')}/v1/auth/userpass/login/{username}"
    res = http_json("POST", url, payload={"password": password})
    return res["auth"]["client_token"]


def put_policy(addr: str, token: str, name: str, hcl: str) -> None:
    url = f"{addr.rstrip('/')}/v1/sys/policies/acl/{name}"
    http_json("PUT", url, token=token, payload={"policy": hcl})


def put_k8s_role(addr: str, token: str, mount: str, name: str, role_payload: dict) -> None:
    url = f"{addr.rstrip('/')}/v1/auth/{mount}/role/{name}"
    http_json("POST", url, token=token, payload=role_payload)


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--vault-addr", default=os.getenv("VAULT_ADDR", ""))
    ap.add_argument("--vault-username", default=os.getenv("VAULT_USERNAME", ""))
    ap.add_argument("--vault-password", default=os.getenv("VAULT_PASSWORD", ""))
    ap.add_argument("--policies", required=True)
    ap.add_argument("--roles", required=True)
    ap.add_argument("--k8s-mount", default="kubernetes")
    args = ap.parse_args()

    if not (args.vault_addr and args.vault_username and args.vault_password):
        raise SystemExit("Missing VAULT_ADDR/VAULT_USERNAME/VAULT_PASSWORD")

    token = login_userpass(args.vault_addr, args.vault_username, args.vault_password)

    pol_dir = Path(args.policies)
    role_dir = Path(args.roles)

    for pol in sorted(pol_dir.glob("*.hcl")):
        name = pol.stem
        put_policy(args.vault_addr, token, name, pol.read_text())

    for role in sorted(list(role_dir.glob("*.yaml")) + list(role_dir.glob("*.yml")) + list(role_dir.glob("*.json"))):
        name = role.stem
        txt = role.read_text()
        if role.suffix.lower() == ".json":
            payload = json.loads(txt)
        else:
            payload = yaml.safe_load(txt)
        put_k8s_role(args.vault_addr, token, args.k8s_mount, name, payload)

    print("Applied policies + roles")


if __name__ == "__main__":
    main()
