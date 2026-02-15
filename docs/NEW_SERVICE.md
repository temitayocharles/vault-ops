# New Service Playbook (Vault Policies/Roles/Stores)

This repo enforces **service isolation** for Vault secrets access and produces the **ClusterSecretStore** objects used by External Secrets Operator (ESO).

## Vault Standard
- KV v2 mount: `kv`
- Paths:
  - service: `kv/temitayo/staging/<repo>/<service>`
  - repo global: `kv/temitayo/staging/<repo>/_global`
  - global: `kv/temitayo/staging/_global`

ESO `remoteRef.key` format (relative to mount `kv`):
- `temitayo/staging/<repo>/<service>`

## 1) Add the Service to Inventory
Edit:
- `inventory.yaml`

Add an entry:
```yaml
  - repo: cila-health-microservices
    service: patient-service
    namespace: apps-dev
```

Notes:
- `namespace` is informational today (Vault auth is bound to the ESO service account in `external-secrets`).
- Keep `repo` and `service` stable; they become part of policy/role/store names.

## 2) Generate Outputs (Policies + Roles + Manifests)
```bash
cd /Users/charlie/Desktop/vault-ops
python3 scripts/generate.py --inventory inventory.yaml --out .
```

Outputs:
- Policies: `policies/*.hcl`
- Vault k8s auth role payloads: `roles/*.yaml`
- ServiceAccounts: `manifests/serviceaccounts/*.yaml`
- ClusterSecretStores: `manifests/clustersecretstores/*.yaml`

## 3) Apply to Vault (Policies + Roles)
```bash
cd /Users/charlie/Desktop/vault-ops
python3 scripts/apply_to_vault.py --inventory inventory.yaml
```

## 4) Apply to the Cluster (ESO ServiceAccounts + Stores)
Run inside the VM:
```bash
ssh ubuntu-vm

sudo -n k3s kubectl apply -f /Users/charlie/Desktop/vault-ops/manifests/serviceaccounts
sudo -n k3s kubectl apply -f /Users/charlie/Desktop/vault-ops/manifests/clustersecretstores
```

Verify:
```bash
sudo -n k3s kubectl get clustersecretstore | grep vault-
```

## 5) Next Step
Seed the Vault path with secrets (from `.env.example`) using:
- [`temitayocharles/utilities-scripts`](https://github.com/temitayocharles/utilities-scripts)
