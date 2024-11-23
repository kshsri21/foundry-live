// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RequireRevert {
    uint256 public value;

    // Function that sets the value if it's above a certain threshold
    function setValue(uint256 _value) public {
        // Require condition: value must be greater than 10
        require(_value > 10, "Value must be greater than 10");
        value = _value;
    }

    // Function that will always revert with a custom error
    function alwaysRevert() public pure {
        revert("This function always reverts");
    }
}
