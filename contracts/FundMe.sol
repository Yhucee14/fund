// Get funds from users
// withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {PriceConverter} from './PriceConverter.sol';

contract FundMe {
    using PriceConverter for uint256;
    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd , 'Didnt send enough Eth');
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public {
        //for(starting index, ending index, step amount
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
           address funder = funders[funderIndex];
           addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0); //reset the array after withdrawal
        //withdraw the funds

        //how do we actually send funds to whoever called the withdraw function?
        //transfer, send or call

        
    }
}