# Modifiers Exercise

## Objective

Practice creating and using function modifiers for access control and input validation.

## Tasks

1. Create a contract named `ModifiersExercise`
2. Add a state variable `address public owner` initialized to the message sender
3. Add a state variable `uint256 public value` initialized to 0
4. Add a state variable `bool public locked` initialized to false
5. Create a modifier `onlyOwner` that allows only the owner to call a function
6. Create a modifier `validValue(uint256 _value)` that requires the value to be greater than 0
7. Create a modifier `notLocked` that requires the contract to not be locked
8. Implement a function `setValue(uint256 newValue)` that uses both `onlyOwner` and `validValue` modifiers
9. Implement a function `lock()` that uses the `onlyOwner` modifier to set locked to true
10. Implement a function `unlock()` that uses the `onlyOwner` modifier to set locked to false
11. Implement a function `incrementValue(uint256 amount)` that uses all three modifiers

## Testing Your Solution

Deploy your contract using Hardhat: 