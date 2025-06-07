// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Telephone} from "../Level4/Telephone.sol";
import {TelephoneAttacker} from "../Level4/attacker.sol";

contract TelephoneTest is Test {
     Telephone telephone;
     TelephoneAttacker attacker;
     address public owner = vm.addr(1);
     address public user = vm.addr(2);
    function setUp() public { 
        vm.prank(owner);
        telephone = new Telephone();
        attacker = new TelephoneAttacker(address(telephone));
    }

    function test_deployed() public view {
        assert(address(telephone) != address(0));
        assert(address(attacker) != address(0));
        assert(telephone.owner() == owner);
    }

    function test_changeOwner() public {
        address ownerBef = telephone.owner();
        vm.prank(user);
        attacker.changeOwner();

        address ownerAft = telephone.owner();
        assert((ownerBef == owner));
        assert((ownerAft == user));
    }
}