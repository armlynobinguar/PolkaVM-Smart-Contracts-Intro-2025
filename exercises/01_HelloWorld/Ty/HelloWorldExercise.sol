// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title HelloWorldExercise
 * @dev Complete the TODOs to create a Hello World contract
 */
contract HelloWorldExercise {
    // TODO: Create a state variable to store the greeting message
    string public greeting;
    
    // TODO: Create a constructor that sets an initial greeting
    constructor() {
        greeting = "Hello, World!";
    }
    
    // TODO: Implement a function to get the current greeting
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
    
    // TODO: Implement a function to update the greeting
    function setGreeting(string memory newGreeting) public {
        greeting = newGreeting;
    }
    
    // TODO: Add a function that returns a personalized greeting
    function personalizedGreeting(string memory name) public view returns (string memory) {
        return string.concat(greeting, ", ", name, "!");
    }
} 