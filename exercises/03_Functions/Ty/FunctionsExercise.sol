// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title FunctionsExercise
 * @dev Complete the TODOs to practice working with different function types
 */
contract FunctionsExercise {
    // TODO: Add a state variable uint256 public value initialized to 0
    uint256 public value;

    // TODO: Implement a function setValue(uint256 newValue) that updates the value
    function setValue(uint256 newValue) public {
        value = newValue;
    }

    // TODO: Implement a view function getValue() that returns the current value
    function getValue() public view returns (uint256) {
        return value;
    }

    // TODO: Implement a pure function add(uint256 a, uint256 b) that returns the sum
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // TODO: Implement a function addToValue(uint256 amount) that adds the amount to value
    function addToValue(uint256 amount) public {
        value += amount;
    }

    // TODO: Implement a function getMinAndMax(uint256 a, uint256 b) that returns both min and max
    function getMinAndMax(uint256 a, uint256 b) public pure returns (uint256, uint256) {
        return (a < b ? a : b, a > b ? a : b);
    }

    // TODO: Implement a payable function deposit() that accepts Ether and updates a balance variable
    uint256 public balance;

    function deposit() public payable {
        balance += msg.value;
    }

    // TODO: Implement a function getBalance() that returns the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
} 