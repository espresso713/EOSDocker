shopt -s expand_aliases

echo -e "\033[0;34m"start nodes"\033[0m"
nodeos -e -p eosio --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --http-validate-host 0 --contracts-console --verbose-http-errors 2>> /eos_log/nodeos.log &

sleep 5

alias cleos='/opt/eosio/bin/cleos --wallet-url http://127.0.0.1:8899'

cleos wallet create
cleos wallet import 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
cleos wallet import 5KECHccX9KdRAiM3zjNVGhvRcy6oRzyakTCxsvc3ftqfV6kTgqH
cleos wallet import 5J7Tpzb6PTrzf74U8jcaP27XgALq8kT2qdDQQR1CsxgJzqFVupp
cleos wallet import 5Hs47nDYRKd6tuhhTLcrHGUzwxdtwFh2bNqcEkTeUH1HqsBmGrk
cleos wallet import 5JmiMMG8SjyFPbskgsDCGLJ4f8kLQKHspkbio4wMjVb3Z3j1Ggq

cleos create account eosio mymultisig11 EOS6T5vys3RswNUeyxyNA7LpnwybtZTNBErWTFgab5eFf1ckzKDTJ EOS6T5vys3RswNUeyxyNA7LpnwybtZTNBErWTFgab5eFf1ckzKDTJ
cleos create account eosio partner11111 EOS7FogjxypbgEvLBKyD5bUieet7LXwbeknqG1v8KXjSpfGUztbsw EOS7FogjxypbgEvLBKyD5bUieet7LXwbeknqG1v8KXjSpfGUztbsw 
cleos create account eosio partner22222 EOS4xo5FTPPyGDoM5VCM1iRrLZPwrvNs2uoKmTEXHfQMPcHBak1UM EOS4xo5FTPPyGDoM5VCM1iRrLZPwrvNs2uoKmTEXHfQMPcHBak1UM 
cleos create account eosio partner33333 EOS8R6YyGPfKaRUz3Ubofvmyhcy7P1yifgZEPa6bgvvcLA957d4VZ EOS8R6YyGPfKaRUz3Ubofvmyhcy7P1yifgZEPa6bgvvcLA957d4VZ 

echo -e "\033[0;34m"eosio.bios"\033[0m"
cleos set contract eosio /contracts/eosio.bios -p eosio@active

echo -e "\033[0;34m"eosio.token"\033[0m"
cleos wallet import 5Jmsawgsp1tQ3GD6JyGCwy1dcvqKZgX6ugMVMdjirx85iv5VyPR
cleos create account eosio eosio.token EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4 EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4
cleos set contract eosio.token /contracts/eosio.token -p eosio.token@active
cleos push action eosio.token create '[ "eosio", "1000000000.0000 SYS"]' -p eosio.token@active
cleos push action eosio.token issue '[ "mymultisig11", "1000.0000 SYS", "memo" ]' -p eosio@active
cleos push action eosio.token issue '[ "partner11111", "100.0000 SYS", "memo" ]' -p eosio@active

echo -e "\033[0;34m"eosio.msig"\033[0m"
cleos create account eosio eosio.msig  EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4 EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4
cleos set contract eosio.msig /contracts/eosio.msig -p eosio.msig@active
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active


 


