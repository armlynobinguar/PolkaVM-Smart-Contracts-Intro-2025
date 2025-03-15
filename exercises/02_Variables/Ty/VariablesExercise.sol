// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title VariablesExercise
 * @dev Complete the TODOs to practice working with different variable types
 */
contract VariablesExercise {
    // TODO: Declare a uint256 named counter initialized to 0
    uint256 public counter;
    
    // TODO: Declare an address named owner initialized to the message sender
    address public owner;

    // TODO: Declare a bool named active initialized to true
    bool public active;

    // TODO: Declare a string named description initialized to "Solidity Exercise"
    string public description;
    
    // TODO: Create a struct named User with string name, uint256 age, and address userAddress
    struct User {
        string name;
        uint256 age;
        address userAddress;
    }

    // TODO: Create a mapping from address to User named users
    mapping(address => User) public users;
    
    // TODO: Create an array of uint256 named values
    uint256[] public values;
    
    // TODO: Implement a function to add a user to the mapping
    function addUser(string memory name, uint256 age, address userAddress) public {
        users[msg.sender] = User(name, age, userAddress);
    }

    // TODO: Implement a function to add a value to the array
    function addValue(uint256 value) public {
        values.push(value);
    }

    // TODO: Implement a function to get a user from the mapping
    function getUser(address userAddress) public view returns (User memory) {
        return users[userAddress];
    }

    // TODO: Implement a function to get all values from the array
    function getAllValues() public view returns (uint256[] memory) {
        return values;
    }
} 