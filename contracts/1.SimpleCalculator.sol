//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleCalculator {
    function add(uint256 a, uint256 b) public pure returns (uint256){
        return a + b;
    }
    function substract(uint256 a, uint256 b) public pure returns(uint256){
        return a - b;
    }
}