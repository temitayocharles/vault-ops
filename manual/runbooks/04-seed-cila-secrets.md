# 04 Seed Cila Secret Keys (Manual Training)

Populate Vault KV v2 paths:

```bash
vault kv put kv/temitayo/staging/cila-health-microservices/identity-access JWT_SECRET=dev-jwt-secret
vault kv put kv/temitayo/staging/cila-health-microservices/patient-profile PATIENT_PROFILE_DB_URL=postgresql+asyncpg://cila:cila-pass@cila-postgres:5432/cila_health
vault kv put kv/temitayo/staging/cila-health-microservices/notifications SENDGRID_API_KEY=dev-sendgrid SMTP_PASSWORD=dev-smtp
vault kv put kv/temitayo/staging/cila-health-microservices/clinical-intake CLINICAL_INTAKE_DB_URL=postgresql+asyncpg://cila:cila-pass@cila-postgres:5432/cila_health
vault kv put kv/temitayo/staging/cila-health-microservices/device-ingestion POSTGRES_USER=cila POSTGRES_PASSWORD=cila-pass DEVICE_API_TOKEN=dev-token
vault kv put kv/temitayo/staging/cila-health-monolith/monolith APP_KEY='base64:ZGV2LW1vbm9saXRoLWtleS0xMjM0NTY3ODkwMTIzNDU2Nzg5MA=='
```
