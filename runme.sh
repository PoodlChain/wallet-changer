#!/bin/bash
#set -x

set -e


GREEN='\033[0;32m'
RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

######################### A simple bash scrip to replace the wallet created by node-setup with your own wallet using private key ###################

echo -e "\n\n\t${ORANGE} ######################### A simple bash scrip to replace the wallet created by node-setup with your own wallet using private key ###################"
echo -e "\n\t${ORANGE} ## This file must be run from the path: /root/Core-Blockchain   Make sure that you place this file under the given directory ##"


echo -e "\n\n\t${RED} Removing the current wallet${GREEN}\n"

rm -rf ./chaindata/node1/keystore
rm -rf ./chaindata/node1/pass.txt

read -s -p "         Now enter a new password for the new wallet: " password
echo $password >./chaindata/node1/pass.txt


./node_src/build/bin/geth --datadir ./chaindata/node1 account import ./pk.txt --password ./chaindata/node1/pass.txt

echo -e "\n\n\t${GREEN} All set. You just successfully changed your wallet!"