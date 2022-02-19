// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Token {
    string public name;
    string public symbol;
    uint256 public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    //Events in Solidity can be used to log certain events in EVM logs.
    //These are quite useful when external interfaces are required to
    //be notified of any change or event in the contract.
    //These logs are stored on the blockchain in transaction logs
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _decimals,
        uint256 _totalSupply
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }

    //basically the difference between the public and external is that
    //external - directly from calldata(no writing) and accessed externally
    //public - writes in memory and all can access
    //and others are internal and private
    function transfer(address _to, uint256 _value)
        external
        returns (bool success)
    {
        //requires basically checks the condition before preceding for
        //execution for next lines
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        balanceOf[_to] = balanceOf[_to] + _value;
        emit Transfer(msg.sender, _to, _value);

        //return true for successful transaction in ERC20 ethics
        return true;
    }
}
