cd #HOME
cd simple-taiko-node
docker compose --profile l2_execution_engine down -v
docker stop simple-taiko-node-taiko_client_proposer-1 && docker rm simple-taiko-node-taiko_client_proposer-1
cd #HOME
rm -rf simple-taiko-node
