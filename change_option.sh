cd #HOME
cd simple-taiko-node

read -p "请输入BlockPI holesky HTTP链接: " l1_endpoint_http

read -p "请输入BlockPI holesky WS链接: " l1_endpoint_ws

read -p "请输入Beacon Holskey RPC（如果你没有搭建的话，请输入:http://195.201.170.121:5052或者http://188.40.51.249:5052即可）链接: " l1_beacon_http

read -p "请输入Prover RPC 链接(目前可用任意选一个:http://kenz-prover.hekla.kzvn.xyz:9876或者http://hekla.stonemac65.xyz:9876): " prover_endpoints

read -p "请确认是否作为提议者（可选true或者false，目前prover 节点已经工作，请输入true，更新时间2024.4.26 15.30）: " enable_proposer

read -p "请确认是否关闭P2P同步（可选true或者false，请选择false开启）: " disable_p2p_sync

read -p "请输入EVM钱包私钥: " l1_proposer_private_key

read -p "请输入EVM钱包地址: " l2_suggested_fee_recipient

# 将用户输入的值写入.env文件
sed -i "s|L1_ENDPOINT_HTTP=.*|L1_ENDPOINT_HTTP=${l1_endpoint_http}|" .env
sed -i "s|L1_ENDPOINT_WS=.*|L1_ENDPOINT_WS=${l1_endpoint_ws}|" .env
sed -i "s|L1_BEACON_HTTP=.*|L1_BEACON_HTTP=${l1_beacon_http}|" .env
sed -i "s|ENABLE_PROPOSER=.*|ENABLE_PROPOSER=${enable_proposer}|" .env
sed -i "s|L1_PROPOSER_PRIVATE_KEY=.*|L1_PROPOSER_PRIVATE_KEY=${l1_proposer_private_key}|" .env
sed -i "s|L2_SUGGESTED_FEE_RECIPIENT=.*|L2_SUGGESTED_FEE_RECIPIENT=${l2_suggested_fee_recipient}|" .env
sed -i "s|DISABLE_P2P_SYNC=.*|DISABLE_P2P_SYNC=${disable_p2p_sync}|" .env
sed -i "s|PROVER_ENDPOINTS=.*|PROVER_ENDPOINTS=${prover_endpoints}|" .env


docker compose --profile l2_execution_engine down
docker stop simple-taiko-node-taiko_client_proposer-1 && docker rm simple-taiko-node-taiko_client_proposer-1
docker compose --profile proposer up -d
