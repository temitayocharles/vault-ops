# Service policy for virtual-vacation/backend (staging)

path "kv/data/temitayo/staging/virtual-vacation/backend" { capabilities = ["read"] }
path "kv/data/temitayo/staging/virtual-vacation/backend/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/virtual-vacation/backend" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/virtual-vacation/backend/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/virtual-vacation/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/virtual-vacation/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/virtual-vacation/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/virtual-vacation/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
