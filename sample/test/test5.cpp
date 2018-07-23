#include <eosiolib/eosio.hpp>            
                                         
using namespace eosio;                   
                                         
class test5 : public eosio::contract {   
  public:                                
      using contract::contract;          
                                         
      /// @abi action                    
      void hi3( account_name user ) {     
         print( "Hello, ", name{user} ); 
      }                                  
};                                       
                                         
EOSIO_ABI( test5, (hi3) )                 