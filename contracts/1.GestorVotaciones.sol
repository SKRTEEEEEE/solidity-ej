//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "contracts/1.IVotacion.sol";
contract GestorVotaciones {
    IVotacion public sistemaVotacion;
    function setSistema(IVotacion _sistema) public {
        sistemaVotacion = _sistema;
    }
    function emitirVoto(uint256 _opcion) public {
        sistemaVotacion.votar(_opcion);
    } 
    function getResultados() public view returns (uint256[]memory) {
        return sistemaVotacion.obtenerResultados();
    }
}