// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/script.sol";
import {EtherToken} from "src/EtherToken.sol";
import {console} from "forge-std/console.sol";

contract DeployEtherToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000000;

    function run() external returns (EtherToken) {
        vm.startBroadcast();
        EtherToken etherToken = new EtherToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return etherToken;
    }
}
