// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title AKBCTreasury
 * @dev DAO treasury controlled by governance Timelock
 */
contract AKBCTreasury is Ownable {

    constructor(address timelock) Ownable(timelock) {}

    receive() external payable {}

    /**
     * Execute governance approved transaction
     */
    function execute(
        address target,
        uint256 value,
        bytes calldata data
    ) external onlyOwner returns (bytes memory) {

        (bool success, bytes memory result) = target.call{value:value}(data);

        require(success, "Treasury execution failed");

        return result;
    }
}