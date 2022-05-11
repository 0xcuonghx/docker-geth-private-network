# Node 2
nohup geth 	--nousb \
			--datadir=$pwd \
			--syncmode 'full' \
			--port 30311 \
			--networkid 4649 \
			--miner.gasprice 0 \
			--miner.gastarget 470000000000 \
			--http \
			--http.addr 127.0.0.1 \
			--http.corsdomain '*' \
			--http.port 8546 \
			--http.vhosts '*' \
			--http.api admin,eth,miner,net,txpool,personal,web3 \
			--mine \
			--allow-insecure-unlock \
			--unlock "0xbC3BeA8E7468AaD3f2414d8B289B35b13b8c1749" \
			--password password.txt &

echo "Node 2 start"
