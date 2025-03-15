const hre = require("hardhat");

async function main() {
  console.log("Deploying HelloWorld contract...");
  
  // Get the contract factory
  const HelloWorld = await hre.ethers.getContractFactory("HelloWorld");
  
  // Deploy with constructor argument
  const helloWorld = await HelloWorld.deploy("Hello, Blockchain World!");
  
  // Wait for deployment to finish
  await helloWorld.waitForDeployment();
  
  // Get the contract address
  const address = await helloWorld.getAddress();
  console.log("HelloWorld deployed to:", address);
  
  // Interact with the contract
  const message = await helloWorld.getMessage();
  console.log("Current message:", message);
  
  // Update the message
  const tx = await helloWorld.setMessage("New message set!");
  await tx.wait();
  
  // Get the updated message
  const newMessage = await helloWorld.getMessage();
  console.log("Updated message:", newMessage);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 