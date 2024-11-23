// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {InvariantExample} from "../src/InvariantExample.sol";

contract InvariantExampleTest is Test {
    InvariantExample private target;

    function setUp() public {
        target = new InvariantExample();
    }

    function invariant_votingStatus_never_true() public view {
        assertEq(target.votingStatus(), false);
    }
}