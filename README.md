# AlkebulanCash (AKBC)

AlkebulanCash (AKBC) is an ERC20-based digital asset designed to support sustainable development, cross-border value exchange, and community-led innovation across Africa.

The project implements a transparent, fee-based treasury model that enables long-term ecosystem funding while maintaining decentralisation principles.

## 🔗 Testnet Deployment — Ethereum Sepolia

The AlkebulanCash (AKBC) protocol has been deployed to the Ethereum Sepolia testnet for validation.

**AKBC Token Contract**
- Address: `0x516027b80186f033E99B1dFaF325C8848A585196`
- Network: Ethereum Sepolia
- Explorer: https://sepolia.etherscan.io/address/0x516027b80186f033E99B1dFaF325C8848A585196

**GasTreasury Contract**
- Address: `0x05AdD8e86ce16f945D78C3139Bff5bF0C36111E9`
- Explorer: https://sepolia.etherscan.io/address/0x05AdD8e86ce16f945D78C3139Bff5bF0C36111E9

### Fee Validation
A live transfer test confirmed that:
- Non-whitelisted transfers incur a 0.1% AKBC protocol fee
- Fees are correctly routed to the GasTreasury contract
- Whitelisted administrative addresses are fee-exempt by design
---

## 🌍 Vision & Purpose

AlkebulanCash was created to explore how blockchain-based financial primitives can be used to:

- Address cross-border transaction inefficiencies
- Provide sustainable funding for community-driven projects
- Enable transparent, on-chain treasury management
- Lay the groundwork for decentralised governance

The project is intentionally open-source to encourage learning, reuse, and public scrutiny.

---

## 🧱 Technical Overview

The system consists of two core smart contracts:

### 1. AlkebulanCash (AKBC)
- ERC20 token with a **fixed supply** of 25,000,000 AKB
- Implements a **0.1% transfer fee** on non-whitelisted transfers
- Fee is redirected to an on-chain treasury
- Supports:
  - Whitelisted fee exemptions
  - Emergency pause functionality
  - Role-based access control
- Built using OpenZeppelin upgradeable contracts

### 2. GasTreasury
- Dedicated on-chain treasury contract
- Receives protocol fees in AKBC
- Funds are withdrawable only by the treasury owner
- Designed to be transferred to governance control in future phases

---

## 🔐 Fee & Treasury Model

For each eligible AKBC transfer:
- 99.9% is delivered to the recipient
- 0.1% is routed to the GasTreasury contract

This model ensures:
- Transparent, on-chain funding
- Sustainable protocol development
- Clear separation between user funds and treasury assets

---

## 🏛️ Governance Roadmap

Governance is introduced in phases to reduce complexity and risk.

Planned governance milestones:
1. Deploy governance and timelock contracts
2. Transfer administrative roles to governance
3. Transfer GasTreasury ownership to governance
4. Enable community-driven decision making

This staged approach mirrors real-world protocol development best practices.

---

## 🛠️ Development Stack

- Solidity ^0.8.x
- Hardhat
- OpenZeppelin Contracts (Upgradeable)
- Ethereum Sepolia Testnet

---

## 📄 Status

- Core contracts implemented
- Local compilation successful
- Testnet deployment in progress
- Governance contracts planned (Phase 2)

---

## 🤝 Open Source & Contributions

This repository is public to support transparency, peer review, and educational use.  
Issues and pull requests are welcome.

---

## ⚠️ Disclaimer

This project is experimental and deployed on testnet for learning and evaluation purposes.