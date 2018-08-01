shopt -s expand_aliases

alias cleos='/opt/eosio/bin/cleos --wallet-url http://127.0.0.1:8899'

echo -e "\033[0;34m"cleos set account permission"\033[0m"
#He specifies the active permission for each individual account so that their respective owner keys aren’t required
#by using accounts the account owners are given the flexibility the update their keys and authority structure without having to update the mymultisig11 authorities
cleos set account permission mymultisig11 active '{"threshold":2,"keys":[],"accounts":[{"permission":{"actor":"partner11111","permission":"active"},"weight":1},{"permission":{"actor":"partner22222","permission":"active"},"weight":1},{"permission":{"actor":"partner33333","permission":"active"},"weight":1}],"waits":[]}' owner -p mymultisig11@owner

#Once the ownership authority has changed to a multisig format Bob will require his team to participate whenever they need to change any additional authorities in the future
#cleos set account permission mymultisig11 owner '{"threshold":2,"keys":[],"accounts":[{"permission":{"actor":"partner11111","permission":"owner"},"weight":1},{"permission":{"actor":"partner22222","permission":"owner"},"weight":1},{"permission":{"actor":"partner33333","permission":"owner"},"weight":1}],"waits":[]}' -p mymultisig11@owner

#The other team members may review and approve or unapprove the transaction
echo -e "\033[0;34m"cleos multisig propose"\033[0m"
cleos multisig propose payme '[{"actor": "partner22222", "permission": "active"},{"actor": "partner33333", "permission": "active"}]' '[{"actor": "mymultisig11", "permission": "active"}]' eosio.token transfer '{"from":"mymultisig11", "to":"partner11111", "quantity":"25.0000 SYS", "memo":"Pay partner11111 some money"}' -p partner11111@active

echo -e "\033[0;34m"cleos multisig review"\033[0m"
cleos multisig review partner11111 payme 

echo -e "\033[0;34m"cleos multisig approve"\033[0m"
cleos multisig approve partner11111 payme '{"actor": "partner22222", "permission": "active"}' -p partner22222@active	

echo -e "\033[0;34m"cleos multisig approve"\033[0m"
cleos multisig approve partner11111 payme '{"actor": "partner33333", "permission": "active"}' -p partner33333@active		

echo -e "\033[0;34m"cleos multisig exec"\033[0m"
cleos multisig exec partner11111 payme -p partner11111@active								 

#echo -e "\033[0;34m"cleos get currency balance eosio.token"\033[0m"
#cleos get currency balance eosio.token partner11111
#cleos get currency balance eosio.token mymultisig11

#transfer : p0 -> p1, p2, p3, p4
#2/3 : p0(p1, p2, p3) 
#proposal - p0, p1, p2, p3, p4
#executor - p0, p1, p2, p3, p4