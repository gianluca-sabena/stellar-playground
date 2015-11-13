#!/bin/bash

sed -i -e 's/horizon-testnet.stellar.org/'"${HORIZON_API_HOST}"'/g' /opt/stellar-tutorials/network-explorer/main.js
sed -i -e 's/horizon-live.stellar.org/'"${HORIZON_API_HOST}"'/g' /opt/stellar-tutorials/network-explorer/main.js
sed -i -e 's/443/'"${HORIZON_API_PORT}"'/g' /opt/stellar-tutorials/network-explorer/main.js
sed -i -e 's/secure: true/secure: false/g' /opt/stellar-tutorials/network-explorer/main.js
cd /opt/stellar-tutorials/network-explorer
./node_modules/gulp/bin/gulp.js
