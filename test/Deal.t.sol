// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract USDCBalanceTest is Test {
    // Mainnet USDC token address
    address constant USDC_ADDRESS = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    // Declare the USDC token as an IERC20
    IERC20 usdc;

    // User account to manipulate in the test
    address user;

    function setUp() public {
        // Initialize USDC as an IERC20 pointing to the mainnet address
        usdc = IERC20(USDC_ADDRESS);
        
        // Initialize the user address
        user = address(1);
    }

    function testDealUSDCBalance() public {
        // Desired balance for testing (1000 USDC), accounting for 6 decimals
        uint256 testBalance = 1000 * 1e6; // 1000 USDC

        // Use the deal function to set the user's USDC balance
        deal(USDC_ADDRESS, user, testBalance);

        // Check the balance to confirm the deal function worked
        uint256 balance = usdc.balanceOf(user);
        assertEq(balance, testBalance, "User balance should be set to 1000 USDC");
    }
}
