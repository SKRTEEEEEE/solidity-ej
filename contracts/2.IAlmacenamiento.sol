// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IAlmacenamiento {
    function guardar(string memory _dato) external ;
    function recuperar()external view returns(string memory);
}

contract AlmacenamientoSimple is IAlmacenamiento{
    string private dato;
    function guardar(string memory _dato) public override  {
        dato=_dato;
    }
    function recuperar() public view override  returns(string memory){
        return dato;
    }
}

contract AlmacenamientoUltimoValor is IAlmacenamiento{
    string[] private datos;
    function guardar(string memory _dato) public override  {
        datos.push(_dato);
    }
    function recuperar() public view override  returns(string memory){
        require(datos.length > 0, "No hay datos almacenados.");
        return datos[datos.length - 1];
    }
}

contract GestorAlmacenamiento{
    IAlmacenamiento public almacenamiento;

    function establecerAlmacenamiento(IAlmacenamiento _almacenamiento) public {
        almacenamiento = _almacenamiento;
    }

    function guardarDato(string memory _dato) public {
        almacenamiento.guardar(_dato);
    }
    function recuperarDato() public view returns(string memory){
        return almacenamiento.recuperar();
    }
}