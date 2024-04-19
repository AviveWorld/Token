import { expect } from 'chai';
import { ethers } from 'hardhat';
import { Contract, Signer, Wallet, parseEther, parseUnits } from 'ethers';

import { deployContract, deployContractWithDeployer } from '../src/utils';
import { AviveTokenomics, Avive, ERC20 } from '../typechain-types';
import { getTokenomics } from '../data/index';

describe('ownership test', function () {
  let deployer: Signer;
  let owner: Signer;
  // generate wallet by privatekey
  let avive: Avive;
  let erc20: ERC20;
  let AviveTokenomics: AviveTokenomics;
  let accounts: Signer[];

  const START_MONTH = 5; // the first 5 months are already released

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

  it('check release time and amount', async () => {
    const list = getTokenomics();
    let total = BigInt(0);
    let futureAmount = BigInt(0);
    for (let i = 0; i < list.length; i++) {
      const item = list[i];
      const releaseSchedule = await AviveTokenomics.releaseSchedule(i + 1);
      expect(releaseSchedule.time).equal(BigInt(item.time));
      expect(releaseSchedule.amount).equal(
        ethers.parseEther(item.amount.replace(/,/g, '')),
      );
      expect(releaseSchedule.released).equal(i < START_MONTH ? true : false);
      total += BigInt(item.amount.replace(/,/g, ''));
      if (i >= START_MONTH) {
        futureAmount += BigInt(item.amount.replace(/,/g, ''));
      }
    }
    expect(total).equal(BigInt(10_000_000_000));
    console.log('futureAmount', futureAmount.toString());
  });
  it('some illegal cases', async () => {
    // releaseByMonth should be reverted after all release
    await expect(
      AviveTokenomics.connect(owner).releaseByMonth(1),
    ).to.revertedWith('Already released');

    const list = getTokenomics();
    const lastroundTime = list[list.length - 1].time;
    if (lastroundTime > Date.now() / 1000) {
      // releaseByMonth should be reverted if the time is not reached
      await expect(
        AviveTokenomics.connect(owner).releaseByMonth(list.length),
      ).to.revertedWith('Release time not reached');
    }

    // releaseByMonth should be reverted if not owner
    await expect(
      AviveTokenomics.connect(deployer).releaseByMonth(1),
    ).to.revertedWithCustomError(AviveTokenomics, 'OwnableUnauthorizedAccount');
    // releaseByMonth should be reverted if the round is exceed
    await expect(
      AviveTokenomics.connect(owner).releaseByMonth(100),
    ).to.revertedWith('Invalid round');
  });

  it('check releaseByMonth', async () => {
    const list = getTokenomics();
    const futureAmount = list.slice(START_MONTH).reduce((acc, cur) => {
      return acc + BigInt(cur.amount.replace(/,/g, ''));
    }, BigInt(0));
    // tranfer futureAmount to AviveTokenomics
    await avive
      .connect(owner)
      .transfer(
        await AviveTokenomics.getAddress(),
        ethers.parseEther(futureAmount.toString()),
      );

    for (let i = 0; i < list.length; i++) {
      const item = list[i];
      const releaseSchedule = await AviveTokenomics.releaseSchedule(i + 1);
      if (i < START_MONTH) {
        expect(releaseSchedule.released).equal(true);
        await expect(
          AviveTokenomics.connect(owner).releaseByMonth(i + 1),
        ).to.revertedWith('Already released');
      } else {
        // set block time to release time
        await ethers.provider.send('evm_setNextBlockTimestamp', [
          Number(item.time),
        ]);
        const balanceAviveTonenomics_before = await avive.balanceOf(
          await AviveTokenomics.getAddress(),
        );
        const balanceAvive_before = await avive.balanceOf(
          await owner.getAddress(),
        );
        await AviveTokenomics.connect(owner).releaseByMonth(i + 1);
        const releaseSchedule = await AviveTokenomics.releaseSchedule(i + 1);
        expect(releaseSchedule.released).equal(true);
        const balanceAviveTonenomics_after = await avive.balanceOf(
          await AviveTokenomics.getAddress(),
        );
        expect(balanceAviveTonenomics_after + releaseSchedule.amount).equal(
          balanceAviveTonenomics_before,
        );
        const balanceAvive_after = await avive.balanceOf(
          await owner.getAddress(),
        );
        expect(balanceAvive_after - balanceAvive_before).equal(
          releaseSchedule.amount,
        );
        // duplicate release should be reverted
        await expect(
          AviveTokenomics.connect(owner).releaseByMonth(i + 1),
        ).to.revertedWith('Already released');
      }
    }
  });
});
