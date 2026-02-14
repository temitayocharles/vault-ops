# Service policy for fintech-transaction-service/api (staging)

path "kv/data/temitayo/staging/fintech-transaction-service/api" { capabilities = ["read"] }
path "kv/data/temitayo/staging/fintech-transaction-service/api/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/fintech-transaction-service/api" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/fintech-transaction-service/api/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/fintech-transaction-service/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/fintech-transaction-service/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/fintech-transaction-service/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/fintech-transaction-service/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
