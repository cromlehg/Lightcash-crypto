pragma solidity ^0.4.18;

import './StagedTokenEvent.sol';


contract TGE is StagedTokenEvent {

  address public foundersTokensWallet;

  address public escrowTokensWallet;

  uint public foundersTokensPercent;

  uint public escrowTokensPercent;

  function setFoundersTokensWallet(address newFoundersTokensWallet) public onlyOwner {
    foundersTokensWallet = newFoundersTokensWallet;
  }

  function setEscrowTokensWallet(address newEscrowTokensWallet) public onlyOwner {
    escrowTokensWallet = newEscrowTokensWallet;
  }

  function setFoundersTokensPercent(uint newFoundersTokensPercent) public onlyOwner {
    foundersTokensPercent = newFoundersTokensPercent;
  }

  function setEscrowTokensPercent(uint newEscrowTokensPercent) public onlyOwner {
    escrowTokensPercent = newEscrowTokensPercent;
  }

  function calculateTokens(uint investedInWei) public view returns(uint) {
    return investedInWei.mul(price).mul(STAGES_PERCENT_RATE).div(STAGES_PERCENT_RATE.sub(getDiscount())).div(1 ether);
  }

  function finish() public onlyOwner {
    uint256 totalSupply = token.totalSupply();
    uint extraTokensPercent = foundersTokensPercent.add(escrowTokensPercent);
    uint allTokens = totalSupply.mul(PERCENT_RATE).div(PERCENT_RATE.sub(extraTokensPercent));
    uint foundersTokens = allTokens.mul(foundersTokensPercent).div(PERCENT_RATE);
    uint escrowTokens = allTokens.mul(escrowTokensPercent).div(PERCENT_RATE);
    mintAndSendTokens(foundersTokensWallet, foundersTokens);
    mintAndSendTokens(escrowTokensWallet, escrowTokens);
    //token.finishMinting();
  }

  function createTokens() public payable canMint {
    wallet.transfer(msg.value);
    calculateAndTransferTokensWithReferer(msg.sender, msg.value);
  }

}
