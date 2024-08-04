//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract VotacionSimple {
    bool public votacionAbierta = true;
    address public owner;
    mapping(address => bool) public votos;
    mapping(string=>uint256) public conteoVotos;
    event VotoEmitido(address indexed voted);
    event VotacionCerrada();
    modifier votacionEnCurso(){
        require(votacionAbierta, "Votacion no disponible");
        _;
    }
    modifier noHaVotado(){
        require(votos[msg.sender]==false, "Ya has votado");
        _;
    }
    constructor(){
        owner = msg.sender;
    }
    function votar(string memory opcion) public votacionEnCurso noHaVotado {
        
        votos[msg.sender] = true;
        conteoVotos[opcion] += 1;
        emit VotoEmitido(msg.sender);
    }
    function cerrarVotacion() public {
        require(msg.sender==owner, "Solo el admin puede");
        votacionAbierta = false;
        emit VotacionCerrada();
    }

}