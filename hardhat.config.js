require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

// Make sure your private key is properly formatted with 0x prefix and is 32 bytes (64 hex characters)
const PRIVATE_KEY = process.env.PRIVATE_KEY || "";
// You can use any provider: Alchemy, Infura, etc.
const ALCHEMY_API_KEY = process.env.ALCHEMY_API_KEY || "";

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    // Local development network
    hardhat: {},
    // Sepolia testnet
    sepolia: {
      url: process.env.SEPOLIA_URL || "https://eth-sepolia.g.alchemy.com/v2/your-api-key",
      accounts: PRIVATE_KEY ? [PRIVATE_KEY] : []
    }
  },
  // For contract verification
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY || ""
  },
  // For gas reporting in tests
  gasReporter: {
    enabled: process.env.REPORT_GAS ? true : false,
    currency: "USD",
    coinmarketcap: process.env.COINMARKETCAP_API_KEY || ""
  }
}; 