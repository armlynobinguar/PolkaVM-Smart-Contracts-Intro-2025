# Functions Exercise

## Objective

Practice creating and using different types of functions in Solidity.

## Tasks

1. Create a contract named `FunctionsExercise`
2. Add a state variable `uint256 public value` initialized to 0
3. Implement a function `setValue(uint256 newValue)` that updates the value
4. Implement a view function `getValue()` that returns the current value
5. Implement a pure function `add(uint256 a, uint256 b)` that returns the sum of two numbers
6. Implement a function `addToValue(uint256 amount)` that adds the amount to the current value
7. Implement a function with multiple return values `getMinAndMax(uint256 a, uint256 b)` that returns both the minimum and maximum of two numbers
8. Implement a payable function `deposit()` that accepts Ether and updates a balance variable
9. Implement a function `getBalance()` that returns the contract's balance

## Testing Your Solution

Deploy your contract using Hardhat: 