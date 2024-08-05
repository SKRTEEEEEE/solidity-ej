//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "contracts/1.IVotacion.sol";
contract VotacionSimple is IVotacion {
    address public owner;
    string[] private opciones;
    uint256[] private resultados;
    mapping (address => bool) private haVotadoMap;
    mapping (address => bool) private votantesRegistrados;

    modifier soloVotanteRegistrado(){
        require(votantesRegistrados[msg.sender], "Votante no registrado!");
        _;
    }
    modifier onlyOwner(){
        require(owner==msg.sender,"Accion no permitida");
        _;
    }
    constructor() {
        owner = msg.sender;
    }
    function registrarOpcion(string memory _opcion) public onlyOwner {
        opciones.push(_opcion);
        resultados.push(0); // Inicializar el conteo de votos para la nueva opción
    }
    function registrarVotante(address votante) external override onlyOwner {
        votantesRegistrados[votante] = true;
        // emit VotanteRegistrado(votante);
    }

    function votar(uint256 opcion) external override soloVotanteRegistrado {
        
        require(!haVotadoMap[msg.sender], "Ya has votado");
        require(opcion < resultados.length, "Opcion no valida");
        resultados[opcion]++;

        haVotadoMap[msg.sender] = true;
        // emit VotoEmitido(msg.sender, opcion);
    }

    function obtenerResultados() external view override returns (uint256[] memory) {
        return resultados;
    }
    function obtenerOpciones() external view returns(string[] memory){
        return opciones;
    }

    function haVotado(address votante) external view override returns (bool) {
        return haVotadoMap[votante];
    }
}