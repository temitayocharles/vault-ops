# Service policy for virtual-vacation/media-gateway (staging)

path "kv/data/temitayo/staging/virtual-vacation/media-gateway" { capabilities = ["read"] }
path "kv/data/temitayo/staging/virtual-vacation/media-gateway/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/virtual-vacation/media-gateway" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/virtual-vacation/media-gateway/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/virtual-vacation/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/virtual-vacation/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/virtual-vacation/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/virtual-vacation/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
