// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Functions
 * @dev Demonstrates different function types and patterns in Solidity
 */
contract Functions {
    uint public value = 10;
    address public owner;
    
    // Constructor
    constructor() {
        owner = msg.sender;
    }
    
    // Basic function that modifies state
    function setValue(uint _value) public {
        value = _value;
    }
    
    // View function (doesn't modify state)
    function getValue() public view returns (uint) {
        return value;
    }
    
    // Pure function (doesn't access state)
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
    
    // Function with access control
    function adminFunction() public {
        require(msg.sender == owner, "Only owner can call this function");
        value = 100;
    }
    
    // Function with multiple return values
    function returnMultiple() public pure returns (uint, bool, string memory) {
        return (5, true, "Hello");
    }
    
    // Function with named return values
    function namedReturns() public pure returns (uint x, bool y, string memory z) {
        x = 5;
        y = true;
        z = "Hello";
        // No return statement needed
    }
    
    // Function that receives Ether
    function deposit() public payable {
        // Function body can be empty
    }
    
    // Function to get contract balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    // Function with error handling
    function divide(uint a, uint b) public pure returns (uint) {
        require(b > 0, "Cannot divide by zero");
        return a / b;
    }
    
    // Function with custom error
    error InsufficientBalance(uint requested, uint available);
    
    function withdraw(uint amount) public {
        if (amount > address(this).balance) {
            revert InsufficientBalance({
                requested: amount,
                available: address(this).balance
            });
        }
        payable(msg.sender).transfer(amount);
    }
} 