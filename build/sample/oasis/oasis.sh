shopt -s expand_aliases

echo -e "\033[31m"start nodes"\033[0m"
nodeos -e -p eosio --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --http-validate-host 0 --contracts-console 2>> /eos_log/nodeos.log &

sleep 5

alias cleos='/opt/eosio/bin/cleos --wallet-url http://127.0.0.1:8899'

cleos wallet create
cleos wallet import 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
cleos wallet import 5KECHccX9KdRAiM3zjNVGhvRcy6oRzyakTCxsvc3ftqfV6kTgqH
cleos wallet import 5J7Tpzb6PTrzf74U8jcaP27XgALq8kT2qdDQQR1CsxgJzqFVupp
cleos wallet import 5Hs47nDYRKd6tuhhTLcrHGUzwxdtwFh2bNqcEkTeUH1HqsBmGrk
cleos wallet import 5JmiMMG8SjyFPbskgsDCGLJ4f8kLQKHspkbio4wMjVb3Z3j1Ggq

cleos create account eosio inita EOS6T5vys3RswNUeyxyNA7LpnwybtZTNBErWTFgab5eFf1ckzKDTJ EOS6T5vys3RswNUeyxyNA7LpnwybtZTNBErWTFgab5eFf1ckzKDTJ
cleos create account eosio initb EOS7FogjxypbgEvLBKyD5bUieet7LXwbeknqG1v8KXjSpfGUztbsw EOS7FogjxypbgEvLBKyD5bUieet7LXwbeknqG1v8KXjSpfGUztbsw 
cleos create account eosio market EOS8R6YyGPfKaRUz3Ubofvmyhcy7P1yifgZEPa6bgvvcLA957d4VZ EOS8R6YyGPfKaRUz3Ubofvmyhcy7P1yifgZEPa6bgvvcLA957d4VZ
cleos create account initb initc EOS4xo5FTPPyGDoM5VCM1iRrLZPwrvNs2uoKmTEXHfQMPcHBak1UM EOS4xo5FTPPyGDoM5VCM1iRrLZPwrvNs2uoKmTEXHfQMPcHBak1UM --permission initb@active
 
eosiocpp -g Players.abi Players.hpp
eosiocpp -o Players.wast Players.cpp

eosiocpp -g Marketplace.abi Marketplace.hpp
eosiocpp -o Marketplace.wast Marketplace.cpp


echo -e "\033[32m"cleos set contract inita /contracts/eosio.token /contracts/eosio.token/eosio.token.wast /contracts/eosio.token/eosio.token.abi"\033[0m"
cleos set contract inita /contracts/eosio.token /contracts/eosio.token/eosio.token.wast /contracts/eosio.token/eosio.token.abi

echo -e "\033[32m"cleos push action inita create '{"issuer":"inita","maximum_supply":"1000000.0000 OAS","can_freeze":"0","can_recall":"0","can_whitelist":"0"}' -p inita"\033[0m"
cleos push action inita create '{"issuer":"inita","maximum_supply":"1000000.0000 OAS","can_freeze":"0","can_recall":"0","can_whitelist":"0"}' -p inita

echo -e "\033[32m"cleos set contract inita . ./Players.wast ./Players.abi"\033[0m"
cleos set contract inita . ./Players.wast ./Players.abi

echo -e "\033[32m"cleos set contract market . ./Marketplace.wast ./Marketplace.abi"\033[0m"
cleos set contract market . ./Marketplace.wast ./Marketplace.abi

