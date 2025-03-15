// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ModifiersExercise
 * @dev Complete the TODOs to practice working with function modifiers
 */
contract ModifiersExercise {
    // TODO: Add a state variable address public owner initialized to the message sender
    address public owner;
    
    // TODO: Add a state variable uint256 public value initialized to 0
    uint256 public value;
    
    // TODO: Add a state variable bool public locked initialized to false
    bool public locked;
    
    // TODO: Create a modifier onlyOwner that allows only the owner to call a function
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    
    // TODO: Create a modifier validValue(uint256 _value) that requires the value to be greater than 0
    modifier validValue(uint256 _value) {
        require(_value > 0, "Value must be greater than 0");
        _;
    }
    
    // TODO: Implement a function setValue(uint256 newValue) that uses both onlyOwner and validValue modifiers
    function setValue(uint256 newValue) public onlyOwner validValue(newValue) {
        value = newValue;
    }
    
    // TODO: Implement a function lock() that uses the onlyOwner modifier to set locked to true
    function lock() public onlyOwner {
        locked = true;
    }
    
    // TODO: Implement a function unlock() that uses the onlyOwner modifier to set locked to false
    function unlock() public onlyOwner {
        locked = false;
    }
    
    // TODO: Implement a function incrementValue(uint256 amount) that uses all three modifiers
    function incrementValue(uint256 amount) public onlyOwner validValue(amount) {
        value += amount;
    }
} 