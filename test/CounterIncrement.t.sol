// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CounterIncrement} from "../src/CounterIncrement.sol";

contract CounterInvariantTest is Test {
    CounterIncrement private target;

    function setUp() public {
        target = new CounterIncrement();
    }

    // Invariant: count should always be <= MAX_COUNT
    function invariant_count_never_exceeds_max() public view{
        assertLe(target.count(), target.MAX_COUNT());
    }
}

//Using invariant testing, we confirm that no sequence of actions on the Counter contract, 
//like repeatedly calling increment or reset, will make count exceed MAX_COUNT.