// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {SimpleFFIContract} from "../src/SimpleFFIContract.sol"; // Adjust the import path as necessary

contract SimpleFFIContractTest is Test {
    SimpleFFIContract public simpleContract;

    function setUp() public {
        simpleContract = new SimpleFFIContract();
    }

    function testSetValueWithFFI() public {
        // Use FFI to execute a shell command and get a random number
        string[] memory inputs = new string[](3);
        inputs[0] = "openssl";
        inputs[1] = "rand";
        inputs[2] = "-hex 4";

        bytes memory result = vm.ffi(inputs);

        // Convert the result to a uint256
        uint256 randomValue = uint256(bytes32(result)) % 100; // Modulo to limit the range, e.g., 0-99

        // Set the random value in the contract
        simpleContract.setValue(randomValue);

        // Assert that the contract's value is equal to the random value
        assertEq(simpleContract.getValue(), randomValue);
    }
}
