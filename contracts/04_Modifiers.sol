// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Modifiers
 * @dev Demonstrates function modifiers in Solidity
 */
contract Modifiers {
    address public owner;
    uint public value = 0;
    bool public locked = false;
    
    constructor() {
        owner = msg.sender;
    }
    
    // Basic modifier for owner-only functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;  // The underscore represents where the function code executes
    }
    
    // Modifier with parameters
    modifier costs(uint price) {
        require(msg.value >= price, "Not enough Ether provided");
        _;
        // Refund any excess payment
        if (msg.value > price) {
            payable(msg.sender).transfer(msg.value - price);
        }
    }
    
    // Modifier to prevent reentrancy attacks
    modifier noReentrancy() {
        require(!locked, "No reentrancy allowed");
        locked = true;
        _;
        locked = false;
    }
    
    // Modifier that validates input
    modifier validValue(uint _value) {
        require(_value > 0, "Value must be greater than zero");
        _;
    }
    
    // Function using the onlyOwner modifier
    function changeOwner(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owner = newOwner;
    }
    
    // Function using multiple modifiers
    function setValue(uint _value) public onlyOwner validValue(_value) {
        value = _value;
    }
    
    // Function using the costs modifier
    function purchaseItem() public payable costs(0.1 ether) {
        // Process purchase
        value += 1;
    }
    
    // Function using the noReentrancy modifier
    function withdraw() public onlyOwner noReentrancy {
        uint amount = address(this).balance;
        (bool success, ) = payable(owner).call{value: amount}("");
        require(success, "Transfer failed");
    }
    
    // Multiple modifiers can be combined
    function complexFunction(uint _value) 
        public 
        payable 
        onlyOwner 
        validValue(_value) 
        costs(0.01 ether) 
        noReentrancy 
    {
        // Function implementation
        value = _value * 2;
    }
} 