// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract TokenVesting {
    IERC20 public token;
    address public beneficiary;
    uint256 public start;
    uint256 public duration;
    uint256 public amount;
    uint256 public released;

    event Released(uint256 amount);

    constructor(
        address _token,
        address _beneficiary,
        uint256 _start,
        uint256 _duration,
        uint256 _amount
    ) {
        require(_start > block.timestamp, "Start time must be in the future");
        require(_duration > 0, "Duration must be greater than zero");
        require(_amount > 0, "Amount must be greater than zero");

        token = IERC20(_token);
        beneficiary = _beneficiary;
        start = _start;
        duration = _duration;
        amount = _amount;
    }

    function release() public {
        require(block.timestamp >= start, "Vesting has not started yet");
        uint256 vestedAmount = vestedAmount();
        uint256 releasable = vestedAmount - released;
        require(releasable > 0, "No tokens to release");

        released += releasable;
        token.transfer(beneficiary, releasable);
        emit Released(releasable);
    }

    function vestedAmount() public view returns (uint256) {
        if (block.timestamp >= start + duration) {
            return amount;
        } else {
            return (amount * (block.timestamp - start)) / duration;
        }
    }
}
