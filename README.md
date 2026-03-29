# AlkebulanCash (AKBC)

AlkebulanCash (AKBC) is a decentralized governance and treasury system designed to enable transparent, community-driven funding using blockchain technology.

The system integrates token governance, timelock-based execution, and validation layers to provide secure and accountable fund management for decentralized communities.

---

## 🌍 Vision

AlkebulanCash explores how decentralized governance can support:

- Developer grants  
- Research funding  
- Startup ecosystem support  
- Infrastructure financing  
- Community innovation programs  

The goal is to build a transparent decentralized funding infrastructure for Africa.

---

## 🚀 Deployment (Sepolia Testnet)

The system is deployed on Ethereum Sepolia.

### AKBC Token

- Address: 0x4354Ad0d942e2D80f6ce25Cb00A2d2B8dCF6116a  
- Explorer: https://sepolia.etherscan.io/address/0x4354Ad0d942e2D80f6ce25Cb00A2d2B8dCF6116a  

---

## 🏛 Core Contracts

| Component         | Address |
|------------------|--------|
| Governor         | 0x6DE42b86C200Cf269f1cc291de52fD159FCFB1bD |
| Timelock         | 0x4C8A70908DFcFc87D7A321C8fd7d80C40A6AC5a3 |
| GasTreasury      | 0x3C80Cf3D6E14C744dcb5B249FdCa0b5164A788Fd |
| Treasury         | 0xE79d484b7b83f1B79Bff75d76930D6ED5fcf72eC |
| Grant Controller | 0x13691dEEC936D6d8b20954E1C44F6576e127977a |

---

## 🧱 Architecture

AKBC Token  
↓  
Governor (Voting)  
↓  
Timelock (Delay)  
↓  
Grant Controller (Validation)  
↓  
DAO Treasury  
↓  
GasTreasury (Fees)

---

## 🔐 Security Model

- Token-weighted governance voting  
- Timelock-enforced execution delay  
- Grant recipient validation  
- Treasury isolation  

---

## 💰 Funding Model

- 0.1% protocol fee per transfer  
- Fees routed to GasTreasury  
- Allocated via governance proposals  

---

## 🛠 Development Stack

- Solidity  
- Hardhat  
- OpenZeppelin Contracts  
- Ethereum Sepolia Testnet  

---

## 🛠 Installation & Setup

Clone the repository:

```bash
git clone https://github.com/calebadekunle/AlkebulanCash.git
cd AlkebulanCash
```

Install dependencies:

```bash
npm install
```

Compile contracts:

```bash
npx hardhat compile
```

Run tests:

```bash
npx hardhat test
```

Deploy:

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

---

## 🧪 Usage

1. Acquire AKBC tokens (testnet)  
2. Create governance proposal  
3. Vote using token-weighted voting  
4. Wait for timelock delay  
5. Execute approved proposal  

---

## 📊 Current Status

- Token deployed  
- Governance operational  
- Treasury implemented  
- Grant controller active  
- Proposals tested  

---

## 🚧 Roadmap

- Frontend interface for DAO interaction  
- Improved governance workflow  
- Expanded smart contract test coverage  
- Gas optimization improvements  
- Enhanced developer documentation  

---

## 🤝 Contributing

Contributions are welcome via issues and pull requests.

---

## ⚠️ Disclaimer

This project is experimental and deployed on a testnet.

---

## 📜 License

MIT License