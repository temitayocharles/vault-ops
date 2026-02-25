# 00 Prerequisites

This runbook assumes the fresh-cluster bootstrap is complete:
- [cila-health-monolith/manual/runbooks/00-bootstrap-fresh-cluster.md](https://github.com/temitayocharles/cila-health-monolith/blob/main/manual/runbooks/00-bootstrap-fresh-cluster.md)

Tools:
- `python3`
- `kubectl`
- Vault CLI (`vault`)

Cluster prerequisites:
- Vault running in namespace `vault`
- ESO running in namespace `external-secrets`

Quick checks:

```bash
kubectl -n vault get pods
kubectl -n external-secrets get pods
kubectl get ns cila-manual
```

Port-forward Vault UI/API for local CLI operations:

```bash
kubectl -n vault port-forward svc/vault 8200:8200
```

Required env vars:

```bash
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root
```
