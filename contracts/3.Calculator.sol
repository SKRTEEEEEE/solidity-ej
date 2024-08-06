// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/3.SafeMath.sol"; // Asegúrate de que la ruta sea correcta

contract Calculator {
    using SafeMath for uint256;

    function addNumbers(uint256 a, uint256 b) public pure returns (uint256) {
        return a.add(b);
    }

    function subtractNumbers(uint256 a, uint256 b) public pure returns (uint256) {
        return a.sub(b);
    }
}