// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Owner {
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function modifyOwner(address _owner) external{
       require(msg.sender == owner, "your are not owner");
       owner = _owner;
    }
}