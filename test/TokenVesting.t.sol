// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/TokenVesting.sol";

contract MockERC20 is IERC20 {
    mapping(address => uint256) balances;

    function transfer(address recipient, uint256 amount) external override returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        return true;
    }

    function balanceOf(address account) external view override returns (uint256) {
        return balances[account];
    }

    function mint(address account, uint256 amount) external {
        balances[account] += amount;
    }
}

contract TokenVestingTest is Test {
    TokenVesting private vesting;
    MockERC20 private token;

    address private beneficiary = address(0x1);
    uint256 private start;
    uint256 private duration;
    uint256 private amount = 1000 * 10 ** 18;

    function setUp() public {
        token = new MockERC20();
        start = block.timestamp + 1000; // Start in the future
        duration = 365 days;

        // Mint tokens to vesting contract
        token.mint(address(this), amount);
        vesting = new TokenVesting(address(token), beneficiary, start, duration, amount);
    }

    // Test vesting release with fuzz testing for amount and duration
    function testVestingRelease(uint256 fuzzedAmount, uint256 fuzzedDuration) public {
        // Ensure fuzzed inputs are in practical ranges
        vm.assume(fuzzedAmount > 0 && fuzzedAmount <= type(uint256).max / 2);
        vm.assume(fuzzedDuration > 0 && fuzzedDuration <= 3650 days); // Up to 10 years

        // Set up a new vesting contract with fuzzed parameters
        vesting = new TokenVesting(address(token), beneficiary, start, fuzzedDuration, fuzzedAmount);

        // Forward time to the end of the vesting duration
        vm.warp(start + fuzzedDuration);

        // Release vested tokens
        vesting.release();

        // Check if all tokens have been released correctly
        assertEq(token.balanceOf(beneficiary), fuzzedAmount);
    }

    // Test for potential overflow in vestedAmount calculation
    function testVestedAmountOverflow(uint256 fuzzedStart, uint256 fuzzedAmount) public {
        vm.assume(fuzzedStart > block.timestamp && fuzzedStart < block.timestamp + 3650 days);
        vm.assume(fuzzedAmount <= type(uint256).max / 2);

        // Deploy a new vesting contract with fuzzed start and amount
        vesting = new TokenVesting(address(token), beneficiary, fuzzedStart, duration, fuzzedAmount);

        // Move time to the end of the vesting period
        vm.warp(fuzzedStart + duration);

        // Check the vested amount is as expected without overflow
        uint256 vested = vesting.vestedAmount();
        assertEq(vested, fuzzedAmount);
    }

    // Test edge case of attempting to release before vesting starts
    function testReleaseBeforeStart(uint256 fuzzedAmount) public {
        vm.assume(fuzzedAmount > 0 && fuzzedAmount <= type(uint256).max / 2);

        // Deploy a vesting contract with fuzzed parameters
        vesting = new TokenVesting(address(token), beneficiary, start, duration, fuzzedAmount);

        // Attempt to release before start time
        vm.expectRevert("Vesting has not started yet");
        vesting.release();
    }
}
