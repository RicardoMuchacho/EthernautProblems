## Description

Unlock the vault to pass the level!

## Solution

All information can be viewed onchain, so to find the password I went to the transaction that created the vault smart contract and decoded the bytecode, at the end there was an hex encoded string with the argument, when decoded it reads: "A very strong secret password :)"


An even better solution is to use the command:

$ cast storage 0x4e75479b0ad645Acc7ba899d36E25a2950cf8748 1 --rpc-url sepolia

This command allows to read values in contract storage slots, so with the correct slot we can see the _password value
