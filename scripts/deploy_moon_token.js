const hre = require("hardhat");

async function main() {
  console.log("Deploying MoonToken contract...");
  
  const MoonToken = await hre.ethers.getContractFactory("MoonToken");
  const moonToken = await MoonToken.deploy();
  
  await moonToken.waitForDeployment();
  
  const address = await moonToken.getAddress();
  console.log("MoonToken deployed to:", address);
  
  // Get token info
  const name = await moonToken.name();
  const symbol = await moonToken.symbol();
  const totalSupply = await moonToken.totalSupply();
  
  console.log("Token name:", name);
  console.log("Token symbol:", symbol);
  console.log("Total supply:", hre.ethers.formatEther(totalSupply));
  
  // Get deployer balance
  const [deployer] = await hre.ethers.getSigners();
  const balance = await moonToken.balanceOf(deployer.address);
  
  console.log("Deployer address:", deployer.address);
  console.log("Deployer balance:", hre.ethers.formatEther(balance));
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 