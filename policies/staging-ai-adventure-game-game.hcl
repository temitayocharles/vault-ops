# Service policy for ai-adventure-game/game (staging)

path "kv/data/temitayo/staging/ai-adventure-game/game" { capabilities = ["read"] }
path "kv/data/temitayo/staging/ai-adventure-game/game/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/ai-adventure-game/game" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/ai-adventure-game/game/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/ai-adventure-game/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/ai-adventure-game/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/ai-adventure-game/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/ai-adventure-game/_global/*" { capabilities = ["list"] }

path "kv/data/temitayo/staging/_global" { capabilities = ["read"] }
path "kv/data/temitayo/staging/_global/*" { capabilities = ["read"] }
path "kv/metadata/temitayo/staging/_global" { capabilities = ["list"] }
path "kv/metadata/temitayo/staging/_global/*" { capabilities = ["list"] }
