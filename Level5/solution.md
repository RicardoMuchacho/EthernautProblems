## Description

The goal of this level is for you to hack the basic token contract below.

You are given 20 tokens to start with and you will beat the level if you somehow manage to get your hands on any additional tokens. Preferably a very large amount of tokens.


## Solution

The vulnerability comes from the require in the transfer function which causes an underflow when transfering more tokens than the user balance, thus wrapping around to the max value of uint256 and ending up with a big amount of tokens. 

Good fixes would be:

-Adjust the require to: balances[msg.sender] >= _value.
-Upgrade solidity version >0.8 where this would cause a revert.
-Check for under/overflow with safeMath or manually

## Commands Used on ethernaut console
contract.transfer(instance, 21)
(await contract.balanceOf(player)).toString()


