// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {SimpleBank} from "../src/SimpleBank.sol";

contract SimpleBankTest is Test {
    SimpleBank bank;
    address alice;
    address bob;

    function setUp() public {
        bank = new SimpleBank();
        alice = address(0x1);
        bob = address(0x2);

        // Give initial balances to test users
        vm.deal(alice, 10 ether);
        vm.deal(bob, 10 ether);
    }

    // // Fuzz test for deposits
    // function testDeposit(uint256 amount) public {
    //     vm.prank(alice);
    //     bank.deposit{value: amount}();
    // }

    // Fuzz test for withdrawals
    // function testWithdraw(uint256 amount) public {
    //     vm.prank(alice);
    //     bank.deposit{value: amount}();

    //     if (amount <= bank.balances(alice)) {
    //         vm.prank(alice);
    //         bank.withdraw(amount);
    //     }
    // }

    // Invariant test to check that totalBalance is always correct
    // function invariant_totalBalanceEqualsSumOfBalances() public view{
    //     uint256 sumOfBalances = bank.sumOfAllBalances();
    //     assertEq(bank.totalBalance(), sumOfBalances, "Total balance does not match sum of individual balances");
    // }
}
