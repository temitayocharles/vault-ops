# Service policy for fintech-account-service/api (staging)

path "kv/data/temitayo/staging/fintech-account-service/api" { capabilities = ["read"] }
path "kv/data/temitayo/staging/fintech-account-service/api/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/fintech-account-service/api" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/fintech-account-service/api/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/fintech-account-service/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/fintech-account-service/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/fintech-account-service/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/fintech-account-service/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
