const hre = require("hardhat");

async function main() {

  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying AKBC Treasury with account:", deployer.address);

  const timelock = "0x4C8A70908DFcFc87D7A321C8fd7d80C40A6AC5a3";

  const Treasury = await hre.ethers.getContractFactory("AKBCTreasury");

  const treasury = await Treasury.deploy(timelock);

  await treasury.waitForDeployment();

  console.log("AKBCTreasury deployed to:", await treasury.getAddress());

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});