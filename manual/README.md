# Manual Vault and ESO Track

This folder provides the manual flow for applying Vault policies, Kubernetes auth roles, ESO service accounts, and per-service `ClusterSecretStore` objects on a fresh cluster.

## Purpose
- reproduce the same secret-access model used by the GitOps platform
- keep per-service Vault access boundaries explicit during onboarding
- seed only the secret data required by the target workloads

## Start Order
1. `/Users/charlie/Desktop/vault-ops/manual/runbooks/00-prerequisites.md`
2. `/Users/charlie/Desktop/vault-ops/manual/runbooks/01-generate-policies-roles.md`
3. `/Users/charlie/Desktop/vault-ops/manual/runbooks/02-apply-vault-policies-roles.md`
4. `/Users/charlie/Desktop/vault-ops/manual/runbooks/03-apply-eso-objects.md`
5. `/Users/charlie/Desktop/vault-ops/manual/runbooks/04-seed-cila-secrets.md`
6. `/Users/charlie/Desktop/vault-ops/manual/runbooks/05-verify.md`
7. `/Users/charlie/Desktop/vault-ops/manual/runbooks/99-cleanup.md`
