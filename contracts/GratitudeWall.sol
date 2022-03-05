//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract GratitudeWall {
    struct Gratitude {
        address from;
        address to;
        string message;
        uint256 timestamp;
        uint256 amount;
    }

    Gratitude[] gratitude;
    event GratitudeEvent(address indexed from, address indexed to, string message, uint256 timestamp, uint256 amount);

    constructor() {
        console.log("Lets get started");
    }

    function addGratitude(address _to, string memory _message, uint256 _amount) public {
        Gratitude memory newGratitude = Gratitude(msg.sender, _to, _message, block.timestamp, _amount);
        gratitude.push(newGratitude);
        emit GratitudeEvent(msg.sender, _to, _message, block.timestamp, _amount);
    }

    function getAllGratiude() public view returns(Gratitude[] memory) {
        return gratitude;
    }
}
