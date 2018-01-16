![Lightcash crypto](logo.svg "Lightcash crypto")

* _Standart_        : ERC20
* _Name_            : Lightcash crypto
* _Ticket_          : LCSH
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

* _Extra tokens percent_       : 15% 
* _Extra tokens wallet_        : 0xF0e830148F3d1C4656770DAa282Fda6FAAA0Fe0B

#### Links
* _Token_ - https://etherscan.io/token/0xb6ca384a32dae401a3682139968d1da2f5e98de2
* _PreTGE_ - https://etherscan.io/address/0x13bb437ceb28d37cf1a1f711112d9b111f0a11cb 
* _TGE_ - https://etherscan.io/address/0x2212efd06e557aea1bbbbcabe5ebb747194a9523#code

#### Pre Token Generation Event
* _Price_                      : 1 ETH = 7143 LCSH
* _Minimal insvested limit_    : 0.1 ETH
* _Softcap_                    : 7 142 857 LCSH
* _Hardcap_                    : 52 500 000 LCSH
* _Start_                      : Mon, 29 Jan 2018 13:00:00 GMT
* _Period_                     : 11 days
* _Contract manager_           : 0xF51E0a3a17990D41C5f1Ff1d0D772b26E4D6B6d0
* _Direct mint agent_          : 
* _ETH Wallet_                 : 0xDFDCAc0c9Eb45C63Bcff91220A48684882F1DAd0

#### Token Generation Event
* _Base price_                 : 1 ETH = 5000 LCSH
* _Minimal insvested limit_    : 0.01 ETH
* _Hardcap_                    : 126 000 000 LCSH
* _Start_                      : Mon, 05 Feb 2018 13:00:00 GMT
* _Contract manager_           : 0xF51E0a3a17990D41C5f1Ff1d0D772b26E4D6B6d0
* _Direct mint agent_          :  
* _ETH Wallet_                 : 0x3aC45b49A4D3CB35022fd8122Fd865cd1B47932f

_Milestones_
1. 7 days                     : discount 20%
2. 7 days                     : discount 15%
2. 7 days                     : discount 10%
2. 3 years                    : discount 5%

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
https://ropsten.etherscan.io/tx/0x12adf9f61ad9ed2b60e668dd695de78b6e0aa90602f8af71569c6d8b2eb7a74c
* 0.8 Ether => 800 tokens + 40 tokens to referrer, no discount, gas = 91264
https://ropsten.etherscan.io/tx/0x91fe917ff0aeecf715b0065328eb64e4f29a5a396fb81c6452e0007e0da80008

#### Service operations

* directMint, 0.1 Ether => 125 tokens, gas = 68731
https://ropsten.etherscan.io/tx/0x81edd8f9428623ad4b7281bcb2ba9f3a52bd7ac27723f164c5b924cf2e9de0ab
* finish, wrong extendedTokens value, gas = 93981
https://ropsten.etherscan.io/tx/0x619172522b59be0b0196948f381e64758fbaf4fb008afb1c27dee4e2ed5ec24f

## Ropsten network configuration (test #3 - softcap not reached, TGE inited manually)

### Crowdsale stages

#### Pre Token General Event
* _Price_                      : 1 ETH = 1250 LCC
* _Minimal insvested limit_    : 0.1 ETH
* _Softcap_                    : 7 142 857 LCC
* _Hardcap_                    : 37 500 000 LCC
* _Start_                      : Dec 19 2017 00:58:15 GMT+0300
* _Period_                     : 7 days
* _Contract manager_           : 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1
* _Direct mint agent_          : 
* _ETH Wallet_                 : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4

#### Token General Event
* _Base price_                 : 1 ETH = 1000 LCC
* _Minimal insvested limit_    : 0.1 ETH
* _Hardcap_                    : 500 LCC
* _Start_                      : Dec 19 2017 00:58:15 GMT+0300
* _Contract manager_           : 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1
* _Direct mint agent_          : 
* _ETH Wallet_                 : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4

_Milestones_
1. 10 days                     : discount 20%
2. 10 days                     : discount 10%
3. 10 days                     : no discount

#### Links
* _Token_  - https://ropsten.etherscan.io/address/0x79e12d58dfcb446b170fb202da58512d879a873e
* _PreTGE_ - https://ropsten.etherscan.io/address/0xe9a0269d9fd1a49510b998e692f9e0865d6a6280
* _TGE_    - https://ropsten.etherscan.io/address/0xa838ecc1a06bafb91ddb711840d12914d3a8cef0

### Test audit (PreTGE)

#### Purchasers
* 0.1 Ether => 125 tokens, discount = 20%, no referrer, gas = 132277
https://ropsten.etherscan.io/tx/0x5a1f2bff6d1ef39eb7f7d6ab60a3fcee1574ef97bfad20e6d94f6e729c2aef7a
* Rejected refund during the presale, gas = 22202
https://ropsten.etherscan.io/tx/0x9f99fd27cea7acd14708a4b28e898fcb74fe0f4d58e9591f1f930b5846c38b82
* Successful refund after presales end (softcap not reached), gas = 21921
https://ropsten.etherscan.io/tx/0x6decb1ed504e2c92fb322bfacc8bbfad2c2e95853cb45037b0ce5537aadb04fb
* Rejected refund repeated by the same investor, gas = 22553
https://ropsten.etherscan.io/tx/0xf57f1f9dc38d3b92e1dab65279447247dcbc78c9a6dd0a29c3a474a25c649f99

#### Service operations
* finish, gas = 28637
https://ropsten.etherscan.io/tx/0x71192cbd6242d2d239a274579a019781941acef36b3dd6ade124dd2f6226d6bf

### Test audit (PreTGE)

#### Purchasers
* 0.5 Ether => 625 tokens, discount = 20%, no referrer, gas = 90312
https://ropsten.etherscan.io/tx/0x40d8ba1c357469019b8e8c36f0da07389ec80096b62799b9534d01c652a99067

#### Service operations
* finish, gas = 96654
https://ropsten.etherscan.io/tx/0xcf5e910c4605ea057d2db27657eb04f23b6ba360864d16bb5202b2f42637a0ce

## Ropsten network configuration (test #3)

* _Extra tokens percent_       : 15% 
* _Extra tokens wallet_        : 0xf8b4Da46E85e43c47EBbF73ac8C6746fE3d3f111

#### Links
* _Token_ - 
* _PreTGE_ - 
* _TGE_ - 

#### Pre Token Generation Event
* _Price_                      : 1 ETH = 7143 LCSH
* _Minimal insvested limit_    : 0.1 ETH
* _Softcap_                    : 7 142 857 LCSH
* _Hardcap_                    : 52 500 000 LCSH
* _Start_                      : Mon, 29 Jan 2018 13:00:00 GMT
* _Period_                     : 11 days
* _Contract manager_           : 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1
* _Direct mint agent_          : 
* _ETH Wallet_                 : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4

#### Token Generation Event
* _Base price_                 : 1 ETH = 5000 LCSH
* _Minimal insvested limit_    : 0.01 ETH
* _Hardcap_                    : 126 000 000 LCSH
* _Start_                      : Mon, 05 Feb 2018 13:00:00 GMT
* _Contract manager_           : 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1
* _Direct mint agent_          :  
* _ETH Wallet_                 : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4

_Milestones_
1. 7 days                     : discount 20%
2. 7 days                     : discount 15%
2. 7 days                     : discount 10%
2. 3 years                    : discount 5%

### Test audit (PreTGE)

#### Purchasers
* transfer 0.05 LCSH during PreTGE, gas = 37590
https://ropsten.etherscan.io/tx/0xbfa92cbaa77af9ba8b5de112e368e9b599b8f7b142c999cbe40bea10702b5b5a
* 0.1 Eth => 714.3 LCSH, gas = 103512
https://ropsten.etherscan.io/tx/0x04554dc1bc1fd7818de4e34162ad67fa48fddc18b40d56d35c13cde5ae461965
* 1 Eth => 7143 LCSH + 714.3 LCSH to referrer, gas = 87086
https://ropsten.etherscan.io/tx/0x3afb0b7048efac1e212de17d54c324a06c3846c8b19897c4c60a7825231d8c5c
* 2 Eth => 14286 LCSH + 1000 LCSH to referrer (10 times less for testing purposes), gas = 87291
https://ropsten.etherscan.io/tx/0xa74a9fc9ccb41cb98347dc09b4882e41503abfc7937397fa7553ce284d5735e3

#### Service operations
* setStart, gas = 27998
https://ropsten.etherscan.io/tx/0xcc627fb469109a6a471f5bc67c6973535df1e6c56407c86a52e58c7074d9e35f
* directMintTokens (0.1 LCSH), gas = 91696
https://ropsten.etherscan.io/tx/0x1ee6245bb54e7434dd99437f511346e6d9e1f8bf4083cd4c553b24e5e0e72c47
* setMaxReferrerTokens, gas = 27838
https://ropsten.etherscan.io/tx/0x392ff72e6c7e0dba0624159b54195b6761c9557163eb36b9df049f2275197e7d
* setSoftcap, gas = 27440
https://ropsten.etherscan.io/tx/0xd7f76d8e8cc40061f342eced5dde6f769a60809c53d09d0e7ae54eb913045a71
* finish, gas = 39218
https://ropsten.etherscan.io/tx/0x6900df68f8930f3f6cc6b5a0ba3ca99f4054ab1709d43853c3a39b0406af5777

### Test audit (TGE)

#### Purchasers
* 0.1 Eth => 625 LCSH + 62.5 LCSH to referrer (discount = 25%)
https://ropsten.etherscan.io/tx/0xdfde4e085155ede90639fe3cc49134b6aa04825ff6935bb3d3e70213308acf58
* transfer, gas = 22654
https://ropsten.etherscan.io/tx/0x8c63533460b92359c9bf09c375792e6e09329d32258887ce19b6c31fd2aa4ebd
#### Service operations
* setStart, gas = 28042
https://ropsten.etherscan.io/tx/0x79c900d90a96f414980bcb9f6581218259cc98b739d506ed84d5297f10a58203
* finish =>  4457.576470588235294117 LCSH (15%) to extra tokens wallet, gas = 63715
https://ropsten.etherscan.io/tx/0x097e6dbf35b499dcddb7bde761290818bce488fc681f7973710ace79aa01ecd1
* directMintTokens (1 LCSH) after TGE's end , gas = 46387
https://ropsten.etherscan.io/tx/0xb5ea65bb51191c55f0121e9c396bedfd40777f2522820848394a9220eb4f34fc
* directMint (1 wei => 0.00000000000000625 LCSH) after TGE's end, gas = 53897
https://ropsten.etherscan.io/tx/0x444d0bf3e2d5a6245276b1c20312f1648af8e043ff8b4bf33af9c72d5631d4fe
