import { expect } from 'chai';
import { ethers } from 'hardhat';
import { Contract, Signer, Wallet, parseEther, parseUnits } from 'ethers';

import { deployContract, deployContractWithDeployer } from '../src/utils';
import { AviveTokenomics, Avive, ERC20 } from '../typechain-types';

describe('ownership test', function () {
  let deployer: Signer;
  let owner: Signer;
  // generate wallet by privatekey
  let avive: Avive;
  let erc20: ERC20;
  let AviveTokenomics: AviveTokenomics;
  let accounts: Signer[];

  before(async () => {
    // @ts-ignore
    accounts = await ethers.getSigners();
    deployer = accounts[0];
    owner = accounts[1];
  });

  beforeEach(async () => {
    // Deploying
    avive = (await deployContract(
      'Avive',
      await owner.getAddress(),
      ethers.parseEther(BigInt(10_000_000_000).toString()),
      'Avive',
      'Avive',
    )) as Avive;

    AviveTokenomics = (await deployContractWithDeployer(
      deployer,
      'AviveTokenomics',
      await owner.getAddress(),
      await avive.getAddress(),
    )) as AviveTokenomics;
  });
  it('change ownership', async () => {
    const deployer_address = await deployer.getAddress();
    const owner_address = await owner.getAddress();

    expect(await AviveTokenomics.owner()).equal(owner_address);
    await expect(
      AviveTokenomics.connect(deployer).transferOwnership(owner_address),
    ).to.revertedWithCustomError(AviveTokenomics, 'OwnableUnauthorizedAccount');
    await expect(
      AviveTokenomics.connect(owner).transferOwnership(deployer_address),
    ).to.emit(AviveTokenomics, 'OwnershipTransferred');
    expect(await AviveTokenomics.owner()).equal(deployer_address);
  });

  it('illegal to release if not owner', async () => {
    const deployer_address = await deployer.getAddress();
    const owner_address = await owner.getAddress();

    expect(await AviveTokenomics.owner()).equal(owner_address);
    await expect(
      AviveTokenomics.connect(deployer).releaseByMonth(1),
    ).to.revertedWithCustomError(AviveTokenomics, 'OwnableUnauthorizedAccount');
  });
});
