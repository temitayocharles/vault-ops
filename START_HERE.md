# Start Here

This repo owns Vault access boundaries (policies/roles) and the ESO SecretStores/ClusterSecretStores that map workloads to their Vault paths.

## Vault Path Standard (KV v2 mount: `kv/`)

- Service-scoped secrets: `kv/temitayo/staging/<repo>/<service>`
- Repo-shared secrets: `kv/temitayo/staging/<repo>/_global`
- Global shared secrets: `kv/temitayo/staging/_global`

Rules:
- Each workload gets a dedicated Vault policy + Kubernetes auth role.
- ESO SecretStore/ClusterSecretStore must reference the matching role.
- Global paths should stay small and stable.

## Workflow

1. Generate policies/roles/manifests from an inventory.
2. Apply policies/roles to Vault.
3. Apply manifests to the cluster.

## Script Entry Points

- `scripts/generate.py` generates Vault policies, Kubernetes auth roles, ESO service accounts, and `ClusterSecretStore` manifests from inventory input.
- `scripts/apply_to_vault.py` applies source policies and role payloads to Vault using the documented userpass flow.

These scripts manage access boundaries and ESO wiring. They do not mutate application charts or GitOps manifests directly.

## Playbooks
- New service playbook: [docs/NEW_SERVICE.md](docs/NEW_SERVICE.md)
- Manual non-GitOps flow: [manual/README.md](manual/README.md)
