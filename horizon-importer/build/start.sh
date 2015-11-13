#!/bin/bash

export DATABASE_URL="postgres://${HORIZON_POSTGRESQL_1_ENV_POSTGRES_USER}:${HORIZON_POSTGRESQL_1_ENV_POSTGRES_PASSWORD}@${HORIZON_POSTGRESQL_1_PORT_5432_TCP_ADDR}:${HORIZON_POSTGRESQL_1_PORT_5432_TCP_PORT}/horizon?sslmode=disable"
export STELLAR_CORE_DATABASE_URL="postgres://postgres:${STELLAR_POSTGRESQL_1_ENV_POSTGRES_PASSWORD}@${STELLAR_POSTGRESQL_1_PORT_5432_TCP_ADDR}:${STELLAR_POSTGRESQL_1_PORT_5432_TCP_PORT}/stellar?sslmode=disable"
export IMPORT_HISTORY=true

# alternative db creation script https://raw.githubusercontent.com/stellar/horizon-importer/master/db/structure.sql

# Init postgres db
echo " * Whait 10 seconds for postgresql to start ... "
sleep 10
echo " * Init postgresql database ..."
#psql $HORIZON_DB_URL < /opt/horizon/src/github.com/stellar/horizon/test/scenarios/base-horizon.sql
#psql ${CORE_DB_URL} < /opt/horizon/src/github.com/stellar/horizon/test/scenarios/base-core.sql

cd /opt/horizon-importer
gem install bundler --conservative
rake db:create && rake db:migrate
./bin/rails server


