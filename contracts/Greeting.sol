//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract Greeting {
    string public message;

    constructor(){
        message = "Hola, Mundo!";
    }
    function getMessage() public view returns (string memory){
        return message;
    }
}