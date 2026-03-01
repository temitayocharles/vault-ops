# 99 Cleanup (Optional)

If you want to remove only Cila Vault/ESO objects:

```bash
kubectl kustomize manual/kustomize/cila-vault \
  --load-restrictor LoadRestrictionsNone | kubectl delete -f -
```
