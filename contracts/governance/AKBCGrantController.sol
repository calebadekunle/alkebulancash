// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract AKBCGrantController is Ownable {

    address public treasury;
    uint256 public constant MAX_PERCENT = 5;

    mapping(address => bool) public approvedRecipients;

    event RecipientApproved(address recipient);
    event GrantExecuted(address recipient, uint256 amount);

    constructor(address _treasury, address timelock) Ownable(timelock) {
        treasury = _treasury;
    }

    function approveRecipient(address recipient) external onlyOwner {
        approvedRecipients[recipient] = true;
        emit RecipientApproved(recipient);
    }

    function executeGrant(
        address token,
        address recipient,
        uint256 amount
    ) external onlyOwner {

        require(approvedRecipients[recipient], "Recipient not approved");

        uint256 treasuryBalance = IERC20(token).balanceOf(treasury);
        uint256 maxAllowed = (treasuryBalance * MAX_PERCENT) / 100;

        require(amount <= maxAllowed, "Grant exceeds treasury limit");

        IERC20(token).transferFrom(treasury, recipient, amount);

        emit GrantExecuted(recipient, amount);
    }
}