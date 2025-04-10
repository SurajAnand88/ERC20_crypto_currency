// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployEtherToken} from "script/DeployEtherToken.s.sol";
import {EtherToken} from "src/EtherToken.sol";
import {console} from "forge-std/console.sol";

contract TestETherToken is Test {
    EtherToken public etherToken;
    DeployEtherToken public deployer;

    uint256 public constant STARTING_BALANCE = 1000000;

    address alice = makeAddr("Alice");
    address robin = makeAddr("Robin");

    function setUp() public {
        deployer = new DeployEtherToken();
        etherToken = deployer.run();

        vm.prank(msg.sender);
        etherToken.transfer(alice, STARTING_BALANCE);
    }

    function testAliceBalance() public view {
        assert(etherToken.balanceOf(alice) == STARTING_BALANCE);
    }

    function testAllowanceFrom() public {
        uint256 initialAmount = 100;
        vm.prank(alice);
        etherToken.approve(robin, initialAmount);

        uint256 transferAmount = 50;

        vm.prank(robin);
        etherToken.transferFrom(alice, robin, transferAmount);

        assertEq(etherToken.balanceOf(robin), transferAmount);
        assertEq(etherToken.balanceOf(alice), STARTING_BALANCE - transferAmount);
    }
}
