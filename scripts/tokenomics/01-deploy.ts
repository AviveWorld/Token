import { ethers } from 'hardhat';
import { Wallet } from 'ethers';

import { deployContractWithDeployer } from '../../src/utils';

(async () => {
  const deployer = new Wallet(
    process.env.DEPLOYER_PRIVATE_KEY!,
    ethers.provider,
  );
  const owner_ = process.env.AVIVE_TOKENOMICS_OWNER!;
  const aviveContractAddress_ = process.env.AVIVE_CONTRACT_ADDRESS!;

  console.log('deployer', deployer.address);
  console.log('owner', owner_);
  console.log('aviveContractAddress', aviveContractAddress_);

  await deployContractWithDeployer(
    deployer,
    'AviveTokenomics',
    owner_,
    aviveContractAddress_,
  );
})();
