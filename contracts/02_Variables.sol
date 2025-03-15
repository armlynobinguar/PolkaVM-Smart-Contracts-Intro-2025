// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Variables
 * @dev Demonstrates different variable types in Solidity
 */
contract Variables {
    // State variables (stored on blockchain)
    bool public myBool = true;
    uint public myUint = 123;
    int public myInt = -10;
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    string public myString = "Hello Solidity";
    bytes32 public myBytes32 = "Hello";
    
    // Enum type
    enum Status { Pending, Approved, Rejected }
    Status public status = Status.Pending;
    
    // Array types
    uint[] public dynamicArray = [1, 2, 3];
    uint[3] public fixedArray = [4, 5, 6];
    
    // Mapping type (like a hash table)
    mapping(address => uint) public balances;
    
    // Struct type
    struct Person {
        string name;
        uint age;
    }
    Person public person = Person("Alice", 25);
    
    // Function to demonstrate local variables
    function localVariables() public pure returns (uint) {
        // Local variables (only exist during function execution)
        uint localUint = 456;
        bool localBool = false;
        
        if (localBool) {
            return localUint;
        } else {
            return 0;
        }
    }
    
    // Function to demonstrate variable visibility
    uint private privateVar = 10;
    uint internal internalVar = 20;
    uint public publicVar = 30;
    
    function getPrivateVar() public view returns (uint) {
        return privateVar;
    }
} 