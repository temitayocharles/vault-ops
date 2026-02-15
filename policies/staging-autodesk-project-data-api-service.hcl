# Service policy for autodesk-project/data-api-service (staging)

path "kv/data/temitayo/staging/autodesk-project/data-api-service" { capabilities = ["read"] }
path "kv/data/temitayo/staging/autodesk-project/data-api-service/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/autodesk-project/data-api-service" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/autodesk-project/data-api-service/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/autodesk-project/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/autodesk-project/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/autodesk-project/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/autodesk-project/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
