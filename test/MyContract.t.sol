// MyContractTest.t.sol
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {MyContract} from "../src/MyContract.sol";

contract MyContractTest is Test {
    MyContract myContract;

    function setUp() public {
        myContract = new MyContract();
    }

    function testSetValueEmitsEvent() public {
        uint256 newValue = 42;
        uint256 oldValue = myContract.value();
        myContract.setValue(newValue);
        // Listen for the emitted event
        vm.expectEmit(true, true, true, true);
        // emit MyContract.ValueChanged(oldValue, newValue);

        // Call the function that emits the event
        
    }
}
