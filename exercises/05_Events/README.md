# Events Exercise

## Objective

Practice creating and emitting events for logging and frontend notifications.

## Tasks

1. Create a contract named `EventsExercise`
2. Add a state variable `uint256 public value` initialized to 0
3. Add a state variable `address public owner` initialized to the message sender
4. Create an event `ValueChanged(uint256 oldValue, uint256 newValue, address changedBy)`
5. Create an event `OwnershipTransferred(address indexed previousOwner, address indexed newOwner)`
6. Create an event `Deposit(address indexed from, uint256 amount, uint256 timestamp)`
7. Implement a function `setValue(uint256 newValue)` that updates the value and emits the ValueChanged event
8. Implement a function `transferOwnership(address newOwner)` that updates the owner and emits the OwnershipTransferred event
9. Implement a payable function `deposit()` that accepts Ether and emits the Deposit event

## Testing Your Solution

Deploy your contract using Hardhat: 