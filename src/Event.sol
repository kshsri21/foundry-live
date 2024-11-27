// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Event {
    event ValueChanged(
        address indexed user,
        uint256 oldValue,
        uint256 newValue
    );

    uint256 public value;

    function setValue(uint256 newValue) external {
        uint256 oldValue = value;
        value = newValue;
        emit ValueChanged(msg.sender, oldValue, newValue);
    }
}
