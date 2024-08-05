// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VariablesEjemplo {
    int256 public miNumeroEntero = -5;
    uint public miNumeroPositivo = 15;
    bool public esActivo = true;

    function verificarVariables() public view {
        require(miNumeroEntero == -5, "El numero entero no es correcto");
        require(miNumeroPositivo == 15, "El numero positivo no es correcto");
        require(esActivo == true, "El estado no es correcto"); 
    }
}