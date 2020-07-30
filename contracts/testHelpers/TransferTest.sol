pragma solidity >=0.5.8 <0.8.0;


contract TransferTest {
  constructor() payable { }
  receive() external payable { }

  function fireTransfer(address payable target, uint256 amount) public {
    target.transfer(amount); // ignore-swc-105 - this is a test file, and is meant to do this!
  }

}
