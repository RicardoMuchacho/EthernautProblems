## Description

The goal of this level is for you to claim ownership of the instance you are given.

  Things that might help

- Look into Solidity's documentation on the delegatecall low level function, how it works, how it can be used to delegate operations to on-chain libraries, and what implications it has on execution scope.
- Fallback methods
- Method ids

## Solution


## Commands

await contract.owner()
'0x73379d8B82Fda494ee59555f333DF7D44483fD58'

// Runned attacker script on foundry 

await contract.owner()
'0xc717879FBc3EA9F770c0927374ed74A998A3E2Ce'

