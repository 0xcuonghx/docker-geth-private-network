#!/bin/sh

if [ ! -e /root/.ethereum/keystore ]; then
    apk add --no-cache expect

    geth --nousb account import /root/.ethereum/key.prv --password /root/.ethereum/password.txt

    expect -c"
spawn clef init
expect \"proceed:\"
send \"ok\n\"
expect \"Password: \"
send \"password12\n\"
expect \"Repeat password: \"
send \"password12\n\"
expect \"A master seed has been generated\"
wait
" -c"
spawn clef attest `sha256sum /root/.clef/rules.js | cut -d" " -f1`
expect \"proceed:\"
send \"ok\n\"
expect \"Password:\"
send \"password12\n\"
expect \"Ruleset attestation updated\"
wait
" -c"
spawn clef setpw $SIGNER_ADDRESS
expect \"proceed:\"
send \"ok\n\"
expect \"Password: \"
send \"`cat /root/.ethereum/password.txt`\n\"
expect \"Repeat password: \"
send \"`cat /root/.ethereum/password.txt`\n\"
expect \"Password: \"
send \"password12\n\"
wait
"
fi

exec expect -c"
spawn clef --keystore /root/.ethereum/keystore --chainid 1337 --nousb --auditlog \"\" --rules /root/.clef/rules.js
expect \"proceed:\"
send \"ok\n\"
expect \"Please enter the password to decrypt the master seed\"
expect \"> \"
send \"password12\n\"
expect \"IPC endpoint opened\"
while { 1 } {
  expect eof
}
"
