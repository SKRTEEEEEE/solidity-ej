// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract UserRegistry {
    struct User {
        string nombre;
        uint8 edad;
        uint256 saldo;
    }

    User[] internal users;

    function addUser(string memory _nombre, uint8 _edad) public {
        users.push(User(_nombre, _edad, 0));
    }

    function getUser(uint256 index) public view returns (string memory, uint8, uint256) {
        require(index < users.length, "Usuario no encontrado.");
        User memory user = users[index];
        return (user.nombre, user.edad, user.saldo);
    }

    function getUserCount() public view returns (uint256) {
        return users.length;
    }
}
