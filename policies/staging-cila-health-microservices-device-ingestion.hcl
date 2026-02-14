# Service policy for cila-health-microservices/device-ingestion (staging)

path "kv/data/temitayo/staging/cila-health-microservices/device-ingestion" { capabilities = ["read"] }
path "kv/data/temitayo/staging/cila-health-microservices/device-ingestion/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/cila-health-microservices/device-ingestion" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/cila-health-microservices/device-ingestion/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/cila-health-microservices/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/cila-health-microservices/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/cila-health-microservices/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/cila-health-microservices/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
