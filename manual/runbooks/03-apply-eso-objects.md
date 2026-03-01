# 03 Apply ESO ServiceAccounts and Per-Service ClusterSecretStores (Cila)

```bash
kubectl kustomize manual/kustomize/cila-vault \
  --load-restrictor LoadRestrictionsNone | kubectl apply -f -
```
