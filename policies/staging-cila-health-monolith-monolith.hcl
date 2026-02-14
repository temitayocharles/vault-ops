# Service policy for cila-health-monolith/monolith (staging)

path "kv/data/temitayo/staging/cila-health-monolith/monolith" { capabilities = ["read"] }
path "kv/data/temitayo/staging/cila-health-monolith/monolith/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/cila-health-monolith/monolith" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/cila-health-monolith/monolith/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/cila-health-monolith/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/cila-health-monolith/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/cila-health-monolith/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/cila-health-monolith/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
