# Sui/Move Community Modules

This repository contains code used throughout the Sui Community Modules.


Notes:

Check grouped balances:

`sui client balance`

Check raw balance:

`sui client split-coin --coin-id 0xbe140061ee69ce2b64fdeaf495e0e192fc153c0d35d132c79ddab85e96803c05 --amounts 12`

Publish: 

`sui client publish`

Interacting with smart contract:

`sui client call --package 0x93f5729e1ef1f06934718360c3010ea27bc7173af0c83bb5fc1ce8bffd33f250 --module simple_nft --function create_simple_nft --args "My Workshop NFT" ` or `sui client call --package 0xd041461ce1a69a9de29d24b591059ae203fea25cf5da5c299b312be5dae52d58 --module hero --function create_hero --args "My Workshop NFT" "https://encrypted-tbn0.gstatic.com/images\?q\=tbn:ANd9GcRZu4FFNg5LkQT3lQoPipDt96lGO7tpG1bNbw\&s" 23`


Transfer to own wallet:

`sui client transfer --to 0xc8aa61129b23b4fed08a2765a2cd9b0805af7df102366332411673efff88d14d --object-id 0xbe140061ee69ce2b64fdeaf495e0e192fc153c0d35d132c79ddab85e96803c05`



For debugging, split own objects:

`sui client ptb --split-coins gas "[100000000]" --assign new_coin --transfer-objects "[new_coin]" @0xbe140061ee69ce2b64fdeaf495e0e192fc153c0d35d132c79ddab85e96803c05`


Testing:

`sui move test`



