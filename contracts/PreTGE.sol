pragma solidity ^0.4.18;

import './CommonTokenEvent.sol';


contract PreTGE is CommonTokenEvent {

  uint public softcap;

  bool public refundOn;

  bool public softcapAchieved;

  address public nextSaleAgent;

  mapping (address => uint) public balances;

  event RefundsEnabled();

  event SoftcapReached();

  event Refunded(address indexed beneficiary, uint256 weiAmount);

  function setPeriod(uint newPeriod) public onlyOwner {
    period = newPeriod;
  }

  function calculateTokens(uint investedInWei) public view returns(uint) {
    return investedInWei.mul(price).div(1 ether);
  }

  function setNextSaleAgent(address newNextSaleAgent) public onlyOwner {
    nextSaleAgent = newNextSaleAgent;
  }

  function setSoftcap(uint newSoftcap) public onlyOwner {
    softcap = newSoftcap;
  }

  function refund() public {
    require(now > start && refundOn && balances[msg.sender] > 0);
    uint value = balances[msg.sender];
    balances[msg.sender] = 0;
    msg.sender.transfer(value);
    Refunded(msg.sender, value);
  }

  function widthraw() public {
    require(softcapAchieved);
    wallet.transfer(this.balance);
  }

  function createTokens() public payable canMint {
    balances[msg.sender] = balances[msg.sender].add(msg.value);
    super.calculateAndTransferTokensWithReferer(msg.sender, msg.value);
    if (!softcapAchieved && minted >= softcap) {
      softcapAchieved = true;
      SoftcapReached();
    }
  }

  function finish() public onlyOwner {
    if (!softcapAchieved) {
      refundOn = true;
      RefundsEnabled();
    } else {
      widthraw();
      token.setSaleAgent(nextSaleAgent);
    }
  }

}
