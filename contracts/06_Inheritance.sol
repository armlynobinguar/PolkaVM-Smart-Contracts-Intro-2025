// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Inheritance
 * @dev Demonstrates inheritance patterns in Solidity
 */

// Base contract
contract Ownable {
    address public owner;
    
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: caller is not the owner");
        _;
    }
    
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}

// Another base contract
contract Pausable {
    bool public paused;
    
    event Paused(address account);
    event Unpaused(address account);
    
    modifier whenNotPaused() {
        require(!paused, "Pausable: paused");
        _;
    }
    
    modifier whenPaused() {
        require(paused, "Pausable: not paused");
        _;
    }
    
    function pause() public virtual {
        paused = true;
        emit Paused(msg.sender);
    }
    
    function unpause() public virtual {
        paused = false;
        emit Unpaused(msg.sender);
    }
}

// Contract inheriting from Ownable
contract Token is Ownable {
    string public name;
    uint public totalSupply;
    
    mapping(address => uint) public balances;
    
    constructor(string memory _name, uint _initialSupply) {
        name = _name;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }
    
    function transfer(address to, uint amount) public virtual {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}

// Multiple inheritance
contract PausableToken is Token, Pausable {
    constructor(string memory _name, uint _initialSupply) 
        Token(_name, _initialSupply) 
    {}
    
    // Override function from parent
    function transfer(address to, uint amount) public override whenNotPaused {
        super.transfer(to, amount);
    }
    
    // Override function with access control
    function pause() public override onlyOwner {
        super.pause();
    }
    
    function unpause() public override onlyOwner {
        super.unpause();
    }
}

// Abstract contract
abstract contract RewardDistributor {
    function distributeRewards() public virtual;
}

// Contract inheriting from abstract contract
contract RewardToken is PausableToken, RewardDistributor {
    constructor(string memory _name, uint _initialSupply) 
        PausableToken(_name, _initialSupply) 
    {}
    
    // Implement abstract function
    function distributeRewards() public override onlyOwner {
        // Implementation
    }
} 