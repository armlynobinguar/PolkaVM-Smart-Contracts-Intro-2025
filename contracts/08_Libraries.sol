// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Libraries
 * @dev Demonstrates libraries in Solidity
 */

// Math library for uint256
library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }
    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: division by zero");
        return a / b;
    }
}

// Library for address operations
library AddressUtils {
    function isContract(address addr) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(addr)
        }
        return size > 0;
    }
    
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");
        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value");
    }
}

// Library for array operations
library ArrayUtils {
    function contains(uint[] storage array, uint value) internal view returns (bool) {
        for (uint i = 0; i < array.length; i++) {
            if (array[i] == value) {
                return true;
            }
        }
        return false;
    }
    
    function removeByValue(uint[] storage array, uint value) internal returns (bool) {
        for (uint i = 0; i < array.length; i++) {
            if (array[i] == value) {
                // Move the last element to the position of the element to delete
                if (i < array.length - 1) {
                    array[i] = array[array.length - 1];
                }
                // Remove the last element
                array.pop();
                return true;
            }
        }
        return false;
    }
}

// Contract using libraries
contract UsingLibraries {
    // Using SafeMath for all uint256 operations
    using SafeMath for uint256;
    // Using AddressUtils for all address operations
    using AddressUtils for address;
    using AddressUtils for address payable;
    // Using ArrayUtils for uint[] operations
    using ArrayUtils for uint[];
    
    uint256 public value;
    uint[] public numbers;
    
    function addValue(uint256 amount) public {
        // Using SafeMath's add function
        value = value.add(amount);
    }
    
    function subtractValue(uint256 amount) public {
        // Using SafeMath's sub function
        value = value.sub(amount);
    }
    
    function checkAddress(address addr) public view returns (bool) {
        // Using AddressUtils' isContract function
        return addr.isContract();
    }
    
    function sendEther(address payable recipient, uint256 amount) public {
        // Using AddressUtils' sendValue function
        recipient.sendValue(amount);
    }
    
    function addNumber(uint number) public {
        numbers.push(number);
    }
    
    function containsNumber(uint number) public view returns (bool) {
        // Using ArrayUtils' contains function
        return numbers.contains(number);
    }
    
    function removeNumber(uint number) public returns (bool) {
        // Using ArrayUtils' removeByValue function
        return numbers.removeByValue(number);
    }
}

// Library with storage reference types
library StructLib {
    struct Data {
        uint256 a;
        uint256 b;
        bool flag;
    }
    
    function setValue(Data storage self, uint256 _a, uint256 _b) internal {
        self.a = _a;
        self.b = _b;
        self.flag = true;
    }
    
    function getSum(Data storage self) internal view returns (uint256) {
        return self.a + self.b;
    }
}

// Contract using a library with storage reference types
contract UsingStructLib {
    using StructLib for StructLib.Data;
    
    StructLib.Data public data;
    
    function setData(uint256 _a, uint256 _b) public {
        data.setValue(_a, _b);
    }
    
    function getDataSum() public view returns (uint256) {
        return data.getSum();
    }
} 