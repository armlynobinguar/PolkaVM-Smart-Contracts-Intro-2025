// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title VariablesExercise
 * @dev Complete the TODOs to practice working with different variable types
 */
contract VariablesExercise {
    // TODO: Declare a uint256 named counter initialized to 0
    uint public counter = 0;

    // TODO: Declare an address named owner initialized to the message sender
    address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // TODO: Declare a bool named active initialized to true
    bool public active = true;
    
    // TODO: Declare a string named description initialized to "Solidity Exercise"
    string public description = "Solidity Exercise";

    // TODO: Create a struct named User with string name, uint256 age, and address userAddress
    struct User {
        string name;
        uint age;
        address userAddress;
    }

    // TODO: Create a mapping from address to User named users
    mapping(address => User) public users;
    
    // TODO: Create an array of uint256 named values
    uint[] public values;  

    // TODO: Implement a function to add a user to the mapping
    constructor() {
        owner = msg.sender;
    }

    // TODO: Implement a function to add a value to the array
    function addUser(string memory _name, uint256 _age) public {
        users[msg.sender] = User(_name, _age, msg.sender);
    }

    // TODO: Implement a function to get a user from the mapping
    function getUser(address _userAddress) public view returns (string memory, uint256, address) {
        User memory user = users[_userAddress];
        return (user.name, user.age, user.userAddress);
    }

    // TODO: Implement a function to get all values from the array
    function getAllValues() public view returns (uint256[] memory) {
        return values;
    }
} 