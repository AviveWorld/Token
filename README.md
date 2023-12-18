# Avive Token Project

## Attentions

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

3. deploy

   ```bash
   pnpm hardhat run --network arbitrumGoerli scripts/01-deploy.js
   ```

   > the deploy script will deploy the contract to the arbitrum testnet

### dotenv

utlize [dotenv](https://github.com/motdotla/dotenv) to varies multiple env.

utlize [dotenv-vault](https://github.com/dotenv-org/dotenv-vault#local-build) to encrypt sensitive env locally.

1. build encrypt keys

   ```bash
   pnpm dotenv-vault local build
   ```

   This will generate `.env.keys` and `.env.vault` files. The `.env.vault` file should be push to git, and the `.env.keys` file should be keep locally.

2. decrypt keys

   firstly, check the `.env.keys` file to get the encrypt keys, and determine which environment you want to decrypt.

   ```bash
     # decode the .env.vault for dev environment
     pnpm dotenv-vault local decrypt "dotenv://:xxx@dotenv.local/vault/.env.vault?environment=dev" > .env.dev
   ```

   there is a convenient shell script in each app root directory to decrypt all keys quickly.

   ```bash
      bash ./decrypt-env.sh
   ```

3. how to setup with specific env?
   set a environment variable `DOTENV_KEY` to the corresponding encrypt key in the `.env.keys` file, then run the entry js file.

   ```bash
     DOTENV_KEY='dotenv://:key_1234..@dotenv.local/vault/.env.vault?environment=production' npm start
   ```

> the DOTENV_KEY should be private, do not push to git.
