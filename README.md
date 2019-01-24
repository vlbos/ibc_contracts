bosibc.contracts
-----

the IBC project consists of two contracts and one plugin: 
[ibc.chain](https://github.com/boscore/bosibc.contracts/tree/master/ibc.chain),
[ibc.token](https://github.com/boscore/bosibc.contracts/tree/master/ibc.token) and ibc_plugin, 
because ibc_plugin is required for each chain and run as a relay node, and because the underlying source code of BOS 
and EOS is slightly different, a separate plugin repository needs to be maintained for each chain, the plugin 
repository for eosio is [ibc_plugin_eos](https://github.com/boscore/ibc_plugin_eos), 
for bos is [ibc_plugin_bos](https://github.com/boscore/ibc_plugin_bos).
If you want to use IBC between unmodified eosio chains, for example between kylin testnet and cryptolions testnet
or eosio mainnet,you just need to use ibc_plugin_eos, the difference between ibc_plugin_eos and ibc_plugin_bos is 
simply that, ibc_plugin_eos is based on eosio, ibc_plugin_bos is based on boscore, the ibc_plugin source code of 
the two repository and the modifications to other plugins(chain_plugin and net_plugin) are exactly the same.


These two contracts are developed entirely on eosio.cdt, so you can compile them using eosio.cdt or bos.cdt,
bos.cdt only adds some contract interfaces, the existing interface of eosio.cdt has not been changed.
eosio.cdt and bos.cdt use different versions, so you should use following command to compile:  
if your host is installed eosio.cdt, compile with the following command  
`$ build.sh eosio.cdt`  
if your host is installed bos.cdt, compile with the following command  
`$ build.sh bos.cdt`  
