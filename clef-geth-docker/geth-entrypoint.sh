#!/bin/sh
sleep 3

CLEF_IPC_FILE="/root/.clef/clef.ipc"

while [ ! -e $CLEF_IPC_FILE ]
do
sleep 20
done

if [ ! -e /root/.ethereum/geth/chaindata ]; then
    geth --nousb init /genesis.json
    geth --nousb account import /root/.ethereum/key.prv --password /root/.ethereum/password.txt
fi

geth --syncmode=full --networkid 1337 --nousb --http --http.addr=0.0.0.0 --http.corsdomain="*" --http.vhosts=* --http.api="eth,net,web3,txpool,debug,clique" --ws --ws.addr="0.0.0.0" --ws.origins="*" --ws.api="eth,net,web3,txpool,debug" --mine --maxpendpeers 10 --txpool.globalqueue=50000 --txpool.accountqueue=50000 --txpool.accountslots=50000 --txpool.globalslots=50000 --txpool.nolocals --signer /root/.clef/clef.ipc
