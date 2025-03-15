const hre = require("hardhat");

async function main() {
  console.log("Deploying Variables contract...");
  
  const Variables = await hre.ethers.getContractFactory("Variables");
  const variables = await Variables.deploy();
  
  await variables.waitForDeployment();
  
  const address = await variables.getAddress();
  console.log("Variables contract deployed to:", address);
  
  // Interact with the contract
  const myUint = await variables.myUint();
  const myString = await variables.myString();
  console.log("myUint value:", myUint.toString());
  console.log("myString value:", myString);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 