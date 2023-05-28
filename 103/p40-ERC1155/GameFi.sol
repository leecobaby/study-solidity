// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "../public/ERC1155.sol";

// 利用 ERC1155 实现 GameFi 的简易 example
contract BAYC1155 is ERC1155 {
    uint256 public constant GOLD = 1;
    uint256 public constant SILVER = 2;
    uint256 public constant BRONZE = 3;

    uint256 public constant BLUNT_SWORD = 4;
    uint256 public constant DEATH_STING = 5;

    // 构造函数
    constructor() ERC1155("Game", "GAME") {
        _mint(msg.sender, GOLD, 10 ** 18, "");
        _mint(msg.sender, SILVER, 10 ** 27, "");
        _mint(msg.sender, BRONZE, 10 ** 36, "");

        _mint(msg.sender, BLUNT_SWORD, 10 ** 10, "");
        _mint(msg.sender, DEATH_STING, 1, "");
    }

    //BAYC的baseURI为ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/";
    }
}
