// contracts/GcdRecursive.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract GcdRecursive {
    function calculateGCD(uint256 a, uint256 b) public pure returns (uint256) {
        if (b == 0) return a;
        return calculateGCD(b, a % b);
    }
}
