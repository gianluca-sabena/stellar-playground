Docker-compose for a one node stellar core with full horizon-api support
https://www.stellar.org/
# How to run

##Requirements

* Install docker and docker-compose
* Update your /etc/hosts file and add dockerhost to docker-engine ip (on linux it is probably 127.0.0.1, on mac os x with kitematic it is 192.168.99.100). Alternatively tou can edit docker-compose.yml and use your ip address

##Run

```
cd stellar-1-node
docker-compose build
docker-compose up
```

#Root account

A private stellar network has a special root user that owns all lumens. In order to create a new account you must move some lumens from root to a specific account.

Root address: http://dockerhost:11626/testacc?name=root (id field)
Root secret: search for string "Root account seed" in docker-compose console log

In order to create a user follow this tutorial where

* Install node version 0.10.x (mandatory)
* Install npm
* Install stellar js sdk ```npm install --save stellar-sdk```
* Create a file from https://www.stellar.org/developers/learn/integration-guides/building-blocks/account-management.html
* Generate a new user adress and secret with  network-explorer generate http://dockerhost:7000/
* Note that fundingAccount is the above root account

#Api and frontend

* http://dockerhost:3000 -> Stellar laboratory (https://github.com/stellar/laboratory)
* http://dockerhost:7000 -> Stellar network explorer (https://github.com/stellar/stellar-tutorials/tree/master/network-explorer)
* http://dockerhost:8000 -> Stellar horizon api (https://github.com/stellar/horizon)
* http://dockerhost:11626/info -> Stellar core http deamon (https://github.com/stellar/stellar-core)



#Note:

Aa of today (November 2015) stellar horizon api requires stellar-importer to move data from stellar core database to stellar horizon. Future releases of horizon api will not require horizon-importer anymore.


# Resources

* https://www.stellar.org/developers/learn/
* stellar-core http api, see custom testnet http command and special root user https://www.stellar.org/developers/stellar-core/learn/commands.html

