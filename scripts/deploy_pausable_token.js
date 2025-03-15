const hre = require("hardhat");

async function main() {
    console.log("Deploying PausableToken contract...");

    // First, we need to deploy the contract to the contracts directory
    // Copy the InheritanceExercise.sol file to the contracts directory

    // Get the contract factory with fully qualified name
    const PausableToken = await hre.ethers.getContractFactory("contracts/PausableToken.sol:PausableToken");

    // Deploy with constructor arguments - name and initial supply
    const tokenName = "MyPausableToken";
    const initialSupply = hre.ethers.parseEther("1000"); // 1000 tokens with 18 decimals

    const pausableToken = await PausableToken.deploy(tokenName, initialSupply);

    // Wait for deployment to finish
    await pausableToken.waitForDeployment();

    // Get the contract address
    const address = await pausableToken.getAddress();
    console.log("PausableToken deployed to:", address);

    // Interact with the contract
    const name = await pausableToken.name();
    const totalSupply = await pausableToken.totalSupply();
    const owner = await pausableToken.owner();

    console.log("Token name:", name);
    console.log("Total supply:", hre.ethers.formatEther(totalSupply), "tokens");
    console.log("Owner:", owner);

    // Check if contract is paused
    const isPaused = await pausableToken.paused();
    console.log("Contract paused:", isPaused);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    }); 