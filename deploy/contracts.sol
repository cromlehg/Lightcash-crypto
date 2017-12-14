pragma solidity ^0.4.18;

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
  uint256 public totalSupply;
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }

}

/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * @dev https://github.com/ethereum/EIPs/issues/20
 * @dev Based on code by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;


  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    Transfer(_from, _to, _value);
    return true;
  }

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   *
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }

  /**
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   */
  function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

  function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
    uint oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() public {
    owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) onlyOwner public {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}

contract LightcashCryptoToken is StandardToken, Ownable {	

  event Mint(address indexed to, uint256 amount);

  event MintFinished();
    
  string public constant name = "Lightcash crypto";
   
  string public constant symbol = "LCC";
    
  uint32 public constant decimals = 18;

  bool public mintingFinished = false;
 
  address public saleAgent;

  modifier notLocked() {
    require(msg.sender == owner || msg.sender == saleAgent || mintingFinished);
    _;
  }

  function transfer(address _to, uint256 _value) public notLocked returns (bool) {
    return super.transfer(_to, _value);
  }

  function transferFrom(address from, address to, uint256 value) public notLocked returns (bool) {
    return super.transferFrom(from, to, value);
  }

  function setSaleAgent(address newSaleAgent) public {
    require(saleAgent == msg.sender || owner == msg.sender);
    saleAgent = newSaleAgent;
  }

  function mint(address _to, uint256 _amount) public returns (bool) {
    require(!mintingFinished);
    require(msg.sender == saleAgent);
    totalSupply = totalSupply.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    Mint(address(0), _amount);
    Transfer(address(0), _to, _amount);
    return true;
  }

  function finishMinting() public returns (bool) {
    require(!mintingFinished);
    require(msg.sender == owner || msg.sender == saleAgent);
    mintingFinished = true;
    MintFinished();
    return true;
  }

}

contract CommonTokenEvent is Ownable {

  using SafeMath for uint;

  uint public constant PERCENT_RATE = 1000;

  uint public price;

  uint public start;

  uint public period;

  uint public minPurchaseLimit;

  uint public minted;

  uint public hardcap;
  
  uint public invested;
  
  uint public refererPercent;

  address public directMintAgent;
  
  address public wallet;

  LightcashCryptoToken public token;

  modifier canMint() {
    require(now >= start && now < lastSaleDate() && msg.value >= minPurchaseLimit && minted < hardcap);
    _;
  }

  modifier onlyDirectMintAgentOrOwner() {
    require(directMintAgent == msg.sender || owner == msg.sender);
    _;
  }

  function sendRefererTokens(uint tokens) internal {
    if(msg.data.length == 20) {
      address referer = bytesToAddres(bytes(msg.data));
      require(referer != address(token) && referer != msg.sender);
      uint refererTokens = tokens.mul(refererPercent).div(PERCENT_RATE);
      mintAndSendTokens(referer, refererTokens);
    }
  }

  function bytesToAddres(bytes source) internal pure returns(address) {
    uint result;
    uint mul = 1;
    for(uint i = 20; i > 0; i--) {
      result += uint8(source[i-1])*mul;
      mul = mul*256;
    }
    return address(result);
  }

  function setHardcap(uint newHardcap) public onlyOwner { 
    hardcap = newHardcap;
  }

  function setToken(address newToken) public onlyOwner { 
    token = LightcashCryptoToken(newToken);
  }

  function setRefererPercent(uint newRefererPercent) public onlyOwner { 
    refererPercent = newRefererPercent;
  }

  function setStart(uint newStart) public onlyOwner {
    start = newStart;
  }

  function setPrice(uint newPrice) public onlyOwner {
    price = newPrice;
  }

  function lastSaleDate() public view returns(uint) {
    return start + period;
  }

  function setMinPurchaseLimit(uint newMinPurchaseLimit) public onlyOwner {
    minPurchaseLimit = newMinPurchaseLimit;
  }

  function setWallet(address newWallet) public onlyOwner { 
    wallet = newWallet;
  }

  function setDirectMintAgent(address newDirectMintAgent) public onlyOwner {
    directMintAgent = newDirectMintAgent;
  }

  function directMint(address to, uint investedWei) public onlyDirectMintAgentOrOwner {
    calculateAndTransferTokens(to, investedWei);
  }

  function mintAndSendTokens(address to, uint amount) internal {
    token.mint(to, amount);
    minted = minted.add(amount);
  }

  function calculateAndTransferTokens(address to, uint investedInWei) internal returns(uint) {
    uint tokens = calculateTokens(investedInWei);
    mintAndSendTokens(to, tokens);
    invested = invested.add(investedInWei);
    return tokens;
  }

  function calculateAndTransferTokensWithReferer(address to, uint investedInWei) internal {
    uint tokens = calculateAndTransferTokens(to, investedInWei);
    sendRefererTokens(tokens);
  }
  
  function calculateTokens(uint investedInWei) public view returns(uint);

  function createTokens() public payable;

  function() external payable {
    createTokens();
  }

  function retrieveTokens(address to, address anotherToken) public onlyOwner {
    ERC20 alienToken = ERC20(anotherToken);
    alienToken.transfer(to, alienToken.balanceOf(this));
  }

}

contract StagedTokenEvent is CommonTokenEvent {

  using SafeMath for uint;

  struct Stage {
    uint period;
    uint discount;
  }

  uint public constant STAGES_PERCENT_RATE = 100;

  Stage[] public stages;

  function stagesCount() public constant returns(uint) {
    return stages.length;
  }

  function addStage(uint period, uint discount) public onlyOwner {
    require(period > 0);
    stages.push(Stage(period, discount));
    period = period.add(period);
  }

  function removeStage(uint8 number) public onlyOwner {
    require(number >=0 && number < stages.length);

    Stage storage stage = stages[number];
    period = period.sub(stage.period);

    delete stages[number];

    for (uint i = number; i < stages.length - 1; i++) {
      stages[i] = stages[i+1];
    }

    stages.length--;
  }

  function changeStage(uint8 number, uint period, uint discount) public onlyOwner {
    require(number >= 0 && number < stages.length);

    Stage storage stage = stages[number];

    period = period.sub(stage.period);    

    stage.period = period;
    stage.discount = discount;

    period = period.add(period);    
  }

  function insertStage(uint8 numberAfter, uint period, uint discount) public onlyOwner {
    require(numberAfter < stages.length);


    period = period.add(period);

    stages.length++;

    for (uint i = stages.length - 2; i > numberAfter; i--) {
      stages[i + 1] = stages[i];
    }

    stages[numberAfter + 1] = Stage(period, discount);
  }

  function clearStages() public onlyOwner {
    for (uint i = 0; i < stages.length; i++) {
      delete stages[i];
    }
    stages.length -= stages.length;
    period = 0;
  }

  function getDiscount() public constant returns(uint) {
    uint prevTimeLimit = start;
    for (uint i = 0; i < stages.length; i++) {
      Stage storage stage = stages[i];
      prevTimeLimit += stage.period * 1 days;
      if (now < prevTimeLimit)
        return stage.discount;
    }
    revert();
  }

}

contract PreTGE is CommonTokenEvent {

  uint public softcap;
  
  bool public refundOn;

  bool public softcapAchieved;

  address public nextSaleAgent;

  mapping (address => uint) public balances;

  event RefundsEnabled();

  event SoftcapReached();

  event Refunded(address indexed beneficiary, uint256 weiAmount);

  function setPeriod(uint newPrice) public onlyOwner {
    price = newPrice;
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
    calculateAndTransferTokensWithReferer(msg.sender, msg.value);
  } 

  function calculateAndTransferTokensWithReferer(address to, uint investorWei) internal {
    super.calculateAndTransferTokensWithReferer(to, investorWei);
    if(!softcapAchieved && minted >= softcap) {
      softcapAchieved = true;      
      SoftcapReached();
    }
  }

  function finish() public onlyOwner {
    if(!softcapAchieved) {
      refundOn = true;      
      RefundsEnabled();
    } else {
      widthraw();
      token.setSaleAgent(nextSaleAgent);
    }    
  }

}

contract TGE is StagedTokenEvent {

  address public extraTokensWallet;

  uint public extraTokensPercent;
  
  function setExtraTokensWallet(address newExtraTokensWallet) public onlyOwner {
    extraTokensWallet = newExtraTokensWallet;
  }

  function setExtraTokensPercent(uint newExtraTokensPercent) public onlyOwner {
    extraTokensPercent = newExtraTokensPercent;
  }

  function calculateTokens(uint investedInWei) public view returns(uint) {
    return investedInWei.mul(price).mul(STAGES_PERCENT_RATE).div(STAGES_PERCENT_RATE.sub(getDiscount())).div(1 ether);
  }

  function finish() public onlyOwner {
    uint allTokens = minted.mul(PERCENT_RATE).div(PERCENT_RATE.sub(extraTokensPercent));
    uint extraTokens = allTokens.mul(extraTokensPercent).div(PERCENT_RATE);
    mintAndSendTokens(extraTokensWallet, extraTokens);
    token.finishMinting();
  }

  function createTokens() public payable canMint {
    wallet.transfer(msg.value);
    calculateAndTransferTokensWithReferer(msg.sender, msg.value);
  } 

}

contract Deployer is Ownable {

  LightcashCryptoToken public token;
 
  PreTGE public preTGE;

  TGE public tge;

  function Deployer() public {
  }

  function deploy() public {
    token = new LightcashCryptoToken();

    preTGE = new PreTGE();
    preTGE.setPrice(1250000000000000000000);
    preTGE.setMinPurchaseLimit(100000000000000000);
    preTGE.setSoftcap(7142857000000000000000000);
    preTGE.setHardcap(37500000000000000000000000);
    preTGE.setStart(1515416400);
    preTGE.setPeriod(7);
    preTGE.setPeriod(7);
    preTGE.setWallet(0x25803D4325EbC33CCF779FF16a23d6CF9543e559);
    preTGE.setRefererPercent(5);

    tge = new TGE();
    tge.setPrice(1000000000000000000000);
    tge.setMinPurchaseLimit(100000000000000000);
    tge.setHardcap(105000000000000000000000000);
    tge.setStart(1516024800);
    tge.setWallet(0x25803D4325EbC33CCF779FF16a23d6CF9543e559);
    tge.setExtraTokensWallet(0x25803D4325EbC33CCF779FF16a23d6CF9543e559);
    tge.setExtraTokensPercent(5);
    tge.addStage(10, 20);
    tge.addStage(10, 10);
    tge.addStage(10, 0);
    tge.setRefererPercent(5);

    preTGE.setToken(token);   
    tge.setToken(token);   
    preTGE.setNextSaleAgent(tge);   
    token.setSaleAgent(preTGE);  
 
    token.transferOwnership(owner);
    preTGE.transferOwnership(owner);
    tge.transferOwnership(owner);
  }

}


