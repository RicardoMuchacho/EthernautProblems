## Description

This is a coin flipping game where you need to build up your winning streak by guessing the outcome of a coin flip. To complete this level you'll need to use your psychic abilities to guess the correct outcome 10 times in a row.

## Interesting Problems Faced

The outcome of the coinflip can be predicted before calling the flip function, initially I thought this vulnerability can be exploited to always guess the right outcome with a script and call it 10 times manually.

Although it worked on tests, in the live sepolia testnet it was failing to achieve the 10 consecutive wins, I concluded this is do to a small delay between the script execution and the mining of the transaction wich would differ on the block hash.

## Solution

To solve the problem an attacker contract was deployed on sepolia with a function to make the flips with the predicted outcome, this way it worked because now the blockhash would be the one of the mined block.




