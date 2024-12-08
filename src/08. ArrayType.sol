// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract ArrayType is IArrayType {
    uint256[] array;

    function initArray() public {
        for (uint256 i; i < 200; ++i) {
            array.push(i);
        }
    }
}

contract ArrayTypeOptimized is IArrayType {
    uint8[] array;

    function initArray() external {
        unchecked {
            for (uint8 i; i < 200; ++i) {
                array.push(i);
            }
        }
    }
}
