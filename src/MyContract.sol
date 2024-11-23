// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract MyContract {
    event ValueChanged(uint256 oldValue, uint256 newValue);

    uint256 public value;

    function setValue(uint256 newValue) public {
        uint256 oldValue = value;
        value = newValue;
        emit ValueChanged(oldValue, newValue);
    }
}
