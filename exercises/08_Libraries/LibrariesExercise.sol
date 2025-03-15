// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title LibrariesExercise
 * @dev Complete the TODOs to practice working with libraries
 */

// TODO: Create a library named MathLib with the following functions:
// - add(uint256 a, uint256 b) internal pure returns (uint256) - adds two numbers safely
// - sub(uint256 a, uint256 b) internal pure returns (uint256) - subtracts safely
// - mul(uint256 a, uint256 b) internal pure returns (uint256) - multiplies safely
// - div(uint256 a, uint256 b) internal pure returns (uint256) - divides safely

// TODO: Create a library named ArrayLib with the following functions:
// - indexOf(uint256[] storage arr, uint256 value) internal view returns (int256) - finds the index of a value
// - contains(uint256[] storage arr, uint256 value) internal view returns (bool) - checks if array contains a value
// - removeByValue(uint256[] storage arr, uint256 value) internal returns (bool) - removes a value
// - sum(uint256[] storage arr) internal view returns (uint256) - sums all values

// TODO: Create a contract named Calculator that uses the MathLib library with:
// - Functions that call each of the library functions
// - A state variable to store the result of calculations

// TODO: Create a contract named ArrayManager that uses the ArrayLib library with:
// - A state variable array of uint256
// - Functions to add, remove, check, and sum values using the library 