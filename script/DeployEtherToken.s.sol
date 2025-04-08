// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/script.sol";
import {EtherToken} from "src/EtherToken.sol";

contract DeployEtherToken is Script {
    uint256 public constant INITIAL_SUPPLY = 10000000;


    function run() external {
        vm.startBroadcast();
        new EtherToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
    }
}
