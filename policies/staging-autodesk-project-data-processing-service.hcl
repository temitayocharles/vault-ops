# Service policy for autodesk-project/data-processing-service (staging)

path "kv/data/temitayo/staging/autodesk-project/data-processing-service" { capabilities = ["read"] }
path "kv/data/temitayo/staging/autodesk-project/data-processing-service/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/autodesk-project/data-processing-service" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/autodesk-project/data-processing-service/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/autodesk-project/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/autodesk-project/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/autodesk-project/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/autodesk-project/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
