# Service policy for fintech-infrastructure/postgres (staging)

path "kv/data/temitayo/staging/fintech-infrastructure/postgres" { capabilities = ["read"] }
path "kv/data/temitayo/staging/fintech-infrastructure/postgres/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/fintech-infrastructure/postgres" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/fintech-infrastructure/postgres/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/fintech-infrastructure/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/fintech-infrastructure/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/fintech-infrastructure/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/fintech-infrastructure/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
