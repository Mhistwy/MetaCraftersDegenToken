# DegenToken

DegenToken is an ERC20 token for the Degen Gaming platform, enabling users to mint, transfer, burn tokens, and redeem them for unique NFT items.

## Description

DegenToken is designed to facilitate transactions within the Degen Gaming platform. It allows the owner to mint tokens, users to transfer and burn tokens, and also redeem tokens for various in-game NFT items. The contract is built using Solidity and leverages OpenZeppelin libraries for secure and efficient token management.

## Getting Started

### Installing

1. **Clone or fork the repository:**
   ```bash
   git clone https://github.com/Mhistwy/MetaCraftersDegenToken.git
   cd MetaCraftersDegenToken
   ```

2. **Copy the code:**
   Copy the code from the `contracts` folder into [Remix IDE](https://remix.ethereum.org/).

3. **Set the compiler version:**
   In Remix, set the compiler version to `0.8.17` (Istanbul).

4. **Deploy the contract:**
   - Change the environment to `Injected Provider - MetaMask`.
   - Deploy the contract.

### Executing Program

1. **Mint tokens:**
   ```javascript
   await token.createTokens("<recipient-address>", <amount>);
   ```

2. **Check balance:**
   ```javascript
   await token.checkBalance();
   ```

3. **Transfer tokens:**
   ```javascript
   await token.sendTokens("<receiver-address>", <amount>);
   ```

4. **Burn tokens:**
   ```javascript
   await token.destroyTokens(<amount>);
   ```

5. **Redeem an item:**
   ```javascript
   await token.claimItem(<item-index>);
   ```

6. **List store items:**
   ```javascript
   await token.listStoreItems();
   ```

### Help

If you encounter issues, here are some common solutions:

- Ensure your MetaMask is connected to the correct network.
- Verify the contract address and ABI when interacting with the deployed contract.
- For any Solidity compilation errors, ensure your environment matches the specified compiler version (`0.8.17`).

## Authors

- Bryce Angeles - [@Mhistwy](https://github.com/Mhistwy)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
