//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract AdvancedCalculator{
    uint256 public lastResult;
    function add(uint256 a, uint256 b) public returns(uint256){
        lastResult = a + b;
        return lastResult;
    }
    function substract(uint256 a, uint256 b) public returns(uint256){
        require(b<a, "First number should be bigger");
        lastResult = a - b;
        return lastResult;
    }
    function multiply(uint256 a, uint256 b) public returns(uint256){
        lastResult= a * b;
        return lastResult;
    }
    function divide(uint256 a, uint256 b) public returns(uint256){
        require(b!=0, "Cant divide by 0");
        lastResult = a/b;
        return lastResult;
    }
    
}