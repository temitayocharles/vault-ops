# Platform policy for platform-tools/minio (staging)

path "kv/data/temitayo/staging/platform-tools/minio" { capabilities = ["read"] }
path "kv/data/temitayo/staging/platform-tools/minio/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/platform-tools/minio" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/platform-tools/minio/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/platform-tools/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/platform-tools/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/platform-tools/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/platform-tools/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
