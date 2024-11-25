// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    uint value;
    function increment() public returns (uint){
         value += 1;
         return value;
    }

    function decrement() public returns (uint) {
       value -= 1;
       return value;
    }

    function square() public view returns (uint){
        return value * value;
    }

    function getValue() public view returns (uint) {
        return value;
    }

    function setValue(uint _value) public {
        value = _value;
    }
}