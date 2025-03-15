const { ethers } = require("ethers");

async function main() {
  // Generate a random wallet
  const wallet = ethers.Wallet.createRandom();
  
  console.log("Address:", wallet.address);
  console.log("Private Key:", wallet.privateKey);
  console.log("Mnemonic:", wallet.mnemonic.phrase);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 