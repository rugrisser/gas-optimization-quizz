// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract Addition is IAddition {
    uint256 number = 1;

    function addition(uint256 value) public {
        number += value;
    }
}

contract Subtraction is ISubtraction {
    uint256 number = 100;

    function subtraction(uint256 value) public {
        number -= value;
    }
}

contract Division is IDivision {
    function divisionBy2(uint256 number) public pure returns (uint256) {
        return number / 2;
    }

    function divisionBy128(uint256 number) public pure returns (uint256) {
        return number / 128;
    }
}

contract AdditionOptimized is IAddition {
    uint256 number = 1;

    function addition(uint256 value) external {
        assembly {
            let x := sload(number.slot)
            sstore(number.slot, add(x, value))
        }
    }
}

contract SubtractionOptimized is ISubtraction {
    uint256 number = 100;

    function subtraction(uint256 value) external {
        assembly {
            let x := sload(number.slot)
            sstore(number.slot, sub(x, value))
        }
    }
}

contract DivisionOptimized is IDivision {
    function divisionBy2(uint256 number) external pure returns (uint256 result) {
        result = number >> 1;
    }

    function divisionBy128(uint256 number) external pure returns (uint256 result) {
        result = number >> 7;
    }
}
