#!/bin/bash

export DATABASE_USER="${HORIZON_POSTGRESQL_1_ENV_POSTGRES_USER}"
export DATABASE_URL="postgres://${HORIZON_POSTGRESQL_1_ENV_POSTGRES_USER}:${HORIZON_POSTGRESQL_1_ENV_POSTGRES_PASSWORD}@${HORIZON_POSTGRESQL_1_PORT_5432_TCP_ADDR}:${HORIZON_POSTGRESQL_1_PORT_5432_TCP_PORT}/horizon?sslmode=disable"
export STELLAR_CORE_DATABASE_URL="postgres://postgres:${STELLAR_POSTGRESQL_1_ENV_POSTGRES_PASSWORD}@${STELLAR_POSTGRESQL_1_PORT_5432_TCP_ADDR}:${STELLAR_POSTGRESQL_1_PORT_5432_TCP_PORT}/stellar?sslmode=disable"
export STELLARD_URL="http://${STELLAR_NODE_1_PORT_11626_TCP_ADDR}:${STELLAR_NODE_1_PORT_11626_TCP_PORT}"


# Start api
echo " * Start horizon api ... (whait 15 second for importer to create db)"
sleep 15
echo " * ------- ------ ------ "
curl "${STELLARD_URL}/info"
cd /opt/horizon/bin
./horizon \
  --db-url=${DATABASE_URL} \
  --stellar-core-db-url=${STELLAR_CORE_DATABASE_URL} \
  --stellar-core-url="${STELLARD_URL}" \
  --log-level="debug" \
  --port=8000
