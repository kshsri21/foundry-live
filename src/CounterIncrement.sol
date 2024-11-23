// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract CounterIncrement {
    uint256 public count;
    uint256 public constant MAX_COUNT = 10;

    // Increment the counter
    function increment() external {
        if (count < MAX_COUNT) {
            count += 1;
        }
    }
    //this will fail the invariant test
    // function loopIncrement() external{
    //     for(uint i=0;i<=MAX_COUNT;i++){
    //         count++;
    //     }
    // }

    // Reset the counter to zero
    function reset() external {
        count = 0;
    }
}