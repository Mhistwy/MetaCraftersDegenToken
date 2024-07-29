// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    struct Item {
        uint costTokens;
        string itemName;
        bool isRedeemed;
    }

    Item[] private storeItems;

    constructor()
    ERC20("Degen", "DGN")
    Ownable()
    {
        storeItems.push(Item(50, "CCars NFT", false));
        storeItems.push(Item(100, "Baby NFT", false));
        storeItems.push(Item(150, "Ship NFT", false));
        storeItems.push(Item(200, "Teddy NFT", false));
    }

    function createTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); 
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function checkBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function sendTokens(address receiver, uint256 value) external {
        require(balanceOf(msg.sender) >= value, "Not enough DGN tokens to complete the transfer!");
        approve(msg.sender, value);
        transferFrom(msg.sender, receiver, value);
    }

    function destroyTokens(uint256 value) external {
        require(balanceOf(msg.sender) >= value, "Insufficient DGN tokens to cover the burn of the requested amount!");
        burn(value);
    }

    function claimItem(uint8 itemIndex) external returns (string memory) {
        require(itemIndex >= 0 && itemIndex <= 3, "Invalid item index");
        require(!storeItems[itemIndex].isRedeemed, "This item is already redeemed!");
        require(balanceOf(msg.sender) >= storeItems[itemIndex].costTokens, "Insufficient DGN tokens to redeem!");

        // Transfer the required tokens from the sender to the contract owner
        _transfer(msg.sender, owner(), storeItems[itemIndex].costTokens);
        // Mark the item as redeemed
        storeItems[itemIndex].isRedeemed = true;

        return string(abi.encodePacked(storeItems[itemIndex].itemName, " has been redeemed!"));
    }

    function listStoreItems() public view returns (string memory) {
        string memory itemsList = "";

        for (uint i = 0; i < 4; i++) {
            itemsList = string(abi.encodePacked(
                itemsList,
                "   ",
                Strings.toString(i),
                ". ",
                storeItems[i].itemName
            ));
        }

        return itemsList;
    }
}
