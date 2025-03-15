const hre = require("hardhat");

async function main() {
  console.log("Deploying SimpleToken contract...");
  
  const SimpleToken = await hre.ethers.getContractFactory("SimpleToken");
  const simpleToken = await SimpleToken.deploy("MyToken", "MTK", 18, 1000000);
  
  await simpleToken.waitForDeployment();
  
  const tokenAddress = await simpleToken.getAddress();
  console.log("SimpleToken deployed to:", tokenAddress);
  
  // Get token info
  const name = await simpleToken.name();
  const symbol = await simpleToken.symbol();
  const decimals = await simpleToken.decimals();
  const totalSupply = await simpleToken.totalSupply();
  
  console.log("Token name:", name);
  console.log("Token symbol:", symbol);
  console.log("Token decimals:", decimals);
  console.log("Total supply:", totalSupply.toString());
  
  console.log("Deploying TokenSender contract...");
  
  const TokenSender = await hre.ethers.getContractFactory("TokenSender");
  const tokenSender = await TokenSender.deploy();
  
  await tokenSender.waitForDeployment();
  
  const senderAddress = await tokenSender.getAddress();
  console.log("TokenSender deployed to:", senderAddress);
  
  // Check token balance using TokenSender
  const [deployer] = await hre.ethers.getSigners();
  const balance = await tokenSender.getTokenBalance(tokenAddress, deployer.address);
  console.log("Deployer token balance:", balance.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 