const hre = require("hardhat");

async function main() {
  console.log("Deploying Functions contract...");
  
  const Functions = await hre.ethers.getContractFactory("Functions");
  const functions = await Functions.deploy();
  
  await functions.waitForDeployment();
  
  const address = await functions.getAddress();
  console.log("Functions contract deployed to:", address);
  
  // Interact with the contract
  const initialValue = await functions.getValue();
  console.log("Initial value:", initialValue.toString());
  
  // Set a new value
  const tx = await functions.setValue(42);
  await tx.wait();
  
  // Get the updated value
  const newValue = await functions.getValue();
  console.log("Updated value:", newValue.toString());
  
  // Call a pure function
  const sum = await functions.add(10, 20);
  console.log("10 + 20 =", sum.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 