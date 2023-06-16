// SPDX-License-Identifier: MIT
// by 0xAA
pragma solidity ^0.8.4;

import "../public/ERC721.sol";

contract FVMPANDA is ERC721 {
    uint public MAX_NUMBERS = 10; // 总量

    // 构造函数
    constructor(
        string memory name_,
        string memory symbol_
    ) ERC721(name_, symbol_) {}

    //BAYC的baseURI为ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/
    function _baseURI() internal pure override returns (string memory) {
        return
            "ipfs://bafybeib5aawpnkgtiga3r5caxoqv5kohkzvuo25ovlor2a7gjda7zqqbba/";
    }

    // 铸造函数
    function mint(address to, uint tokenId) external {
        require(tokenId >= 0 && tokenId < MAX_NUMBERS, "tokenId out of range");
        _mint(to, tokenId);
    }
}
