#!/bin/bash
shopt -s expand_aliases

echo -e "\033[31m"start nodes"\033[0m"

nodeos -e -p eosio --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --http-validate-host 0 --contracts-console 2>> /eos_log/nodeos.log &

sleep 5

alias cleos='/opt/eosio/bin/cleos --wallet-url http://127.0.0.1:8899'

cleos wallet create
cleos wallet import 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
cleos set contract eosio /contracts/eosio.bios -p eosio@active

cleos wallet import 5Jmsawgsp1tQ3GD6JyGCwy1dcvqKZgX6ugMVMdjirx85iv5VyPR

echo -e "\033[31m"create account"\033[0m"
cleos create account eosio user EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4 EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4
cleos create account eosio tester EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4 EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4

echo -e "\033[31m"eosio.token"\033[0m"
cleos create account eosio eosio.token EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4 EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4
cleos set contract eosio.token /contracts/eosio.token -p eosio.token@active
cleos push action eosio.token create '[ "eosio", "1000000000.0000 SYS"]' -p eosio.token@active
cleos push action eosio.token issue '[ "user", "100.0000 SYS", "memo" ]' -p eosio@active
cleos push action eosio.token transfer '[ "user", "tester", "25.0000 SYS", "m" ]' -p user@active

echo -e "\033[31m"exchange"\033[0m"
cleos create account eosio exchange  EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4 EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4
cleos set contract exchange /contracts/exchange -p exchange@active

echo -e "\033[31m"eosio.msig"\033[0m"
cleos create account eosio eosio.msig  EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4 EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4
cleos set contract eosio.msig /contracts/eosio.msig -p eosio.msig@active

eosiocpp -n hello
cd /work/hello
eosiocpp -o hello.wast hello.cpp
eosiocpp -g hello.abi hello.cpp
cleos create account eosio hello.code EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4 EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4
cleos set contract hello.code ../hello -p hello.code@active