const hre = require("hardhat");

async function main() {
  console.log("Deploying UsingLibraries contract...");
  
  // Deploy ArrayUtils library first
  const ArrayUtils = await hre.ethers.getContractFactory("ArrayUtils");
  const arrayUtils = await ArrayUtils.deploy();
  await arrayUtils.waitForDeployment();
  
  // Get the library addresses
  const arrayUtilsAddress = await arrayUtils.getAddress();
  console.log("ArrayUtils library deployed to:", arrayUtilsAddress);
  
  // Link the libraries to the contract
  const UsingLibraries = await hre.ethers.getContractFactory("UsingLibraries", {
    libraries: {
      ArrayUtils: arrayUtilsAddress
    }
  });
  
  const usingLibraries = await UsingLibraries.deploy();
  await usingLibraries.waitForDeployment();
  
  const address = await usingLibraries.getAddress();
  console.log("UsingLibraries contract deployed to:", address);
  
  // Interact with the contract
  console.log("Adding a number to the array...");
  const tx1 = await usingLibraries.addNumber(42);
  await tx1.wait();
  
  // Check if the number is in the array
  const contains = await usingLibraries.containsNumber(42);
  console.log("Array contains 42:", contains);
  
  // Add a value using SafeMath
  console.log("Adding value using SafeMath...");
  const tx2 = await usingLibraries.addValue(100);
  await tx2.wait();
  
  // Get the updated value
  const value = await usingLibraries.value();
  console.log("Current value:", value.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 