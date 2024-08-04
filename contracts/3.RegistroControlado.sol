// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RegistroControlado {
    // Variable de estado que almacena la dirección del propietario del contrato
    address public owner;

    // Mapping que asocia direcciones con cadenas de texto
    mapping(address => string) private registros;

    // Evento que se emite cuando se agrega un nuevo registro
    event RegistroAgregado(address indexed _direccion, string _registro);

    // Modificador que restringe el acceso a ciertas funciones solo al propietario
    modifier onlyOwner() {
        require(msg.sender == owner, "No tienes permiso para realizar esta accion.");
        _;
    }

    // Constructor que establece el propietario del contrato
    constructor() {
        owner = msg.sender; // El creador del contrato es el propietario
    }

    // Función que permite al propietario agregar un registro para una dirección
    function agregarRegistro(address _direccion, string memory _registro) public onlyOwner {
        registros[_direccion] = _registro; // Agrega el registro
        emit RegistroAgregado(_direccion, _registro); // Emite el evento
    }

    // Función que permite a cualquiera consultar el registro de una dirección
    function obtenerRegistro(address _direccion) public view returns (string memory) {
        return registros[_direccion]; // Devuelve el registro asociado a la dirección
    }
}
