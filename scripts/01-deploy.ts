import { ethers } from 'hardhat';
import { Wallet } from 'ethers';

import { deployContractWithDeployer } from '../src/utils';

(async () => {
  const deployer = new Wallet(process.env.DEPLOYER_PRIVATE_KEY!);
  const owner_ = process.env.OWNER_ADDRESS!;
  const name_ = 'Avive';
  const symbol_ = name_;
  // initial supply is 10 billion
  const initialSupply_ = ethers.parseEther('10000000000');
  await deployContractWithDeployer(
    deployer,
    'Avive',
    owner_,
    initialSupply_,
    name_,
    symbol_,
  );
})();
