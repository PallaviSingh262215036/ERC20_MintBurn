// SPDX-License-Identifier: MIT
// SPDX: Software Data Exchange MIT: Open Sourse
pragma solidity >=0.6.12 <0.9.0;
// version of compiler

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
contract ERC20Token is ERC20{
  
    address public Owner;
    uint256 public TotalSupply;
    mapping (address=>uint256) public BalanceOf;
   

  
  constructor() ERC20("DegenToken", "DGN"){
        Owner=msg.sender;

  }
   
  function transfer( address to, uint256 amount) public override returns (bool) {
  require(to!=address(0),"You are sending to Invalid address");
  require(BalanceOf[msg.sender]>=amount,"Insufficient balance to send");
  
  BalanceOf[msg.sender]=BalanceOf[msg.sender]-amount;
  BalanceOf[to]=BalanceOf[to]+amount;
   return true;
    
    }  
 
  
  function mint(address to, uint256 amount) public {
    require(msg.sender==Owner,"Only Owner");
    require(to!=address(0),"you are minting to Zero address bro!");
    BalanceOf[to]+=amount;
    TotalSupply+=amount;
  }

  function burn(address to, uint256 amount) public{
    require(to!=address(0),"you are burning to Zero address bro!");
    require(BalanceOf[to]>=amount,"Insufficient balance");
    BalanceOf[to]-=amount;
    TotalSupply-=amount;
  }
  
    
}



