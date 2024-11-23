// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract TestDAI is Test {
    IERC20 public dai;
    address public testAccount;

    function setUp() public {
        // DAI token address on mainnet
        dai = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
        
        // Impersonate an address with DAI balance for testing
        testAccount = 0xf6e72Db5454dd049d0788e411b06CfAF16853042; // Replace with a real address holding DAI
        vm.startPrank(testAccount);
    }

    function testBalance() public view {
        // Check balance of DAI for testAccount
        uint256 balance = dai.balanceOf(testAccount);
        console.log("DAI Balance of testAccount:", balance);
        
        // Assert that the balance is greater than zero
        assertGt(balance, 0, "testAccount should have some DAI balance");
    }

    function testTransfer() public {
        // Transfer 1 DAI to another address
        address recipient = address(0x123);
        bool success = dai.transfer(recipient, 1e18);
        assertTrue(success, "Transfer should succeed");
        
        // // Verify the recipient's balance
        uint256 recipientBalance = dai.balanceOf(recipient);
        console.log("recipientBalance:",recipientBalance);
        assertEq(recipientBalance, 1e18, "Recipient should receive 1 DAI");
    }

    function tearDown() public {
        vm.stopPrank();
    }
}
