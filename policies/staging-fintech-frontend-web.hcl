# Service policy for fintech-frontend/web (staging)

path "kv/data/temitayo/staging/fintech-frontend/web" { capabilities = ["read"] }
path "kv/data/temitayo/staging/fintech-frontend/web/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/fintech-frontend/web" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/fintech-frontend/web/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/fintech-frontend/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/fintech-frontend/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/fintech-frontend/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/fintech-frontend/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
