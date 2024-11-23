// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleBank {
    mapping(address => uint256) public balances;
    address[] public addresses; // Array to track all unique depositors
    uint256 public totalBalance;

    // Deposit Ether into the contract
    function deposit() external payable {
        // Only add to the addresses list if this is the user's first deposit
        if (balances[msg.sender] == 0) {
            addresses.push(msg.sender);
        }

        balances[msg.sender] += msg.value;
        totalBalance += msg.value;
    }

    // Withdraw Ether from the contract
    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        totalBalance -= amount;
        payable(msg.sender).transfer(amount);
    }

    // Function to simulate an interest distribution which may cause issues
    function distributeInterest() external {
        // Adds 1 Ether to the total balance (simulating interest)
        totalBalance += 1 ether;
        balances[msg.sender] += 1 ether;
    }

    // Sum of all user balances (for invariant testing)
    function sumOfAllBalances() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < addresses.length; i++) {
            sum += balances[addresses[i]];
        }
        return sum;
    }
}
