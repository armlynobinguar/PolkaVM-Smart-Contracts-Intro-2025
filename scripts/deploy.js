const hre = require("hardhat");

async function main() {
  const MoonToken = await hre.ethers.getContractFactory("MoonToken");
  const moonToken = await MoonToken.deploy();

  await moonToken.waitForDeployment();

  console.log("MoonToken deployed to:", await moonToken.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
}); 