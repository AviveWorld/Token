import { expect } from 'chai';
import { ethers } from 'hardhat';
import { Signer } from 'ethers';

import { deployContract, deployContractWithDeployer } from '../src/utils';
import { Avive } from '../typechain-types';

describe('1 base info', function () {
  let deployer: Signer;
  let owner: Signer;
  let accounts: Signer[];
  let avive: Avive;

  const name_ = 'Avive';
  const symbol_ = name_;
  // initial supply is 10 billion
  const initialSupply_ = ethers.parseEther('10000000000');

  before(async () => {
    // @ts-ignore
    accounts = await ethers.getSigners();
    deployer = accounts[0];
    owner = accounts[1];
  });

  beforeEach(async () => {
    // Deploying
    avive = (await deployContractWithDeployer(
      deployer,
      'Avive',
      await owner.getAddress(),
      initialSupply_,
      name_,
      symbol_,
    )) as Avive;
  });
  it('basic info', async () => {
    expect(await avive.name()).equal(name_);
    expect(await avive.symbol()).equal(symbol_);
    expect(await avive.totalSupply()).equal(initialSupply_);
    expect(await avive.owner()).equal(await owner.getAddress());

    expect(await avive.balanceOf(await owner.getAddress())).equal(
      initialSupply_,
    );
    expect(await avive.balanceOf(await deployer.getAddress())).equal(0);
  });
  it('pause/unpause normaly', async () => {
    expect(await avive.paused()).equal(false);
    await expect(avive.connect(owner).pause()).emit(avive, 'Paused');
    expect(await avive.paused()).equal(true);

    await expect(
      avive.connect(deployer).unpause(),
    ).to.be.revertedWithCustomError(avive, 'OwnableUnauthorizedAccount');

    await expect(avive.connect(owner).unpause()).emit(avive, 'Unpaused');
    expect(await avive.paused()).equal(false);
  });
  it('transfer normaly', async () => {
    const amount = ethers.parseEther('1000');
    await avive.connect(owner).transfer(await deployer.getAddress(), amount);
    expect(await avive.balanceOf(await owner.getAddress())).equal(
      initialSupply_ - amount,
    );
    expect(await avive.balanceOf(await deployer.getAddress())).equal(amount);
  });

  it('burn', async () => {
    const amount = ethers.parseEther('1000');
    await avive.connect(owner).burn(amount);
    expect(await avive.balanceOf(await owner.getAddress())).equal(
      initialSupply_ - amount,
    );
  });

  it('transfer fail if paused. then should be ok if unpaused', async () => {
    await expect(avive.connect(owner).pause()).emit(avive, 'Paused');
    expect(await avive.paused()).equal(true);
    const amount = ethers.parseEther('1000');
    await expect(
      avive.connect(owner).transfer(await deployer.getAddress(), amount),
    ).to.be.revertedWithCustomError(avive, 'EnforcedPause');

    await expect(avive.connect(owner).unpause()).emit(avive, 'Unpaused');
    expect(await avive.paused()).equal(false);
    await expect(
      avive.connect(owner).transfer(await deployer.getAddress(), amount),
    ).emit(avive, 'Transfer');
  });
});
