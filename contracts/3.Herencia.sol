//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Producto {
    string public nombre;
    constructor(string memory _nombre){
        nombre=_nombre;
    }
}

contract ProductoPerecedero is Producto{
    uint256 public fechaExpiracion;
    constructor(string memory _nombre, uint256 _fechaExpiracion) Producto(_nombre){
        fechaExpiracion = _fechaExpiracion;
    }
}