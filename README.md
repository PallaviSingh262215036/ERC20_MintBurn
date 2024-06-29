# ERC20 Token Contract

This project implements an ERC20 token using Solidity. The contract allows minting, burning, and transferring tokens.

## Prerequisites

- Solidity compiler version >=0.6.12 <0.9.0
- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts) library

## Contract Overview

The contract is an implementation of the ERC20 standard, inheriting from OpenZeppelin's ERC20 contract. It includes functionalities for minting and burning tokens by the owner and transferring tokens between addresses.

### Contract: ERC20Token.sol

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract ERC20Token is ERC20 {
    address public Owner;
    uint256 public TotalSupply;
    mapping (address => uint256) public BalanceOf;

    constructor() ERC20("DegenToken", "DGN") {
        Owner = msg.sender;
    }
   
    function transfer(address to, uint256 amount) public override returns (bool) {
        require(to != address(0), "You are sending to an invalid address");
        require(BalanceOf[msg.sender] >= amount, "Insufficient balance to send");
        
        BalanceOf[msg.sender] -= amount;
        BalanceOf[to] += amount;
        return true;
    }  
  
    function mint(address to, uint256 amount) public {
        require(msg.sender == Owner, "Only Owner");
        require(to != address(0), "You are minting to a zero address!");
        
        BalanceOf[to] += amount;
        TotalSupply += amount;
    }

    function burn(address to, uint256 amount) public {
        require(to != address(0), "You are burning from a zero address!");
        require(BalanceOf[to] >= amount, "Insufficient balance");
        
        BalanceOf[to] -= amount;
        TotalSupply -= amount;
    }
}
```

### Usage
- Deploy the contract using Remix IDE or your preferred Solidity development environment.
- Once deployed, the contract owner can mint new tokens to any address.
- Token holders can transfer tokens to other addresses.
- The owner can burn tokens from any address.

### Functions
`constructor()`: Initializes the contract with the token name "DegenToken" and symbol "DGN".
`transfer(address to, uint256 amount)`: Transfers amount tokens to the to address.
`mint(address to, uint256 amount)`: Mints amount tokens to the to address. Can only be called by the contract owner.
`burn(address to, uint256 amount)`: Burns amount tokens from the to address. Can only be called by the contract owner.

### License
This project is licensed under the MIT License 
