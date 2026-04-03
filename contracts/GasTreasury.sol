// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";

/**
 * @title GasTreasury
 * @dev Collects protocol fees and forwards them to DAO treasury.
 *      Optimized: SafeERC20 for proper token transfer checks, Address.sendValue for ETH.
 */
contract GasTreasury is Ownable {

    using SafeERC20 for IERC20;
    using Address for address payable;

    address public daoTreasury;

    event TreasuryUpdated(address indexed newTreasury);
    event TokensForwarded(address indexed token, uint256 amount);
    event EthForwarded(uint256 amount);

    constructor(address initialOwner) Ownable(initialOwner) {}

    /**
     * @dev Set DAO treasury address
     */
    function setDAOTreasury(address _daoTreasury) external onlyOwner {
        daoTreasury = _daoTreasury;
        emit TreasuryUpdated(_daoTreasury);
    }

    /**
     * @dev Forward all ERC20 tokens held by this contract to DAO treasury.
     *      Uses SafeERC20 to ensure revert on failed transfer.
     * @param token Address of the ERC20 token to forward.
     * @return bool True if tokens were forwarded successfully.
     */
    function forwardToken(address token) external returns (bool) {
        require(daoTreasury != address(0), "Treasury not set");

        uint256 balance = IERC20(token).balanceOf(address(this));
        if (balance == 0) return false;

        IERC20(token).safeTransfer(daoTreasury, balance);
        emit TokensForwarded(token, balance);
        return true;
    }

    /**
     * @dev Forward all ETH held by this contract to DAO treasury.
     *      Uses low-level call instead of transfer() to avoid 2300 gas stipend limit.
     * @return bool True if ETH was forwarded successfully.
     */
    function forwardETH() external returns (bool) {
        require(daoTreasury != address(0), "Treasury not set");

        uint256 balance = address(this).balance;
        if (balance == 0) return false;

        // Use Address.sendValue for gas-efficient ETH forwarding (no 2300 gas limit)
        payable(daoTreasury).sendValue(balance);
        emit EthForwarded(balance);
        return true;
    }

    receive() external payable {}
}
