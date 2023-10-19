// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SizeChecker {

    uint16 constant MAX_CONTRACT_SIZE = 24576;
    uint16 constant UINT16_MAX_VALUE = 65535;

    // Checks the contract size and will return a uint256 number in bytes (24576 bytes - max size of a solidity contract to be deployed)
    function checkContractSize(address contractAddress) public view returns(uint16 size) {
        assembly{
            size := extcodesize(contractAddress)
        }
    }

    function hasExceededMax(address contractAddress) public view returns(bool hasExceeded, uint16 spaceLeft, uint16 exceededBy){

        uint16 contractSize = checkContractSize(contractAddress);

        if(contractSize > MAX_CONTRACT_SIZE){
            exceededBy = contractSize - MAX_CONTRACT_SIZE;
            hasExceeded = true;
        }

        if(contractSize <= MAX_CONTRACT_SIZE){
            spaceLeft = MAX_CONTRACT_SIZE - contractSize;
        }

        return (hasExceeded, spaceLeft, exceededBy);
    }

}