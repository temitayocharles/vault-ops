# 01 Generate Policies, Roles, and Stores

```bash
python3 scripts/generate.py \
  --inventory inventory.yaml \
  --out . \
  --kv-mount kv \
  --base temitayo \
  --vault-server http://vault.vault.svc:8200
```

This regenerates:
- `policies/*.hcl`
- `roles/*.yaml`
- `manifests/serviceaccounts/*.yaml`
- `manifests/clustersecretstores/*.yaml`
