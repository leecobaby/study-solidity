// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ABIEncode {
    uint x = 10;
    address addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    string name = "0xAA";
    uint[2] array = [5, 6];

    function encode() public view returns (bytes memory result) {
        result = abi.encode(x, addr, name, array);
    }

    function encodePacked() public view returns (bytes memory result) {
        result = abi.encodePacked(x, addr, name, array);
    }

    function encodeWithSignature() public view returns (bytes memory result) {
        result = abi.encodeWithSignature(
            "foo(uint256,address,string,uint256[2])",
            x,
            addr,
            name,
            array
        );
    }

    function encodeWithSelector() public view returns (bytes memory result) {
        result = abi.encodeWithSelector(
            bytes4(keccak256("foo(uint256,address,string,uint256[2])")),
            x,
            addr,
            name,
            array
        );
    }

    function decode(
        bytes memory data
    )
        public
        pure
        returns (
            uint dx,
            address daddr,
            string memory dname,
            uint[2] memory darray
        )
    {
        (dx, daddr, dname, darray) = abi.decode(
            data,
            (uint, address, string, uint[2])
        );
    }

    function getStaticIntSelector() public pure returns (bytes4 result) {
        return bytes4(keccak256("getStaticInt()"));
    }

    function getStaticInt() public pure returns (uint256 result) {
        result = uint256(1288);
    }
}

contract CallWithSelector {
    function callIt(
        address contractAddress,
        bytes4 selector
    ) public view returns (uint256 result) {
        bytes memory data = abi.encodeWithSelector(selector);
        (bool success, bytes memory res) = address(contractAddress).staticcall(
            data
        );
        require(success);

        return abi.decode(res, (uint256));
    }
}
