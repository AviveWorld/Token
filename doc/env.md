# Enviroments config

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
