pragma solidity ^0.4.18;

import './ownership/Ownable.sol';
import './LightcashCryptoToken.sol';
import './PreTGE.sol';
import './TGE.sol';


contract Deployer is Ownable {

  LightcashCryptoToken public token;

  PreTGE public preTGE;

  TGE public tge;

  function deploy() public onlyOwner {
    token = new LightcashCryptoToken();

    preTGE = new PreTGE();
    preTGE.setPrice(7143000000000000000000); // 1 ETH = 7143 LCCT
    preTGE.setMinPurchaseLimit(100000000000000000); // 0.1 ETH
    preTGE.setSoftcap(7000000000000000000000000); // 7 000 000 LCCT
    preTGE.setHardcap(52500000000000000000000000); // 52 000 000 LCCT
    preTGE.setStart(1519995600); // Fri Mar 02 2018 16:00:00 GMT+0300
    preTGE.setPeriod(11);
    preTGE.setWallet(0xDFDCAc0c9Eb45C63Bcff91220A48684882F1DAd0);
    preTGE.setMaxReferrerTokens(10000000000000000000000); // 10 000 LCCT
    preTGE.setReferrerPercent(10);

    tge = new TGE();
    tge.setPrice(5000000000000000000000); // 5 000 LCCT
    tge.setMinPurchaseLimit(10000000000000000); // 0.01 ETH
    tge.setHardcap(126000000 000000000000000000); // 126 000 000 LCCT
    tge.setStart(1520859600); // Mar 12 2018 16:00:00 GMT+0300
    tge.setWallet(0x3aC45b49A4D3CB35022fd8122Fd865cd1B47932f);
    tge.setExtraTokensWallet(0xF0e830148F3d1C4656770DAa282Fda6FAAA0Fe0B);
    tge.setExtraTokensPercent(15);
    tge.addStage(7, 20);
    tge.addStage(7, 15);
    tge.addStage(7, 10);
    tge.addStage(1000, 5);
    tge.setMaxReferrerTokens(10000000000000000000000); // 10 000 LCCT
    tge.setReferrerPercent(10);

    preTGE.setToken(token);
    tge.setToken(token);
    preTGE.setNextSaleAgent(tge);
    token.setSaleAgent(preTGE);

    address newOnwer = 0xF51E0a3a17990D41C5f1Ff1d0D772b26E4D6B6d0;
    token.transferOwnership(newOnwer);
    preTGE.transferOwnership(newOnwer);
    tge.transferOwnership(newOnwer);
  }

}
