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

    function addGratitude(address _to, string memory _message) payable public {
        require(msg.value > 0, "You must send a positive amount of ether");
        Gratitude memory newGratitude = Gratitude(msg.sender, _to, _message, block.timestamp, msg.value);
        gratitude.push(newGratitude);
        emit GratitudeEvent(msg.sender, _to, _message, block.timestamp, msg.value);
        payable(_to).transfer(msg.value);
    }

    function getAllGratiude() public view returns(Gratitude[] memory) {
        return gratitude;
    }
}
