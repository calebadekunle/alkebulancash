const hre = require("hardhat");

async function main() {

  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying GasTreasury with account:", deployer.address);

  const GasTreasury = await hre.ethers.getContractFactory("GasTreasury");

  const treasury = await GasTreasury.deploy(deployer.address);

  await treasury.waitForDeployment();

  console.log("GasTreasury deployed to:", await treasury.getAddress());

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});