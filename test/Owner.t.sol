// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Owner} from "../src/Owner.sol";

contract OwnerTest is Test {
    Owner public owner;

    function setUp() public { 
        owner = new Owner();
    }

     function testmodifyOwner() public{
        console.log("current owner:",owner.owner());
         // msg.sender = address(this)
        owner.modifyOwner(address(1));
        console.log("new owner:",owner.owner());
        assertEq(owner.owner(), address(1));
    }

    function testFailmodifyOwnerOne() public{
        vm.prank(address(1));//msg.sender = address(1)
        owner.modifyOwner(address(1));
    }

     function testFailmodifyOwnerMultiple() public{
        owner.modifyOwner(address(1));
        // Set all subsequent msg.sender to address(1)
        vm.startPrank(address(1));

        // all calls made from address(1)
        owner.modifyOwner(address(1));
        owner.modifyOwner(address(1));

        // Reset all subsequent msg.sender to address(this)
        vm.stopPrank();

        console.log("new owner:", owner.owner());

        // call made from address(this)
        owner.modifyOwner(address(1));

        console.log("owner", owner.owner());
    }

}
