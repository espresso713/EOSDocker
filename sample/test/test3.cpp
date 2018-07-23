#include <eosiolib/eosio.hpp>            
                                         
using namespace eosio;                   
                                         
class test3 : public eosio::contract {   
  public:                                
      using contract::contract;          
                                         
      /// @abi action                    
      void hi( account_name user ) {     
         print( "Hello, ", name{user} ); 
      }                                  
};                                       
                                         
EOSIO_ABI( test3, (hi) )                 