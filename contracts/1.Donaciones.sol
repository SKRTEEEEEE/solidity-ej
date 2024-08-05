//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface IDonacion {
    function donar() external payable;
    function obtenerTotalDonado() external returns(uint256);
    function obtenerUltimaDonacion(address donante) external  returns (uint256);
}

contract DonacionSimple is IDonacion{
    uint256 internal totalDonado;
    mapping(address=>uint256) internal donaciones;
    function donar() public payable {
        donaciones[msg.sender] = msg.value;
        totalDonado += msg.value;
    }
    function obtenerTotalDonado() public view returns(uint256){
        return totalDonado;
    }
    function obtenerUltimaDonacion(address donante) public view returns(uint256){
        return donaciones[donante];
    }
}

struct Donacion {
    uint256 cantidad;
    uint256 timestamp;

}
contract DonacionDetallada is IDonacion{
    uint256 internal totalDonado;
    mapping(address => Donacion[]) internal donaciones;
        function donar() public payable {
        donaciones[msg.sender].push(Donacion({cantidad: msg.value, timestamp: block.timestamp}));
        // donaciones[msg.sender] = msg.value;
        totalDonado += msg.value;
    }
    function obtenerTotalDonado() public view returns(uint256){
        return totalDonado;
    }
    function obtenerUltimaDonacion(address donante) public view returns(uint256){
        Donacion[] storage historialDonante = donaciones[donante];
        uint length = historialDonante.length;
        if(length > 0){
            return historialDonante[length - 1].cantidad;
        } else {
            return 0;
        }
    }
}

contract GestorDonaciones{
    IDonacion public sistemaDonacion;
    constructor(IDonacion _donacion){
        sistemaDonacion = _donacion;
    }
    function realizarDonacion() public payable {
        sistemaDonacion.donar{value: msg.value}();
    }
    function getTotalDonado() public returns(uint256) {
        return sistemaDonacion.obtenerTotalDonado();
    }

    function getUltimaDonacion() public returns(uint256){
        return sistemaDonacion.obtenerUltimaDonacion(msg.sender);
    }
    function getUltimaDonacionAddress(address _donante) public returns(uint256){
        return sistemaDonacion.obtenerUltimaDonacion(_donante);
    }
}
