# AlkebulanCash (AKBC)

AlkebulanCash (AKBC) is a blockchain-based governance and funding infrastructure designed to enable transparent, community-driven financing for innovation and development across Africa.

The system combines token governance, on-chain treasury management, and secure grant distribution to create a decentralized financial coordination layer for funding real-world projects.

---

## 🌍 Vision

AlkebulanCash explores how decentralized governance can support:

- Developer grants  
- Research funding  
- Startup ecosystem support  
- Infrastructure financing  
- Community innovation programs  

The long-term goal is to build a **transparent decentralized funding infrastructure for Africa**.

---

## 🔗 Testnet Deployment — Ethereum Sepolia

The AlkebulanCash DAO infrastructure is currently deployed on the **Ethereum Sepolia Testnet**.

---

## 🪙 AKBC Token

**Contract Address**
**Contract Address**


0x4354Ad0d942e2D80f6ce25Cb00A2d2B8dCF6116a


**Explorer**

https://sepolia.etherscan.io/address/0x4354Ad0d942e2D80f6ce25Cb00A2d2B8dCF6116a

### Features

- ERC20 token  
- Fixed supply: **25,000,000 AKBC**  
- **0.1% protocol transfer fee**  
- Whitelist support  
- Emergency pause functionality  
- On-chain governance voting  

---

## 🏛️ Governance (Governor)

**Contract Address**


0x6DE42b86C200Cf269f1cc291de52fD159FCFB1bD


The Governor contract enables:

- Proposal creation  
- Token-weighted voting  
- Governance execution  

All governance decisions are recorded **on-chain and publicly verifiable**.

---

## ⏱ Timelock

**Contract Address**


0x4C8A70908DFcFc87D7A321C8fd7d80C40A6AC5a3


The Timelock contract introduces a delay between proposal approval and execution.

This provides:

- Protection against malicious proposals  
- Time for community review  
- Additional governance security  

---

## ⛽ GasTreasury

**Contract Address**


0x3C80Cf3D6E14C744dcb5B249FdCa0b5164A788Fd


The GasTreasury collects protocol fees generated from AKBC transfers.

These fees are later routed into the DAO treasury.

---

## 🏦 DAO Treasury

**Contract Address**


0xE79d484b7b83f1B79Bff75d76930D6ED5fcf72eC


The DAO Treasury securely stores funds controlled by governance.

Funds can only be moved through **approved governance proposals**.

---

## 🎓 Grant Controller

**Contract Address**


0x13691dEEC936D6d8b20954E1C44F6576e127977a


The Grant Controller adds an additional protection layer for treasury disbursements.

Funds cannot be sent to arbitrary wallets unless the wallet has first been **approved as a grant recipient**.

---

## 🧱 System Architecture


AKBC Token
│
▼
Governor (DAO voting)
│
▼
Timelock (execution delay)
│
▼
Grant Controller (recipient approval)
│
▼
DAO Treasury
│
▼
GasTreasury (protocol fee collector)


This architecture ensures that **no individual can move treasury funds without DAO approval**.

---

## 🔐 Security Model

The AlkebulanCash governance system includes several protection layers.

### Token Governance

Token holders vote on proposals using token-weighted voting.

### Timelock Delay

Approved proposals cannot execute immediately.

### Grant Recipient Approval

Treasury funds can only be sent to pre-approved addresses.

### Treasury Isolation

Protocol fees are collected separately before entering the DAO treasury.

---

## 💰 Protocol Funding Model

The protocol implements a **0.1% transfer fee**.

For each eligible AKBC transfer:


99.9% → recipient
0.1% → GasTreasury


These fees accumulate over time and can be allocated through governance proposals.

---

## 🛠 Development Stack

- Solidity  
- Hardhat  
- OpenZeppelin Contracts  
- Ethereum Sepolia Testnet  
- OpenZeppelin Governor  

---

## 📄 Current Status

- AKBC token deployed  
- DAO governance operational  
- Treasury architecture implemented  
- Grant controller deployed  
- Governance proposals successfully tested  

---

## 🤝 Open Source

This repository is public to encourage transparency, research, and educational use.

Contributions, issues, and pull requests are welcome.

---

## ⚠️ Disclaimer

This project is experimental and currently deployed on the Ethereum Sepolia testnet for research and development purposes.

---

## 📜 License

MIT License