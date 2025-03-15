# 🚀 PolkaVM Smart Contracts

PolkaVM is a smart contract learning project that combines the **Polkadot ecosystem** with **Solidity**-based development. It is designed to help developers explore smart contract principles while building on a familiar Ethereum-style language within the context of Polkadot-compatible chains.

---

## ✅ Prerequisites

Make sure you have the following installed:

- [Node.js](https://nodejs.org/) (version 14 or higher recommended)
- [npm](https://www.npmjs.com/) (comes with Node.js)

Check versions:

```bash
node -v
npm -v
```

---

## 📦 Install Hardhat & Dependencies

1. **Create a project folder (if you haven’t already):**

```bash
mkdir polkavm
cd polkavm
```

2. **Initialize a Node.js project:**

```bash
npm init -y
```

3. **Install Hardhat:**

```bash
npm install --save-dev hardhat
```

4. **Set up a Hardhat project:**

```bash
npx hardhat
```

Choose:

- **"Create a JavaScript project"**
- Accept default values or customize

5. **Install additional dependencies:**

```bash
npm install --save-dev @nomiclabs/hardhat-ethers ethers
```

---

## 📁 Project Structure

```
PolkaVM/
├── artifacts/              # Compiled contract artifacts
├── cache/                  # Hardhat cache
├── contracts/              # Solidity smart contracts
├── exercises/              # Additional exercises or playground files
├── node_modules/           # Installed npm dependencies
├── scripts/                # Deployment and interaction scripts
├── test/                   # Automated test cases for the contracts
├── hardhat.config.js       # Main Hardhat configuration file
├── package.json            # Project metadata and scripts
├── package-lock.json       # Locked dependency versions
```

---

## 📜 Contracts Overview

The `contracts/` folder includes:

- `01_HelloWorld.sol` – Basic greeting contract
- `02_Variables.sol` – Variables in Solidity
- `03_Functions.sol` – Functions and visibility
- `04_Modifiers.sol` – Access control modifiers
- `05_Events.sol` – Events and logs
- `06_Inheritance.sol` – Inheritance examples
- `07_Interfaces.sol` – Interfaces and external calls
- `08_Libraries.sol` – Reusable libraries
- `MoonToken.sol` – A deployable ERC20 token

---

## 🪙 Deploying `MoonToken.sol`

1. **Compile the contract:**

```bash
npx hardhat compile
```

2. **Create a script at `scripts/deploy-moon.js`:**

```js
async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contract with:", deployer.address);

  const MoonToken = await ethers.getContractFactory("MoonToken");
  const token = await MoonToken.deploy("MoonToken", "MOON", 18, 1000000);
  await token.deployed();

  console.log("MoonToken deployed to:", token.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
```

3. **Run the deployment script:**

```bash
npx hardhat run scripts/deploy-moon.js --network localhost
```

4. **Interact with it in the console:**

```bash
npx hardhat console
```

Then try:

```js
const [owner] = await ethers.getSigners();
const token = await ethers.getContractAt("MoonToken", "DEPLOYED_ADDRESS");

(await token.balanceOf(owner.address)).toString();
await token.transfer("0xRecipientAddress", 500);
```

---

## ✅ Run Tests

Test files are in the `test/` directory.

To run:

```bash
npx hardhat test
```

---

## 📚 References

- [Solidity Docs](https://docs.soliditylang.org/)
- [Hardhat Docs](https://hardhat.org/getting-started/)
- [Ethers.js Docs](https://docs.ethers.io/)

---

Happy building with PolkaVM! 🛠️💡
