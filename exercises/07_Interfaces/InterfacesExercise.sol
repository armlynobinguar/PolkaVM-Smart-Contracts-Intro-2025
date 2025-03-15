// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title InterfacesExercise
 * @dev Complete the TODOs to practice working with interfaces
 */

// TODO: Create an interface named IERC20 with the following function declarations:
// - totalSupply() external view returns (uint256)
// - balanceOf(address account) external view returns (uint256)
// - transfer(address to, uint256 amount) external returns (bool)
// - allowance(address owner, address spender) external view returns (uint256)
// - approve(address spender, uint256 amount) external returns (bool)
// - transferFrom(address from, address to, uint256 amount) external returns (bool)

// TODO: Create an interface named IPaymentProcessor with the following function declarations:
// - processPayment(address recipient, uint256 amount) external returns (bool)
// - getProcessingFee() external view returns (uint256)

// TODO: Create a contract named SimpleToken that implements the IERC20 interface with:
// - State variables for name, symbol, decimals, and totalSupply
// - Mappings for balances and allowances
// - Implementations of all the interface functions

// TODO: Create a contract named PaymentProcessor that implements the IPaymentProcessor interface with:
// - A state variable for the processing fee
// - Implementations of all the interface functions

// TODO: Create a contract named TokenSender that:
// - Has a function to send tokens using the IERC20 interface
// - Has a function to process payments using the IPaymentProcessor interface 