const hre = require("hardhat");

async function main() {
  console.log("Deploying Modifiers contract...");
  
  const Modifiers = await hre.ethers.getContractFactory("Modifiers");
  const modifiers = await Modifiers.deploy();
  
  await modifiers.waitForDeployment();
  
  const address = await modifiers.getAddress();
  console.log("Modifiers contract deployed to:", address);
  
  // Get the owner
  const owner = await modifiers.owner();
  console.log("Contract owner:", owner);
  
  // Get the current value
  const value = await modifiers.value();
  console.log("Current value:", value.toString());
  
  // Set a new value (this will work as we're the owner)
  const tx = await modifiers.setValue(100);
  await tx.wait();
  
  // Get the updated value
  const newValue = await modifiers.value();
  console.log("Updated value:", newValue.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 