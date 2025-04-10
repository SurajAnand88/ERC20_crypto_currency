// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MyToken {
    mapping(address => uint256) private s_balances;

    function name() public pure returns (string memory) {
        return "MyToken";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balancesOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalance = s_balances[msg.sender] + s_balances[_to];
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        assert(balancesOf(msg.sender) + balancesOf(_to) == previousBalance);
    }
}
