// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public e;

    function setUp() public {
        e = new Event();
    }

    function testEmitValueChanged() public {
        // Start capturing events
        vm.expectEmit(true, false, false, true);
        emit Event.ValueChanged(address(this), 0, 42);

        // Call the function
        e.setValue(42);
    }
}
