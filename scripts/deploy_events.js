const hre = require("hardhat");

async function main() {
  console.log("Deploying Events contract...");
  
  const Events = await hre.ethers.getContractFactory("Events");
  const events = await Events.deploy();
  
  await events.waitForDeployment();
  
  const address = await events.getAddress();
  console.log("Events contract deployed to:", address);
  
  // Get the current value
  const value = await events.value();
  console.log("Initial value:", value.toString());
  
  // Set a new value and listen for the event
  console.log("Setting new value...");
  const tx = await events.setValue(200);
  const receipt = await tx.wait();
  
  // Parse the logs to find our event
  const eventLogs = receipt.logs.filter(log => {
    try {
      return events.interface.parseLog(log).name === "ValueChanged";
    } catch (e) {
      return false;
    }
  });
  
  if (eventLogs.length > 0) {
    const parsedLog = events.interface.parseLog(eventLogs[0]);
    console.log("Event emitted:");
    console.log("  Old value:", parsedLog.args.oldValue.toString());
    console.log("  New value:", parsedLog.args.newValue.toString());
    console.log("  Changed by:", parsedLog.args.changedBy);
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 