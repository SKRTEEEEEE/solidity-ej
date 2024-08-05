// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContadorSimple {
    function contarHasta(uint256 limite) public pure returns (uint256) {
        uint256 contador = 0;
        for (uint256 i = 1; i <= limite; i++) {
            contador++;
        }
        return contador; // Debería ser igual a limite
    }
}
