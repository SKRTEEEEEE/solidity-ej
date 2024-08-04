// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract VotingSystem {
    // Array público para almacenar las opciones de votación
    string[] public options;

    // Mapping público para almacenar los votos por opción
    mapping(string => uint256) public votes;

    // Mapping público para verificar si un usuario ya ha votado
    mapping(address => bool) public hasVoted;

    // Función para añadir una opción
    function addOption(string memory _option) public {
        options.push(_option);
        votes[_option] = 0; // Inicializa los votos para la nueva opción
    }

    // Función para votar por una opción
    function vote(string memory _option) public {
        require(!hasVoted[msg.sender], "Ya has votado.");
        require(votes[_option] >= 0, "Opcion no valida.");

        hasVoted[msg.sender] = true; // Marca al usuario como que ha votado
        votes[_option]++; // Incrementa el contador de votos para la opción
    }

    // Función para obtener el número de votos por opción
    function getVotes(string memory _option) public view returns (uint256) {
        return votes[_option];
    }

    // Función para obtener todas las opciones
    function getAllOptions() public view returns (string[] memory) {
        return options;
    }
}
