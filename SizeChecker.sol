// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SizeChecker {

    // Checks the contract size and will return a uint256 number in bytes (24576 bytes - max size of a solidity contract to be deployed)
    function checkContractSize(address contractAddress) public view returns(uint size) {
        assembly{
            size := extcodesize(contractAddress)
        }
    }

    function hasExceededMax(address contractAddress) public view returns(bool, uint spaceLeft){
        return (checkContractSize(contractAddress) > 24576, 24576 - checkContractSize(contractAddress));
    }

}