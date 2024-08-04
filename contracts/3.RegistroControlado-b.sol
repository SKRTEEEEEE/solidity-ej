//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract RegistroControlado{
    address public owner;
    mapping (address=>string) private registros;
    event RegistroAgregado(address indexed _direccion, string _registro);
    modifier onlyOwner() {
        require(msg.sender == owner, "Esta accion no esta permitida");
        _;
    }
    constructor(){
        owner=msg.sender;
    }
    function agregarRegistro(address cuenta, string memory registro) public onlyOwner{
        registros[cuenta] = registro;
        emit RegistroAgregado(cuenta,registro);
    }
    function obtenerRegistro(address cuenta) public view returns (string memory) {
        return registros[cuenta];
    }
}