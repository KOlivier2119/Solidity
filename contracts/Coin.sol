// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Coin {
    address public miner;
    mapping (address => uint) public balances;
    event Sent(address from, address to, uint amount);

    constructor () {
        miner = msg.sender;
    }

    function mint(address receiver, uint amount)public {
       require(miner == msg.sender);
       balances[receiver] += amount;
    }

    error InSufficientBalance(uint requested, uint available);

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient Balance");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}