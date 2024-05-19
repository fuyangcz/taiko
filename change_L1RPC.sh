cd #HOME
cd simple-taiko-node

read -p "请输入BlockPI holesky HTTP链接: " l1_endpoint_http

read -p "请输入BlockPI holesky WS链接: " l1_endpoint_ws

sed -i "s|L1_ENDPOINT_HTTP=.*|L1_ENDPOINT_HTTP=${l1_endpoint_http}|" .env
sed -i "s|L1_ENDPOINT_WS=.*|L1_ENDPOINT_WS=${l1_endpoint_ws}|" .env

docker compose --profile l2_execution_engine down
docker stop simple-taiko-node-taiko_client_proposer-1 && docker rm simple-taiko-node-taiko_client_proposer-1
docker compose --profile proposer up -d
