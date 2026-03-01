# 01 Generate Policies, Roles, and Stores

```bash
/Users/charlie/Desktop/vault-ops/.venv/bin/python \
  /Users/charlie/Desktop/vault-ops/scripts/generate.py \
  --inventory /Users/charlie/Desktop/vault-ops/inventory.yaml \
  --out /Users/charlie/Desktop/vault-ops \
  --kv-mount kv \
  --base temitayo \
  --vault-server http://vault.vault.svc:8200
```

This regenerates:
- `policies/*.hcl`
- `roles/*.yaml`
- `manifests/serviceaccounts/*.yaml`
- `manifests/clustersecretstores/*.yaml`
