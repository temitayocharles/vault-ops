# Start Here

This repo owns Vault access boundaries and the ESO objects that bind workloads to Vault.

## What This Repo Owns
- Vault policies
- Kubernetes auth role payloads
- ESO service accounts
- `ClusterSecretStore` manifests
- canonical workload inventory for secret access

## Path Standard
KV v2 mount: `kv/`

Expected path shapes:
- service-scoped: `kv/temitayo/staging/<repo>/<service>`
- repo-shared: `kv/temitayo/staging/<repo>/_global`
- global shared: `kv/temitayo/staging/_global`

## Canonical Inventory
- `/Users/charlie/Desktop/vault-ops/inventory.yaml`

This file is the access contract for managed workloads.

## Standard Workflow
1. Update inventory.
2. Generate policies, roles, service accounts, and stores.
3. Apply policies and roles to Vault.
4. Let Argo CD own the Kubernetes-side manifests, or apply the manual track when onboarding a fresh cluster.

## Repo-Local Python
Use the repo-local interpreter for scripts:

```bash
/Users/charlie/Desktop/vault-ops/.venv/bin/python \
  /Users/charlie/Desktop/vault-ops/scripts/generate.py --help

/Users/charlie/Desktop/vault-ops/.venv/bin/python \
  /Users/charlie/Desktop/vault-ops/scripts/apply_to_vault.py --help
```

## Playbooks
- `/Users/charlie/Desktop/vault-ops/docs/NEW_SERVICE.md`
- `/Users/charlie/Desktop/vault-ops/manual/README.md`
