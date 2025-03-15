const hre = require("hardhat");

async function main() {
  console.log("Deploying PausableToken contract...");
  
  const PausableToken = await hre.ethers.getContractFactory("PausableToken");
  const pausableToken = await PausableToken.deploy("MyToken", 1000000);
  
  await pausableToken.waitForDeployment();
  
  const address = await pausableToken.getAddress();
  console.log("PausableToken deployed to:", address);
  
  // Get token info
  const name = await pausableToken.name();
  const totalSupply = await pausableToken.totalSupply();
  const owner = await pausableToken.owner();
  const paused = await pausableToken.paused();
  
  console.log("Token name:", name);
  console.log("Total supply:", totalSupply.toString());
  console.log("Owner:", owner);
  console.log("Paused:", paused);
  
  // Pause the token
  console.log("Pausing the token...");
  const pauseTx = await pausableToken.pause();
  await pauseTx.wait();
  
  // Check if paused
  const isPaused = await pausableToken.paused();
  console.log("Token paused:", isPaused);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 