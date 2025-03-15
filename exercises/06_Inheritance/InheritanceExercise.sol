// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title InheritanceExercise
 * @dev Complete the TODOs to practice working with inheritance
 */

// TODO: Create a base contract named Ownable with:
// - A state variable address public owner initialized to the message sender
// - A modifier onlyOwner that allows only the owner to call a function
// - A function transferOwnership(address newOwner) that transfers ownership to a new address

// TODO: Create a base contract named Pausable with:
// - A state variable bool public paused initialized to false
// - A modifier whenNotPaused that requires the contract to not be paused
// - A modifier whenPaused that requires the contract to be paused
// - A function pause() that sets paused to true
// - A function unpause() that sets paused to false

// TODO: Create a contract named Token that inherits from Ownable with:
// - A state variable string public name
// - A state variable uint256 public totalSupply
// - A mapping balances that maps addresses to token balances
// - A constructor that sets the name and initial supply
// - A function transfer(address to, uint256 amount) that transfers tokens

// TODO: Create a contract named PausableToken that inherits from both Token and Pausable with:
// - A constructor that calls the parent constructor
// - An override of the transfer function that only works when not paused
// - Overrides of the pause and unpause functions that only the owner can call 