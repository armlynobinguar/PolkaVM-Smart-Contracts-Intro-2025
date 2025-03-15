// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title EventsExercise
 * @dev Complete the TODOs to practice working with events
 */
contract EventsExercise {
    // TODO: Add a state variable uint256 public value initialized to 0
    uint256 public value;
    // TODO: Add a state variable address public owner initialized to the message sender
    address public owner;
    // TODO: Create an event ValueChanged(uint256 oldValue, uint256 newValue, address changedBy)
    event ValueChanged(uint256 oldValue, uint256 newValue, address changedBy);  
    // TODO: Create an event OwnershipTransferred(address indexed previousOwner, address indexed newOwner)
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);            
    // TODO: Create an event Deposit(address indexed from, uint256 amount, uint256 timestamp)
    event Deposit(address indexed from, uint256 amount, uint256 timestamp);
    // TODO: Implement a function setValue(uint256 newValue) that updates the value and emits the ValueChanged event
    function setValue(uint256 newValue) public {
        uint256 oldValue = value;
        value = newValue;
        emit ValueChanged(oldValue, newValue, msg.sender);
    }
    // TODO: Implement a function transferOwnership(address newOwner) that updates the owner and emits the OwnershipTransferred event
    function transferOwnership(address newOwner) public {
        address oldOwner = owner;
        owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
    // TODO: Implement a payable function deposit() that accepts Ether and emits the Deposit event
    function deposit() public payable {
        emit Deposit(msg.sender, msg.value, block.timestamp);
    }
} 