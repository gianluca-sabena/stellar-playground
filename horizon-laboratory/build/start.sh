#!/bin/bash

cd /opt/laboratory
sed -i -e 's/https\:\/\/horizon-testnet.stellar.org/'"http\:\/\/${HORIZON_API_HOST}:${HORIZON_API_PORT}"'/g' /opt/laboratory/src/stores/ExplorerStore.js
cd /opt/stellar-tutorials/network-explorer
./node_modules/gulp/bin/gulp.js
