// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    
    Counter public counter;

    function setUp() public { 
        counter = new Counter();
        counter.setNumber(0);
    }

    //external or public,beforeEach

    function test_Increment1() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }
    //extra increment for beforEach functionality test
    //counter will again incretment from zero
    function test_Increment2() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    // function testFaildivByZero() public view {
    //     counter.divByZero();
    // }

    // function testFailIncrement() public {
    //     counter.increment();
    //     assertEq(counter.number(), 1);
    // }

    function testLogCounter() public view{
        console.log("Counter Value");
        uint value = counter.number();
        console.logUint(value);
    }

}
