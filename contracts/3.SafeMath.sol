// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SafeMath {
    // Suma dos números, devuelve el resultado o lanza un error si ocurre un desbordamiento.
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= type(uint256).max - a, "SafeMath: addition overflow");
        return a + b;
    }

    // Resta dos números, devuelve el resultado o lanza un error si ocurre un desbordamiento.
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }
}
