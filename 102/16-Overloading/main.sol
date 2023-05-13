// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Overload {
    function saySomething() public pure returns (string memory) {
        return ("Nothing");
    }

    function saySomething(
        string memory something
    ) public pure returns (string memory) {
        return (something);
    }

    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }

    // 如果调用 f(50) 会报错，应为 50 既可以是 uint8 也可以是 uint256
}
