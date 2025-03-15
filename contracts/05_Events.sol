// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Events
 * @dev Demonstrates events in Solidity for logging and frontend notifications
 */
contract Events {
    // State variables
    uint public value;
    address public owner;
    
    // Events declaration
    event ValueChanged(uint oldValue, uint newValue, address changedBy);
    event OwnerChanged(address oldOwner, address newOwner);
    event Deposit(address indexed from, uint amount, uint timestamp);
    event Withdrawal(address indexed to, uint amount);
    
    constructor() {
        owner = msg.sender;
        // Emit event in constructor
        emit OwnerChanged(address(0), owner);
    }
    
    // Function that emits an event
    function setValue(uint newValue) public {
        uint oldValue = value;
        value = newValue;
        
        // Emit event with all relevant information
        emit ValueChanged(oldValue, newValue, msg.sender);
    }
    
    // Function with indexed event parameters for efficient filtering
    function deposit() public payable {
        // Emit event with indexed parameter
        emit Deposit(msg.sender, msg.value, block.timestamp);
    }
    
    // Function with multiple events
    function changeOwner(address newOwner) public {
        require(msg.sender == owner, "Only owner can change ownership");
        require(newOwner != address(0), "Invalid address");
        
        address oldOwner = owner;
        owner = newOwner;
        
        // Emit ownership change event
        emit OwnerChanged(oldOwner, newOwner);
    }
    
    // Function that emits an event before and after an operation
    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(address(this).balance >= amount, "Insufficient balance");
        
        // Emit event before operation
        emit Withdrawal(msg.sender, amount);
        
        // Perform operation
        payable(msg.sender).transfer(amount);
    }
    
    // Anonymous events (cannot be filtered by name)
    event AnonymousLog(string message) anonymous;
    
    function logAnonymously(string memory message) public {
        emit AnonymousLog(message);
    }
} 