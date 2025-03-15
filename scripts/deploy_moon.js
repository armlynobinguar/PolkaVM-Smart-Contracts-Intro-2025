async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contract with:", deployer.address);

    const MoonToken = await ethers.getContractFactory("MoonToken");
    const token = await MoonToken.deploy();
    await token.waitForDeployment();

    console.log("MoonToken deployed to:", await token.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});