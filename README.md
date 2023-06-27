# Solidity Contract Size Checker

This contract will help you check if the size of your contract has exceeded the limit set by the evm which is `24576 bytes`.

To use this, there are 2 ways:

## 1. Using Development Environments (hardhat local, remix, etc...)

- deploy this contract and the contract you want to check the size of
- use `checkContractSize(contractAddress)` function to check the exact size your contract currrently occupy.
- use `hasExceededMax(contractAddress)` function to check if your contract has exceeded the contract size limit and how many bytes are left for you to work with.
  
## 2. Using Testnets

- deploy this contract on the testnet where a contract you want to check the size is deployed.
- use the same functions as the one said in the first option.
