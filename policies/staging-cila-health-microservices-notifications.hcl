# Service policy for cila-health-microservices/notifications (staging)

path "kv/data/temitayo/staging/cila-health-microservices/notifications" { capabilities = ["read"] }
path "kv/data/temitayo/staging/cila-health-microservices/notifications/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/cila-health-microservices/notifications" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/cila-health-microservices/notifications/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/cila-health-microservices/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/cila-health-microservices/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/cila-health-microservices/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/cila-health-microservices/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
