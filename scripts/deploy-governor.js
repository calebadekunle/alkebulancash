const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying Governor with account:", deployer.address);

  // AKBC token address (Sepolia)
  const tokenAddress = "0x516027b80186f033E99B1dFaF325C8848A585196";

  const Token = await hre.ethers.getContractAt(
    "AlkebulanCash",
    tokenAddress
  );

  const Governor = await hre.ethers.getContractFactory("AKBCGovernor");
  const governor = await Governor.deploy(Token.target);

  await governor.waitForDeployment();

  console.log("AKBCGovernor deployed to:", governor.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});