// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    uint public value;
    function increment() external returns (uint){
        return value += 1;
    }

    function decrement() public returns (uint) {
        return value -= 1;
    }

    function square() public view returns (uint){
        return value * value;
    }

    function getValue() public view returns (uint) {
        return value;
    }
}