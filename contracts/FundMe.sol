// Get funds from users
// withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe {
    uint256 public minimumUsd = 5;

    function fund() public payable {
        require(msg.value >= minimumUsd , 'No minimum amount');
    }

    function getPrice() public{
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
    }

    function getConversionRate() public{

    }

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    //function withdraw() public {}
}