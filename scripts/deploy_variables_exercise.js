const hre = require("hardhat");

async function main() {
    console.log("Deploying VariablesExercise contract...");

    const VariablesExercise = await hre.ethers.getContractFactory("VariablesExercise");
    const variablesExercise = await VariablesExercise.deploy();

    await variablesExercise.waitForDeployment();

    const address = await variablesExercise.getAddress();
    console.log("VariablesExercise contract deployed to:", address);

    // Interact with the contract to verify it's working
    console.log("Contract deployed successfully. You can now interact with it.");
    console.log("Try adding a user or value to test the contract's functionality.");
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    }); 