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

cleos create account eosio inita EOS6T5vys3RswNUeyxyNA7LpnwybtZTNBErWTFgab5eFf1ckzKDTJ EOS6T5vys3RswNUeyxyNA7LpnwybtZTNBErWTFgab5eFf1ckzKDTJ
cleos create account eosio initb EOS7FogjxypbgEvLBKyD5bUieet7LXwbeknqG1v8KXjSpfGUztbsw EOS7FogjxypbgEvLBKyD5bUieet7LXwbeknqG1v8KXjSpfGUztbsw 
cleos create account inita tic.tac.toe EOS4xo5FTPPyGDoM5VCM1iRrLZPwrvNs2uoKmTEXHfQMPcHBak1UM EOS4xo5FTPPyGDoM5VCM1iRrLZPwrvNs2uoKmTEXHfQMPcHBak1UM --permission inita@active

eosiocpp -g tic_tac_toe.abi tic_tac_toe.hpp
eosiocpp -o tic_tac_toe.wast tic_tac_toe.cpp