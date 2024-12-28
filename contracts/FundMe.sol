// Get funds from users
// withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract FundMe {

    function fund() public payable {
        require(msg.value >= 1e18, 'Not enough eth');
    }

    //function withdraw() public {}
}