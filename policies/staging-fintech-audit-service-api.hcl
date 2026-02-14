# Service policy for fintech-audit-service/api (staging)

path "kv/data/temitayo/staging/fintech-audit-service/api" { capabilities = ["read"] }
path "kv/data/temitayo/staging/fintech-audit-service/api/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/fintech-audit-service/api" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/fintech-audit-service/api/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/fintech-audit-service/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/fintech-audit-service/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/fintech-audit-service/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/fintech-audit-service/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
