// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Delegate, Delegation} from "../Level6/Delegation.sol";

contract DelegationTest is Test {
     Delegate delegate;
     Delegation delegation;
     address public owner = vm.addr(1);
     address public attackerAddress = vm.addr(2);
    function setUp() public { 
        vm.prank(owner);
        delegate = new Delegate(owner);
        vm.prank(owner);
        delegation = new Delegation(address(delegate));
    }

    function test_deployedDelegation() public view {
        assert(address(delegate) != address(0));
        assert(address(delegation) != address(0));
        assert(delegation.owner() == owner);
    }

    function test_changeOwner() public {
        // address ownerBef = telephone.owner();
        // vm.prank(user);
        // attacker.changeOwner();

        // address ownerAft = telephone.owner();
        // assert((ownerBef == owner));
        // assert((ownerAft == user));
    }
}