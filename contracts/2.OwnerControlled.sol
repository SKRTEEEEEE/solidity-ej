//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerControlled {
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    modifier onlyOwner(){
        require(owner == msg.sender, "Solo permitido para el owner");
        _;
    }
    function changeOwner(address _owner) public onlyOwner {
        owner = _owner;
    }
    function restrictedFunction(uint256 num1, uint256 num2) public view onlyOwner returns(uint256) {
        return num1+num2;
    }
}