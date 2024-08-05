//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Cartera {
    mapping (address=> uint256) public balances;
    function depositar() public payable {
        balances[msg.sender] += msg.value;
    }
    function verBalance() public view returns(uint256){
        return address(this).balance;
    }
    function retirarFondos(uint256 _cantidad) public{
        require(balances[msg.sender] >= _cantidad, "Saldo insuficiente");
        balances[msg.sender] -= _cantidad;
        address payable destinatario = payable(msg.sender);
        destinatario.transfer(_cantidad);
    } 
}