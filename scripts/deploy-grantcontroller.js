const hre = require("hardhat");

async function main() {

  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying GrantController with account:", deployer.address);

  const treasuryAddress = "0xE79d484b7b83f1B79Bff75d76930D6ED5fcf72eC";
  const timelockAddress = "0x4C8A70908DFcFc87D7A321C8fd7d80C40A6AC5a3";

  const GrantController = await hre.ethers.getContractFactory("AKBCGrantController");

  const controller = await GrantController.deploy(
    treasuryAddress,
    timelockAddress
  );

  await controller.waitForDeployment();

  const address = await controller.getAddress();

  console.log("AKBCGrantController deployed to:", address);

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});