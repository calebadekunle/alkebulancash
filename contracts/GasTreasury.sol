// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @title GasTreasury
 * @dev Collects protocol fees and forwards them to DAO treasury.
 */
contract GasTreasury is Ownable {

    address public daoTreasury;

    event TreasuryUpdated(address indexed newTreasury);
    event TokensForwarded(address indexed token, uint256 amount);
    event EthForwarded(uint256 amount);

    constructor(address initialOwner) Ownable(initialOwner) {}

    /**
     * Set DAO treasury address
     */
    function setDAOTreasury(address _daoTreasury) external onlyOwner {
        daoTreasury = _daoTreasury;
        emit TreasuryUpdated(_daoTreasury);
    }

    /**
     * Forward ERC20 tokens to DAO treasury
     */
    function forwardToken(address token) external {

        require(daoTreasury != address(0), "Treasury not set");

        uint256 balance = IERC20(token).balanceOf(address(this));

        IERC20(token).transfer(daoTreasury, balance);

        emit TokensForwarded(token, balance);
    }

    /**
     * Forward ETH to DAO treasury
     */
    function forwardETH() external {

        require(daoTreasury != address(0), "Treasury not set");

        uint256 balance = address(this).balance;

        payable(daoTreasury).transfer(balance);

        emit EthForwarded(balance);
    }

    receive() external payable {}
}