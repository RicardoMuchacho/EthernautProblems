## Description

Take ownership of the contract

## Solution

The vulnerability lies within the use of tx.origin as a check on the changeOwner function, when using a contract as an intermediary the msg.sender will be the contract and the tx.origin will be the my address, this will pass the check and set my address as the owner.




