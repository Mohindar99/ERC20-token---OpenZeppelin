// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.7.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.7.2/security/Pausable.sol";
import "@openzeppelin/contracts@4.7.2/access/Ownable.sol";

// created  a token of ERC20 which has the features of burnable , pausable , mintable
contract Husky is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("Husky", "HSKY") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }
// function for pause to call _pause function
    function pause() public onlyOwner {
        _pause();
    }
// function for unpause to call _unpause function
    function unpause() public onlyOwner {
        _unpause();
    }
// function for creating or adding some new tokens 
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
