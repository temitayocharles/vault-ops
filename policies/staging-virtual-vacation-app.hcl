# Service policy for virtual-vacation/app (staging)

path "kv/data/temitayo/staging/virtual-vacation/virtual-vacation" { capabilities = ["read"] }
path "kv/data/temitayo/staging/virtual-vacation/virtual-vacation/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/virtual-vacation/virtual-vacation" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/virtual-vacation/virtual-vacation/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/virtual-vacation/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/virtual-vacation/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/virtual-vacation/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/virtual-vacation/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
