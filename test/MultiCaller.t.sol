// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MultiCaller} from "../src/MultiCaller.sol";

contract MultiCallerTest is Test {
    MultiCaller public multiCaller;

    function setUp() public {
        multiCaller = new MultiCaller();
    }

    function test_StartPrank() public {
        console.log("Owner Address:", address(this));

        // Start impersonating address(2)
        vm.startPrank(address(2));
        multiCaller.recordCall();
        multiCaller.recordCall();
        console.log("inside strartVMprank:", multiCaller.lastCaller());
        vm.stopPrank();

        // Assert values after the prank
        assertEq(
            multiCaller.lastCaller(),
            address(2),
            "Last caller should be address(2)"
        );
        assertEq(multiCaller.callCount(), 2, "Call count should be 2");

        // Further calls are made from the test's original address
        multiCaller.recordCall();
        console.log("Outisde strartVMprank:", multiCaller.lastCaller());
        assertEq(
            multiCaller.lastCaller(),
            address(this),
            "Last caller should be test contract address"
        );
    }

    function test_VMPrank() public {
        console.log("Owner Address:", address(this));

        // Start impersonating address(2)
        vm.prank(address(2));
        multiCaller.recordCall();
        console.log("first call:", multiCaller.lastCaller());
        multiCaller.recordCall();
        console.log("second call:", multiCaller.lastCaller());
        // Assert values after the prank
    }
}
