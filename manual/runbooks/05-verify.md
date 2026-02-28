# 05 Verify

```bash
kubectl get clustersecretstore | grep 'vault-cila-health'
kubectl -n external-secrets get sa | grep 'eso-cila-health'
```

Each workload should have its own `ClusterSecretStore` and matching ESO service account.

When workloads are deployed, verify `ExternalSecret` objects in the app namespace:

```bash
kubectl -n cila-manual get externalsecret
kubectl -n cila-manual get secret
```
