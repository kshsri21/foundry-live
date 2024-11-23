pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {Safe} from "../src/Safe.sol";


contract SafeTest is Test {
    Safe safe;

    // Needed so the test contract itself can receive ether
    // when withdrawing
    receive() external payable {}

    function setUp() public {
        safe = new Safe();
    }

    function test_Withdraw() public {
        payable(address(safe)).transfer(1 ether);//transfering 1 ether to safe contract from safe test contract
        uint256 preBalance = address(this).balance;//balance of SafeTest contract
        safe.withdraw(); //transfer ether to SafeTest contract since msg.sender is SafeTest contract
        uint256 postBalance = address(this).balance;//balance of SafeTest contract
        assertEq(preBalance + 1 ether, postBalance);
    }

    //Fail - The default amount of ether that the test contract is given is 2**96 wei
    // function testFuzz_Withdraw(uint256 amount) public {
    //     payable(address(safe)).transfer(amount);
    //     uint256 preBalance = address(this).balance;
    //     safe.withdraw();
    //     uint256 postBalance = address(this).balance;
    //     assertEq(preBalance + amount, postBalance);
    // }
    function testFuzz_Withdraw(uint96 amount) public {
        vm.assume(amount > 0.1 ether);
        payable(address(safe)).transfer(amount);
        uint256 preBalance = address(this).balance;
        safe.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(preBalance + amount, postBalance);
    }
}
