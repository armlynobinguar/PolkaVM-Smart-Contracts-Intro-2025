// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title InheritanceExercise
 * @dev Complete the TODOs to practice working with inheritance
 */

// TODO: Create a base contract named Ownable with:
// - A state variable address public owner initialized to the message sender
// - A modifier onlyOwner that allows only the owner to call a function
// - A function transferOwnership(address newOwner) that transfers ownership to a new address
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


// TODO: Create a base contract named Pausable with:
// - A state variable bool public paused initialized to false
// - A modifier whenNotPaused that requires the contract to not be paused
// - A modifier whenPaused that requires the contract to be paused
// - A function pause() that sets paused to true
// - A function unpause() that sets paused to false
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

    function pause() public onlyOwner {
        paused = true;
    }  

    function unpause() public onlyOwner {
        paused = false;
    }
}   

// TODO: Create a contract named Token that inherits from Ownable with:
// - A state variable string public name
// - A state variable uint256 public totalSupply
// - A mapping balances that maps addresses to token balances
// - A constructor that sets the name and initial supply
// - A function transfer(address to, uint256 amount) that transfers tokens
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

// TODO: Create a contract named PausableToken that inherits from both Token and Pausable with:
// - A constructor that calls the parent constructor
// - An override of the transfer function that only works when not paused
// - Overrides of the pause and unpause functions that only the owner can call 
contract PausableToken is Token, Pausable {
    constructor(string memory _name, uint256 _initialSupply) Token(_name, _initialSupply) {}

    function transfer(address to, uint256 amount) public override whenNotPaused {
        super.transfer(to, amount);
    }
}   
