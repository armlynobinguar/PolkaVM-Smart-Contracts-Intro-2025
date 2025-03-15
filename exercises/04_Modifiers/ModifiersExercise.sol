// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ModifiersExercise
 * @dev Complete the TODOs to practice working with function modifiers
 */
contract ModifiersExercise {
    // TODO: Add a state variable address public owner initialized to the message sender
    
    // TODO: Add a state variable uint256 public value initialized to 0
    
    // TODO: Add a state variable bool public locked initialized to false
    
    // TODO: Create a modifier onlyOwner that allows only the owner to call a function
    
    // TODO: Create a modifier validValue(uint256 _value) that requires the value to be greater than 0
    
    // TODO: Create a modifier notLocked that requires the contract to not be locked
    
    // TODO: Implement a function setValue(uint256 newValue) that uses both onlyOwner and validValue modifiers
    
    // TODO: Implement a function lock() that uses the onlyOwner modifier to set locked to true
    
    // TODO: Implement a function unlock() that uses the onlyOwner modifier to set locked to false
    
    // TODO: Implement a function incrementValue(uint256 amount) that uses all three modifiers
} 