const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MoonToken", function () {
  let moonToken;
  let owner;
  let addr1;
  let addr2;

  beforeEach(async function () {
    [owner, addr1, addr2] = await ethers.getSigners();
    const MoonToken = await ethers.getContractFactory("MoonToken");
    moonToken = await MoonToken.deploy();
  });

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await moonToken.owner()).to.equal(owner.address);
    });

    it("Should assign the total supply of tokens to the owner", async function () {
      const ownerBalance = await moonToken.balanceOf(owner.address);
      expect(await moonToken.totalSupply()).to.equal(ownerBalance);
    });
  });

  describe("Transactions", function () {
    it("Should transfer tokens between accounts", async function () {
      await moonToken.transfer(addr1.address, 50);
      expect(await moonToken.balanceOf(addr1.address)).to.equal(50);

      await moonToken.connect(addr1).transfer(addr2.address, 50);
      expect(await moonToken.balanceOf(addr2.address)).to.equal(50);
    });

    it("Should fail if sender doesn't have enough tokens", async function () {
      const initialOwnerBalance = await moonToken.balanceOf(owner.address);
      await expect(
        moonToken.connect(addr1).transfer(owner.address, 1)
      ).to.be.revertedWith("ERC20: transfer amount exceeds balance");
      expect(await moonToken.balanceOf(owner.address)).to.equal(initialOwnerBalance);
    });
  });
}); 