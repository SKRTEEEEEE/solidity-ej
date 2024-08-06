//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleBank {
    mapping (address => uint256) private cuentas;
    function desposit() public payable {
        require(msg.value > 0, "El importe ha de ser mayor a 0");
        cuentas[msg.sender] = msg.value;
    }
    function withdraw(uint256 _quantity) public {
        require(cuentas[msg.sender]>=_quantity, "No tienes suficiente saldo");
        cuentas[msg.sender] -= _quantity;
        payable(msg.sender).transfer(_quantity);
    }
    function checkBalance() public view returns (uint256){
        return cuentas[msg.sender];
    } 
}