# Seed Cila Vault Data

Run these commands against the target Vault instance before applying the Cila manual manifests or syncing the Cila applications through ArgoCD.

```bash
vault kv put kv/temitayo/staging/cila-health-microservices/identity-access \
  DATABASE_URL=postgresql+asyncpg://cila_app:cila-pass@cila-postgres.cila-manual.svc.cluster.local:5432/cila_identity \
  JWT_SECRET=dev-jwt-secret

vault kv put kv/temitayo/staging/cila-health-microservices/notifications \
  DATABASE_URL=postgresql+asyncpg://cila_app:cila-pass@cila-postgres.cila-manual.svc.cluster.local:5432/cila_notifications

vault kv put kv/temitayo/staging/cila-health-microservices/patient-profile \
  DATABASE_URL=postgresql+asyncpg://cila_app:cila-pass@cila-postgres.cila-manual.svc.cluster.local:5432/cila_patient_profile

vault kv put kv/temitayo/staging/cila-health-microservices/clinical-intake \
  DATABASE_URL=postgresql+asyncpg://cila_app:cila-pass@cila-postgres.cila-manual.svc.cluster.local:5432/cila_clinical_intake

vault kv put kv/temitayo/staging/cila-health-microservices/device-ingestion \
  POSTGRES_USER=cila_app \
  POSTGRES_PASSWORD=cila-pass \
  DEVICE_API_TOKEN=device-token-dev

vault kv put kv/temitayo/staging/cila-health-monolith/monolith APP_KEY=base64:replace-me
```

The shared `cila-postgres` deployment in the manual bootstrap path can host the monolith database and the learning-phase microservice databases. If you split the services later, update only the database URLs here and keep the workload manifests unchanged.
