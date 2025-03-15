const hre = require("hardhat");

async function main() {
    console.log("Deploying FunctionsExercise contract...");

    const FunctionsExercise = await hre.ethers.getContractFactory("FunctionsExercise");
    const functionsExercise = await FunctionsExercise.deploy();

    await functionsExercise.waitForDeployment();

    const address = await functionsExercise.getAddress();
    console.log("FunctionsExercise contract deployed to:", address);

    // Interact with the contract
    const initialValue = await functionsExercise.getValue();
    console.log("Initial value:", initialValue.toString());

    // Set a new value
    const tx = await functionsExercise.setValue(42);
    await tx.wait();

    // Get the updated value
    const newValue = await functionsExercise.getValue();
    console.log("Updated value:", newValue.toString());

    // Call a pure function
    const sum = await functionsExercise.add(10, 20);
    console.log("10 + 20 =", sum.toString());

    // Test min and max function
    const [min, max] = await functionsExercise.getMinAndMax(15, 30);
    console.log("Min of 15 and 30:", min.toString());
    console.log("Max of 15 and 30:", max.toString());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    }); 