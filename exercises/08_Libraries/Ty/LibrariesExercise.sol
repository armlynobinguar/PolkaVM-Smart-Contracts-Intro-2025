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
library MathLib {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }
}


// TODO: Create a library named ArrayLib with the following functions:
// - indexOf(uint256[] storage arr, uint256 value) internal view returns (int256) - finds the index of a value
// - contains(uint256[] storage arr, uint256 value) internal view returns (bool) - checks if array contains a value
// - removeByValue(uint256[] storage arr, uint256 value) internal returns (bool) - removes a value
// - sum(uint256[] storage arr) internal view returns (uint256) - sums all values
library ArrayLib {
    function indexOf(uint256[] storage arr, uint256 value) internal view returns (int256) {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == value) {
                return int256(i);
            }
        }
        return -1;
    }
    function contains(uint256[] storage arr, uint256 value) internal view returns (bool) {
        return indexOf(arr, value) != -1;
    }
    function removeByValue(uint256[] storage arr, uint256 value) internal returns (bool) {
        int256 index = indexOf(arr, value); 
        if (index == -1) {
            return false;
        }
        delete arr[uint256(index)];
        return true;
    }   
    function sum(uint256[] storage arr) internal view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            total += arr[i];
        }
        return total;
    }   
}   

// TODO: Create a contract named Calculator that uses the MathLib library with:
// - Functions that call each of the library functions
// - A state variable to store the result of calculations
contract Calculator {
    using MathLib for uint256;
    uint256 public result;

    function add(uint256 a, uint256 b) public {
        result = a.add(b);
    }
    function sub(uint256 a, uint256 b) public {
        result = a.sub(b);
    }
    function mul(uint256 a, uint256 b) public {
        result = a.mul(b);
    }
    function div(uint256 a, uint256 b) public {
        result = a.div(b);
    }
}   


// TODO: Create a contract named ArrayManager that uses the ArrayLib library with:
// - A state variable array of uint256
// - Functions to add, remove, check, and sum values using the library 
contract ArrayManager {
    using ArrayLib for uint256[];
    uint256[] public array;

    function add(uint256 value) public {
        array.push(value);
    }
    function remove(uint256 value) public {
        array.removeByValue(value);
    }      
    function contains(uint256 value) public view returns (bool) {
        return array.contains(value);
    }
    function sum() public view returns (uint256) {
        return array.sum();
    }
}      
