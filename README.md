![Lightcash crypto](logo.png "Lightcash crypto")

* _Standart_        : ERC20
* _Name_            : Lightcash crypto
* _Ticket_          : LCC
* _Decimals_        : 18
* _Emission_        : Mintable
* _Token events_    : 2
* _Fiat dependency_ : No
* _Tokens locked_   : Yes

## Social links
### Facebook - https://www.facebook.com/Lightcash-Blockchain-System-Corp-186597301891722
### Twitter - https://twitter.com/Lightcash_token
### Reddit - https://www.reddit.com/user/Lightcash_blockchain
### Telegram - http://t.me/lightcashvwallet
### Medium - https://medium.com/@mail_58026
### Instagram - https://www.instagram.com/lightcash_wallet/

## Smart-contracts description

Contract mint bounty, advisors and founders tokens after each stage finished. 
Crowdsale contracts have special function to retrieve transferred in errors tokens.

### Contracts contains
1. _LightcashCryptoToken_ 
2. _PreTGE_
3. _TGE_

### How to manage contract
To start working with contract you should follow next steps:
1. Compile it in Remix with enamble optimization flag and compiler 0.4.18
2. Deploy bytecode with MyEtherWallet. 

After crowdsale contract manager must call finishMinting. 

### How to invest
To purchase tokens investor should send ETH (more than minimum 0.1 EHT) to corresponding crowdsale contract.
Recommended GAS: 200 000 , GAS PRICE - 30 Gwei.

### Wallets with ERC20 support
1. MyEtherWallet - https://www.myetherwallet.com/
2. Parity 
3. Mist/Ethereum wallet

EXODUS not support ERC20, but have way to export key into MyEtherWallet - http://support.exodus.io/article/128-how-do-i-receive-unsupported-erc20-tokens

Investor must not use other wallets, coinmarkets or stocks. Can lose money.

## Main network configuration

* _Extra tokens_               : 5% 
* _Extra tokens lock period_   : 100 days after TGE
* _Extra tokens wallet_        : 0xF0e830148F3d1C4656770DAa282Fda6FAAA0Fe0B

#### Links
* _Token_ - 
* _PreTGE_ - 
* _TGE_ - 

#### Pre Token General Event
* _Price_                      : 1 ETH = 1250 LCC
* _Minimal insvested limit_    : 0.1 ETH
* _Softcap_                    : 7 142 857 LCC
* _Hardcap_                    : 37 500 000 LCC
* _Start_                      : Mon, 08 Jan 2018 13:00:00 GMT
* _Period_                     : 7 days
* _Contract manager_           : 0xF51E0a3a17990D41C5f1Ff1d0D772b26E4D6B6d0
* _Direct mint agent_          : 
* _ETH Wallet_                 : 0xDFDCAc0c9Eb45C63Bcff91220A48684882F1DAd0

#### Token General Event
* _Base price_                 : 1 ETH = 1000 LCC
* _Minimal insvested limit_    : 0.1 ETH
* _Hardcap_                    : 105 000 000 LCC
* _Start_                      : Mon, 15 Jan 2018 14:00:00 GMT
* _Contract manager_           : 0xF51E0a3a17990D41C5f1Ff1d0D772b26E4D6B6d0
* _Direct mint agent_          :  
* _ETH Wallet_                 : 0x3aC45b49A4D3CB35022fd8122Fd865cd1B47932f

_Milestones_
1. 10 days                     : discount 20%
2. 10 days                     : discount 10%
3. 10 days                     : no discount

## Ropsten network configuration (test #1 - softcap reached)

### Crowdsale stages

#### Pre Token General Event
* _Price_                      : 1 ETH = 1250 LCC
* _Minimal insvested limit_    : 0.1 ETH
* _Softcap_                    : 7 142 857 LCC
* _Hardcap_                    : 37 500 000 LCC
* _Start_                      : Mon, 08 Jan 2018 13:00:00 GMT
* _Period_                     : 7 days
* _Contract manager_           : 0x55dd7a6353fc004b4f6da9855f9403b35f4530b1
* _Direct mint agent_          : 0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A
* _ETH Wallet_                 : 0xf62158b03edbdb92a12c64e4d8873195ac71af6a


#### Links
* _Token_  - https://ropsten.etherscan.io/address/0x398f221ba60641cdd226b5e49c5f5257c7e9fc23
* _PreTGE_ - https://ropsten.etherscan.io/address/0xb431b80b65cf69578bddc8bb422f7a80701540e3

### Test audit (PreTGE)

#### Purchasers
* 0.1 Ether => 125 tokens + 6.25 tokens to referrer, gas = 176557
https://ropsten.etherscan.io/tx/0x04adee7297d61608d64855f285af204d8190b7866835257361bb8b0e9a222d8a
* Rejected purchase when purchaser try to set himself as referrer, gas = 62892
https://ropsten.etherscan.io/tx/0x696a2e4443c3c2160ad6b45c242ccfc44616c0852d17cdf9c761a71689165c89
* Rejected purchase after the end of the presale, gas = 31487
https://ropsten.etherscan.io/tx/0x8f895a529a0d55e73839768791649fb678895156058ff5bac570802452786955

#### Service operations
* setStart, gas = 27869
https://ropsten.etherscan.io/tx/0x637872f8ef419adac4357b0e263139f413497eff1c9e222b1a37ea3ab6b64afe
* setDirectMintAgent, gas = 43883
https://ropsten.etherscan.io/tx/0x53eaf6e01a69956928f7754a297d61a61276f59d1ace6a1eef84e14a10c164de
* directMint, gas = 67168
https://ropsten.etherscan.io/tx/0x05e497d3214e9ec84c84701d2fe93da7f647971bb74f9087702e9fa43791dadd
* finish, gas = 39048
https://ropsten.etherscan.io/tx/0xe15c840e9d36760dcd0522034d7c34c0633ad523d0500d08ed1c3a6478de4cd6

## Ropsten network configuration (test #2 - softcap reached)

### Crowdsale stages

#### Pre Token General Event
* _Price_                      : 1 ETH = 1250 LCC
* _Minimal insvested limit_    : 0.1 ETH
* _Softcap_                    : 7 142 857 LCC
* _Hardcap_                    : 37 500 000 LCC
* _Start_                      : Mon, 08 Jan 2018 13:00:00 GMT
* _Period_                     : 7 days
* _Contract manager_           : 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1
* _Direct mint agent_          : 0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A
* _ETH Wallet_                 : 0xf62158b03edbdb92a12c64e4d8873195ac71af6a

#### Token General Event
* _Base price_                 : 1 ETH = 1000 LCC
* _Minimal insvested limit_    : 0.1 ETH
* _Hardcap_                    : 105 000 000 LCC
* _Start_                      : Mon, 15 Jan 2018 14:00:00 GMT
* _Contract manager_           : 0xF51E0a3a17990D41C5f1Ff1d0D772b26E4D6B6d0
* _Direct mint agent_          :  
* _ETH Wallet_                 : 0x3aC45b49A4D3CB35022fd8122Fd865cd1B47932f

_Milestones_
1. 10 days                     : discount 20%
2. 10 days                     : discount 10%
3. 10 days                     : no discount

#### Links
* _Token_  - https://ropsten.etherscan.io/address/0x79e12d58dfcb446b170fb202da58512d879a873e
* _PreTGE_ - https://ropsten.etherscan.io/address/0xa0cbffd70fd527225876b5fde1990d41be247b90
* _TGE_    - https://ropsten.etherscan.io/address/0xba75c2366637f9243bd972372f82681ac8b38c51

### Test audit (PreTGE)

#### Purchasers
* Rejected purchase with value < minimal invested limit, gas = 22021
https://ropsten.etherscan.io/tx/0x2758c5191d0918d003f5ef044789252b89c32027a7216a42d72ff1b87b948055
* 0.1 Ether => 125 tokens, no referrer, gas = 138152
https://ropsten.etherscan.io/tx/0x1a25e5715b801420c3236d82ee4b74f686bfe7a5188b5a4675156e32d0a2031d
* Rejected refund during the presale, gas = 22139
https://ropsten.etherscan.io/tx/0x951806d9b9ed2ea4c18ead1f107e48bc9ed92dd67251921e9b483dc0d4c20ae7

#### Service operations
* Rejected setSofcap triggered by non owner, gas = 21944
https://ropsten.etherscan.io/tx/0xd28c701750d5f1b45bf5b0f16b507945f2e045231dae71410ceb23f41d3e36ec
* setSoftcap, gas = 26951
https://ropsten.etherscan.io/tx/0x404da44048a32200b7f31f4087c62bef3f089904caa40f8aca90566645893d89
* finish, gas = 39048
https://ropsten.etherscan.io/tx/0xc43dc5fb2dbfe60c75cd6159268bd93ba83a3b296103250f22c36adbc76f6a6f

### Test audit (TGE)

#### Purchasers
* 0.1 Ether => 125 tokens, discount = 20%, no referrer, gas = 90186
https://ropsten.etherscan.io/tx/0xec9ea302e35447f90ec8170411f956772fde92ffafe03f7ccc2dccd946f2dc33
* 0.1 Ether => 111.111111111111111111 tokens, discount = 10%, gas = 60993
0x12adf9f61ad9ed2b60e668dd695de78b6e0aa90602f8af71569c6d8b2eb7a74c
* 0.8 Ether => 800 tokens + 40 tokens to referrer, no discount, gas = 91264
https://ropsten.etherscan.io/tx/0x91fe917ff0aeecf715b0065328eb64e4f29a5a396fb81c6452e0007e0da80008

#### Service operations

* directMint, 0.1 Ether => 125 tokens, gas = 68731
https://ropsten.etherscan.io/tx/0x81edd8f9428623ad4b7281bcb2ba9f3a52bd7ac27723f164c5b924cf2e9de0ab
* finish, wrong extendedTokens value, gas = 93981
https://ropsten.etherscan.io/tx/0x619172522b59be0b0196948f381e64758fbaf4fb008afb1c27dee4e2ed5ec24f
