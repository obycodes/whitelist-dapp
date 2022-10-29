// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Whitelist {

    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    uint8 public numAddressesWhitelisted;

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "This address is already on the whitelist");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Limit reached, whitelist spots are no longer available.");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;

    }

}