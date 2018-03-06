pragma solidity ^0.4.18;
import "zeppelin-solidity/contracts/token/ERC20/CappedToken.sol";
import "./Whitelist.sol";

/**
 * @title SimpleToken
 * @dev Very simple ERC20 Token example, where all tokens are pre-assigned to the creator.
 * Note they can later distribute these tokens as they wish using `transfer` and other
 * `StandardToken` functions.
 */
contract MusesChainToken is CappedToken, Whitelist {
  string public name = "MusesChainToken";
  string public symbol = "MC";
  uint8 public decimals = 18;

  uint256 public INITIAL_SUPPLY = 1050000000;
  uint256 public CAP_SUPPLY = 2100000000;

  /**
   * @dev Constructor that gives msg.sender all of existing tokens.
   */
  function MusesChainToken() public CappedToken(CAP_SUPPLY) {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    Transfer(0x0, msg.sender, INITIAL_SUPPLY);
  }

  function mint(address _to, uint256 _amount) onlyOwner canMint onlyWhitelisted(_to) public returns (bool) {
    return super.mint(_to, _amount);
  }
}
