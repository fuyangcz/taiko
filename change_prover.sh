cd #HOME
cd simple-taiko-node

read -p "请输入Prover RPC 链接(目前可用任意选一个:http://kenz-prover.hekla.kzvn.xyz:9876或者http://hekla.stonemac65.xyz:9876): " prover_endpoints

sed -i "s|PROVER_ENDPOINTS=.*|PROVER_ENDPOINTS=${prover_endpoints}|" .env

docker compose --profile l2_execution_engine down
docker stop simple-taiko-node-taiko_client_proposer-1 && docker rm simple-taiko-node-taiko_client_proposer-1

docker compose --profile proposer up -d
