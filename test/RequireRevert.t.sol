// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {RequireRevert} from "../src/RequireRevert.sol"; // Adjust this path as needed

contract RequireRevertTest is Test {
    RequireRevert public requireRevert;

    function setUp() public {
        requireRevert = new RequireRevert();
    }

    // Test for the require condition
    function testSetValueRequire() public {
        // Expect the require statement to revert with a specific message
        vm.expectRevert("Value must be greater than 10");

        // Call setValue with a value that should fail
        requireRevert.setValue(5);

        // Test the function with a valid value
        requireRevert.setValue(15);
        assertEq(requireRevert.value(), 15); // Check that value was updated correctly
    }

    // Test for the revert statement
    function testAlwaysRevert() public {
        // Expect a revert with the exact message
        vm.expectRevert("This function always reverts");

        // Call the function that should revert
        requireRevert.alwaysRevert();
    }
}
