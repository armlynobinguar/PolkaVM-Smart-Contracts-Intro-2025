// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title HelloWorldExercise
 * @dev Complete the TODOs to create a Hello World contract
 */
contract HelloWorldExercise {
    // TODO: Create a state variable to store the greeting message
    string private greeting = "Greetings,";

    // TODO: Create a constructor that sets an initial greeting
    constructor(string memory initialGreeting){
        greeting = initialGreeting;
    }

    // TODO: Implement a function to get the current greeting
    function getGreeting() public view returns (string memory){
        return greeting;
    }

    // TODO: Implement a function to update the greeting
    function updateGreeting(string memory newGreeting) public{
        greeting = newGreeting;
    }

    // TODO: Add a function that returns a personalized greeting
    // combining the stored greeting with a name parameter
    string private name;

    function updateName(string memory _newName) public{
        name = _newName;
    }

    // Example: If greeting is "Hello" and name is "Alice", return "Hello, Alice!"
     function getPersonalizedGreeting() public view returns (string memory) {
        return string(abi.encodePacked(greeting, " ", name, "!"));
    }

} 