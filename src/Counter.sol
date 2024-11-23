// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        //console.log("Number Before Increment",number);
        number++;
        //console.log("Number After Increment",number);
    }
    //  function divByZero() public view returns(uint){
    //     uint result = number/0;
    //     return result;
    // }
}
