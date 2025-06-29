## Description

Some contracts will simply not take your money ¯\_(ツ)_/¯

The goal of this level is to make the balance of the contract greater than zero.

  Things that might help:

Fallback methods
Sometimes the best way to attack a contract is with another contract.
See the "?" page above, section "Beyond the console"

## Solution

The solution is to use the selfdestruct function to send ether to the contract since this cannot be stopped, for this reason we shouldn't logics like balance == 0.

