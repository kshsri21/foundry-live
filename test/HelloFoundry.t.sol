// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";

contract HelloFoundry is Test {
    
    function setUp() public {
    }

    function testMeFoundry1() public pure {
        console.log("testMeFoundry");
    }
     function meFoundry() public pure {
        console.log("meFoundry");
    }
}
