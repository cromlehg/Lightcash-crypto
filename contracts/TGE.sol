pragma solidity ^0.4.18;

import './StagedTokenEvent.sol';


contract TGE is StagedTokenEvent {

  address public extraTokensWallet;

  uint public extraTokensPercent;

  uint public extraTokensLockPeriod;

  function setExtraTokensWallet(address newExtraTokensWallet) public onlyOwner {
    extraTokensWallet = newExtraTokensWallet;
  }

  function setExtraTokensPercent(uint newExtraTokensPercent) public onlyOwner {
    extraTokensPercent = newExtraTokensPercent;
  }

  function setExtraTokensLockPeriod(uint newExtraTokensLockPeriod) public onlyOwner {
    extraTokensLockPeriod = newExtraTokensLockPeriod;
  }

  function calculateTokens(uint investedInWei) public view returns(uint) {
    return investedInWei.mul(price).mul(STAGES_PERCENT_RATE).div(STAGES_PERCENT_RATE.sub(getDiscount())).div(1 ether);
  }

  function finish() public onlyOwner {
    uint256 totalSupply = token.totalSupply();
    uint allTokens = totalSupply.mul(PERCENT_RATE).div(PERCENT_RATE.sub(extraTokensPercent));
    uint extraTokens = allTokens.mul(extraTokensPercent).div(PERCENT_RATE);
    mintAndSendTokens(extraTokensWallet, extraTokens);
    token.lock(extraTokensWallet, extraTokensLockPeriod);
    token.finishMinting();
  }

  function createTokens() public payable canMint {
    wallet.transfer(msg.value);
    calculateAndTransferTokensWithReferer(msg.sender, msg.value);
  }

}
