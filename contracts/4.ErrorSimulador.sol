// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorSimulador {
    function funcionQueFalla() public pure returns (string memory) {
        require(false, "Esta funcion siempre falla");
    }

    function intentarLlamar() public returns (string memory) {
        try this.funcionQueFalla() returns (string memory result) {
            return result;
        } catch Error(string memory reason) {
            return string(abi.encodePacked("Error capturado: ", reason));
        }
    }
}

