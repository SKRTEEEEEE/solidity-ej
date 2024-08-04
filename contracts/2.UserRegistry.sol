//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract UserRegistry {
    struct User {
        string nombre;
        uint8 edad;
        uint256 saldo;
    }

    // uint[] internal users;
    mapping(address => User) public users;

    function addUser(string memory _nombre, uint8 _edad) public{
        users[msg.sender] = User(_nombre, _edad, 0);
    }
}