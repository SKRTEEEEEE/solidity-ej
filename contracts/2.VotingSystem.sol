// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract VotingSystem {
    // Array público para almacenar las opciones de votación
    string[] public options;

    // Mapping público para almacenar los votos por opción
    mapping(uint256 => uint256) public votes;

    // Mapping público para verificar si un usuario ya ha votado
    mapping(address => bool) public hasVoted;

    // Función para añadir una opción
    function addOption(string memory _option) public {
        options.push(_option);
        votes[options.length - 1] = 0; // Inicializa los votos para la nueva opción
    }

    // Función para votar por una opción utilizando el índice
    function vote(uint256 index) public {
        require(!hasVoted[msg.sender], "Ya has votado.");
        require(index < options.length, "Opcion no valida."); // Verifica que el índice sea válido

        hasVoted[msg.sender] = true; // Marca al usuario como que ha votado
        votes[index]++; // Incrementa el contador de votos para la opción en el índice
    }

    // Función para obtener el número de votos por opción utilizando el índice
    function getVotes(uint256 index) public view returns (uint256) {
        require(index < options.length, "Opcion no valida."); // Verifica que el índice sea válido
        return votes[index];
    }

    // Función para obtener todas las opciones
    function getAllOptions() public view returns (string[] memory) {
        return options;
    }
}
