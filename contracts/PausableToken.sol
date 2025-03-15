// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Inheritance Implementation
 * @dev Implementation of inheritance patterns in Solidity
 */

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owner = newOwner;
    }
}

contract Pausable is Ownable {
    bool public paused;

    constructor() {
        paused = false;
    }

    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    modifier whenPaused() {
        require(paused, "Contract is not paused");
        _;
    }

    function pause() public virtual onlyOwner {
        paused = true;
    }  

    function unpause() public virtual onlyOwner {
        paused = false;
    }
}   

contract Token is Ownable {
    string public name;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    constructor(string memory _name, uint256 _initialSupply) {
        name = _name;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }

    function transfer(address to, uint256 amount) public virtual {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}

contract PausableToken is Token, Pausable {
    constructor(string memory _name, uint256 _initialSupply) Token(_name, _initialSupply) {}

    function transfer(address to, uint256 amount) public override whenNotPaused {
        super.transfer(to, amount);
    }
    
    function pause() public override onlyOwner {
        super.pause();
    }
    
    function unpause() public override onlyOwner {
        super.unpause();
    }
} 