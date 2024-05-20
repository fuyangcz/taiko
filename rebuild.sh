cd simple-taiko-node
docker compose  --profile l2_execution_engine down
docker stop simple-taiko-node-taiko_client_proposer-1 && docker rm simple-taiko-node-taiko_client_proposer-1
#全部停止后，再执行
docker compose --profile l2_execution_engine up -d
docker compose --profile proposer up -d
