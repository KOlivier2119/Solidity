// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Auction {
    event Start();

    address payable public seller;

    bool public started;
    bool public ended;
    uint public endAt;

    uint public highestBid;
    address public highestBidder;
    mapping(address => uint) public bids;

    constructor () {
        seller =  payable(msg.sender);
    }

    function start() external {
        require(!started, "Already started!");
        require(msg.sender == seller, "You did not start");
        started = true;
        endAt = block.timestamp + 7 days;
        emit Start();
    }   

    function bid() external payable  {
        require(started, "Not started");
        require(block.timestamp < endAt, "Ended!");
        require(msg.value > highestBid);

        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid;
        }

        highestBid = msg.value;
        highestBidder = msg.sender;
        }

    function end() external {
        require(started, "You need to start first!");
        require(block.timestamp >= endAt, "Auction is still ongoing");
        require(!ended, "Auction already ended!");

        ended = true;
        emit End(highestBidder, highestBid);
    }