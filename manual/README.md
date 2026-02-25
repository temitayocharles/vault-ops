# Manual Vault/ESO Track (No ArgoCD)

This folder provides a manual flow for applying Vault policies/roles and ESO objects for Cila.

For a fresh cluster, bootstrap first:
- [cila-health-monolith/manual/runbooks/00-bootstrap-fresh-cluster.md](https://github.com/temitayocharles/cila-health-monolith/blob/main/manual/runbooks/00-bootstrap-fresh-cluster.md)

Start in order:
1. [manual/runbooks/00-prerequisites.md](./runbooks/00-prerequisites.md)
2. [manual/runbooks/01-generate-policies-roles.md](./runbooks/01-generate-policies-roles.md)
3. [manual/runbooks/02-apply-vault-policies-roles.md](./runbooks/02-apply-vault-policies-roles.md)
4. [manual/runbooks/03-apply-eso-objects.md](./runbooks/03-apply-eso-objects.md)
5. [manual/runbooks/04-seed-cila-secrets.md](./runbooks/04-seed-cila-secrets.md)
6. [manual/runbooks/05-verify.md](./runbooks/05-verify.md)
7. [manual/runbooks/99-cleanup.md](./runbooks/99-cleanup.md)

Related repos:
- ConfigMaps/manual: [configurations/manual](https://github.com/temitayocharles/configurations/tree/main/manual)
- Monolith/manual: [cila-health-monolith/manual](https://github.com/temitayocharles/cila-health-monolith/tree/main/manual)
- Microservices/manual: [cila-health-microservices/manual](https://github.com/temitayocharles/cila-health-microservices/tree/main/manual)
