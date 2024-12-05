// contracts/GcdIterative.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract GcdIterative {
    function calculateGCD(uint256 a, uint256 b) public pure returns (uint256) {
        while (b != 0) {
            uint256 temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
}
