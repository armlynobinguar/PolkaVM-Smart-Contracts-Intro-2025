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
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

// TODO: Create an interface named IPaymentProcessor with the following function declarations:
// - processPayment(address recipient, uint256 amount) external returns (bool)
// - getProcessingFee() external view returns (uint256)
interface IPaymentProcessor {
    function processPayment(address recipient, uint256 amount) external returns (bool);
    function getProcessingFee() external view returns (uint256);
}

// TODO: Create a contract named SimpleToken that implements the IERC20 interface with:
// - State variables for name, symbol, decimals, and totalSupply
// - Mappings for balances and allowances
// - Implementations of all the interface functions
abstract contract SimpleToken is IERC20 {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowances;

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        allowances[msg.sender][spender] = amount;
        return true;
    }    
    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        require(balances[from] >= amount, "Insufficient balance");
        require(allowances[from][msg.sender] >= amount, "Allowance exceeded");
        balances[from] -= amount;
        balances[to] += amount;
        allowances[from][msg.sender] -= amount;
        return true;
    }
}

// TODO: Create a contract named PaymentProcessor that implements the IPaymentProcessor interface with:
// - A state variable for the processing fee
// - Implementations of all the interface functions
contract PaymentProcessor is IPaymentProcessor {
    uint256 public processingFee;

    constructor(uint256 _processingFee) {
        processingFee = _processingFee;
    }

    function processPayment(address recipient, uint256 amount) public override returns (bool) {
        require(amount > processingFee, "Amount must be greater than processing fee");
        return true;
    }

    function getProcessingFee() public view override returns (uint256) {
        return processingFee;
    }
}   

// TODO: Create a contract named TokenSender that:
// - Has a function to send tokens using the IERC20 interface
// - Has a function to process payments using the IPaymentProcessor interface 
contract TokenSender {
    function sendTokens(address token, address recipient, uint256 amount) public {
        IERC20(token).transfer(recipient, amount);
    }

    function processPayment(address processor, address recipient, uint256 amount) public {
        IPaymentProcessor(processor).processPayment(recipient, amount);
    }
}      
