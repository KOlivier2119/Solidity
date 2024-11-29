// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyContract {
     address public lastSender;

     function receive() external payable { 
        lastSender = msg.sender;
     }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function pay(address payable addr) public payable {
        (bool sent,) = addr.call{value: 1 ether} ("");
        require(sent, "Failed to send");
          }
}