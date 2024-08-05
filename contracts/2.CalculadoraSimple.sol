// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalculadoraSimple {
    uint256 public num1 = 8;
    uint256 public num2 = 3;
    uint256 public resultadoSuma;
    bool public esMayor;

    function calcular() public {
        resultadoSuma = num1 + num2;
        esMayor = num1 > num2;

        require(resultadoSuma == 11, "La suma no es correcta");
        require(esMayor == true, "num1 no es mayor que num2");

    }

}