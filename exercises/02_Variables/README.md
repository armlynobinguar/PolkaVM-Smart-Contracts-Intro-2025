# Variables Exercise

## Objective

Practice working with different variable types in Solidity.

## Tasks

1. Create a contract named `VariablesExercise`
2. Declare variables of the following types:
   - `uint256` named `counter` initialized to 0
   - `address` named `owner` initialized to the message sender
   - `bool` named `active` initialized to true
   - `string` named `description` initialized to "Solidity Exercise"
3. Create a struct named `User` with the following properties:
   - `string name`
   - `uint256 age`
   - `address userAddress`
4. Create a mapping from `address` to `User` named `users`
5. Create an array of `uint256` named `values`
6. Implement a function to add a user to the mapping
7. Implement a function to add a value to the array
8. Implement a function to get a user from the mapping
9. Implement a function to get all values from the array

## Testing Your Solution

Deploy your contract using Hardhat: 