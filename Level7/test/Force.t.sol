// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Force} from "../src/Force.sol";

contract MockContract {
    address _target;

    constructor(address target_) {
        _target = target_;
    }

    function attack(uint256 amount_) public returns(bool) {
        (bool success ,) = _target.call{value: amount_}("");
        return success;
    }
}

contract ForceTest is Test {
    Force public forceContract;
    MockContract public mockContract;

    function setUp() public {
        forceContract = new Force();
        mockContract = new MockContract(address(forceContract));
    }

    function test_forceDeployed() public view {
        assertNotEq(address(forceContract), address(0));
    }

    function test_forceAttack() public {
        vm.deal(address(this), 1 ether);
        vm.deal(address(mockContract), 2 ether);
        mockContract.attack(0.1 ether);

        console.log(address(forceContract).balance);
    }

    function testFuzz_force(uint256 x) public {

        (bool success ,) = address(forceContract).call{value: x}("");
        if(!success) revert();
    }
}
