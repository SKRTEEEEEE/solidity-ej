//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVotacion {
    function registrarVotante(address votante) external;
    function votar(uint256 opcion) external;
    function obtenerResultados()external view returns (uint256[]memory);
    function haVotado(address votante) external view returns (bool);
}
