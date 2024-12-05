// test/DifferentialTest.t.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {GcdIterative} from "../src/GcdIterative.sol";
import {GcdRecursive} from "../src/GcdRecursive.sol";

contract DifferentialTest is Test {
    GcdIterative gcdIterative;
    GcdRecursive gcdRecursive;

    function setUp() public {
        gcdIterative = new GcdIterative();
        gcdRecursive = new GcdRecursive();
    }

    function testDifferentialGCD() public view {
        for (uint256 i = 1; i <= 100; i++) {
            for (uint256 j = 1; j <= 100; j++) {
                uint256 resultIterative = gcdIterative.calculateGCD(i, j);
                uint256 resultRecursive = gcdRecursive.calculateGCD(i, j);

                // Assert that both implementations produce the same result
                assertEq(resultIterative, resultRecursive, "Mismatch in GCD results");
            }
        }
    }
}
