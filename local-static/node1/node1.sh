# Node 1
nohup geth 	--nousb \
			--datadir=$pwd \
			--syncmode 'full' \
			--port 30310 \
			--networkid 4649 \
			--miner.gasprice 0 \
			--miner.gastarget 470000000000 \
			--http \
			--http.addr 127.0.0.1 \
			--http.corsdomain '*' \
			--http.port 8545 \
			--http.vhosts '*' \
			--http.api admin,eth,miner,net,txpool,personal,web3 \
			--mine \
			--allow-insecure-unlock \
			--unlock "0xF98D911179FaE8Bf17247435F2F4769e92fC3CA9" \
			--password password.txt &    
      
echo "Node 1 Start"
