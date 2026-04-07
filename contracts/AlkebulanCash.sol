// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20VotesUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * @title AlkebulanCash (AKBC)
 * @dev ERC20 token with fixed supply, transfer fee, whitelist, pause,
 *      and on-chain governance support (ERC20Votes).
 */
contract AlkebulanCash is
    Initializable,
    ERC20Upgradeable,
    ERC20VotesUpgradeable,
    AccessControlUpgradeable,
    PausableUpgradeable,
    ReentrancyGuardUpgradeable
{
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    uint256 public constant MAX_SUPPLY = 25_000_000 * 10 ** 18;

    uint256 public constant FEE_BASIS_POINTS = 10;

    address public gasTreasury;

    mapping(address => bool) public isWhitelisted;

    event WhitelistUpdated(address indexed account, bool status);
    event TreasuryUpdated(address indexed newTreasury);

    function initialize(address _gasTreasury) public initializer {
        require(_gasTreasury != address(0), "Invalid treasury");

        __ERC20_init("AlkebulanCash", "AKBC");
        __ERC20Votes_init();
        __AccessControl_init();
        __Pausable_init();
        __ReentrancyGuard_init(); // ✅ IMPORTANT

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(ADMIN_ROLE, msg.sender);

        gasTreasury = _gasTreasury;

        _mint(msg.sender, MAX_SUPPLY);

        isWhitelisted[msg.sender] = true;
        isWhitelisted[_gasTreasury] = true;
    }

    function setWhitelist(address account, bool status)
        external
        onlyRole(ADMIN_ROLE)
    {
        isWhitelisted[account] = status;
        emit WhitelistUpdated(account, status);
    }

    function pause() external onlyRole(ADMIN_ROLE) {
        _pause();
    }

    function unpause() external onlyRole(ADMIN_ROLE) {
        _unpause();
    }

    function _update(
        address from,
        address to,
        uint256 amount
    )
        internal
        override(ERC20Upgradeable, ERC20VotesUpgradeable)
        whenNotPaused
        nonReentrant // ✅ ADDED
    {
        if (
            from == address(0) ||
            to == address(0) ||
            from == to ||
            amount == 0 ||
            isWhitelisted[from] ||
            isWhitelisted[to] ||
            msg.sender == address(this)
        ) {
            super._update(from, to, amount);
            return;
        }

        uint256 fee = (amount * FEE_BASIS_POINTS) / 10_000;
        uint256 remainder = amount - fee;

        super._update(from, gasTreasury, fee);
        super._update(from, to, remainder);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(AccessControlUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}