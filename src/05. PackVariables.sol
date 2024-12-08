// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract PackVariables is IPackVariables {
    uint8 one;
    uint256 two;
    bytes18 three;
    uint8[30] four;
    bytes14 five;
    uint8 six;

    function setValues(uint8 _one, uint256 _two, bytes18 _three, uint8[30] calldata _four, bytes14 _five, uint8 _six)
        public
    {
        one = _one;
        two = _two;
        three = _three;
        four = _four;
        five = _five;
        six = _six;
    }
}

contract PackVariablesOptimized is IPackVariables {

    uint256 firstSlot;
    uint256 secondSlot;
    bytes32 thirdSlot;

    function setValues(uint8 _one, uint256 _two, bytes18 _three, uint8[30] calldata _four, bytes14 _five, uint8 _six)
        external
    {
        unchecked {
            uint256 result = (uint256(_one) << 248) + (uint256(_six) << 240);

            for (uint8 i = 0; i < 30; ++i) {
                result += uint256(_four[i]) << (i * 8);
            }

            firstSlot = result;
        }

        secondSlot = _two;
        thirdSlot = (bytes32(_five) >> 144) | _three;
    }
}
