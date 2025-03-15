// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title HelloWorld
 * @dev A simple contract to demonstrate basic Solidity syntax
 */
contract HelloWorld {
    string private message;
    
    // Constructor runs when the contract is deployed
    constructor(string memory initialMessage) {
        message = initialMessage;
    }
    
    // Function to get the current message
    function getMessage() public view returns (string memory) {
        return message;
    }
    
    // Function to update the message
    function setMessage(string memory newMessage) public {
        message = newMessage;
    }
} 