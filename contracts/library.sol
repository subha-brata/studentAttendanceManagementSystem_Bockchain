//// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

library datatype{
    function bytesToAddress(bytes32 data) private pure returns(address){
        return address(uint160(uint256 (data)));
    }
}


