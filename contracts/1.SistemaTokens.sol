//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
abstract contract Token{
    string public name;
    string public symbol;
    event Transfer(address indexed from, address indexed to, uint256 quantity);
    mapping(address=>uint256) public balances;
    function send(address _addressTo, uint256 _quantity)public{
        require(balances[msg.sender]>=_quantity,"No tienes suficiente balance en tu cuenta");
        balances[msg.sender] -= _quantity;
        balances[_addressTo] += _quantity;
        emit Transfer(msg.sender, _addressTo, _quantity);
    }
    function transfer(address _addressTo, address _addressFrom, uint256 _quantity) public virtual {
        require(balances[_addressFrom]>=_quantity,"addressFrom no tiene suficiente balance en su cuenta");
        balances[_addressFrom] -= _quantity;
        balances[_addressTo] += _quantity;
        emit Transfer(_addressFrom, _addressTo, _quantity);
    }
}

contract MiToken is Token{
    address public owner;
    constructor(string memory _name, string memory _symbol){
        name=_name;
        symbol=_symbol;
        owner=msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender==owner,"No tienes permiso");
        _;
    }
    function transfer(address _addressTo, address _addressFrom, uint256 _quantity) public override onlyOwner {
        balances[_addressFrom] -= _quantity;
        balances[_addressTo] += _quantity;
        emit Transfer(_addressFrom, _addressTo, _quantity);
    }
    function mint(address _addressTo, uint256 _quantity)public onlyOwner{
        balances[_addressTo] += _quantity;
    }
}