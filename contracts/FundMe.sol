// Get funds from users
// withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe {
    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {
        require(getConversionRate(msg.value) >= minimumUsd , 'Didnt send enough Eth');
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function getPrice() public view returns (uint256){
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer ,,,) = dataFeed.latestRoundData();
//
        return uint256 (answer * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethAmount * ethPrice) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    //function withdraw() public {}
}