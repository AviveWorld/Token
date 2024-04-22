# Avive Token

1. Avive ERC20 Token (without proxy feature, not upgradeable in the future) with the name `Avive`,symbol `Avive`, decimals set to `18`, and a total supply of `10 billion`.
2. The Avive ERC20 Token will be deployed to the Arbitrum One network which is not entirely Ethereum equivalent (solc's EVM should be set to `paris` explicity).
3. Contract can be paused by owner.
4. Token is burnable by its possessor.

## Development

### hardhat

how to config and use hardhat, please refer to [hardhat](https://hardhat.org/getting-started/).

the most common commands are:

1. compile

   ```bash
   pnpm hardhat compile
   ```

2. test

   ```bash
   pnpm hardhat test
   ```

## Deployment

1. sepolia for test

```bash
 pnpm hardhat run --network arbitrumSepolia scripts/avietoken/01-deploy.ts
```

2. mainnet

```bash
 pnpm hardhat run --network arbitrumOne scripts/avietoken/01-deploy.ts
```
