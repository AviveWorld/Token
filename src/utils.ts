import { ethers } from 'hardhat';
import {
  Wallet,
  getBytes,
  BaseContract,
  Contract,
  JsonRpcProvider,
  Signer,
} from 'ethers';

// deploy contranct by contract name
export const deployContract = async (contractName: string, ...args: any[]) => {
  const contract = await ethers.getContractFactory(contractName);
  const instance = await contract.deploy(...args);
  await instance.waitForDeployment();
  console.log(`${contractName} deployed to ${instance.target}`);
  return instance as BaseContract;
};

export const deployContractWithDeployer = async (
  deployer: Signer,
  contractName: string,
  ...args: any[]
) => {
  const contract = await ethers.getContractFactory(contractName, deployer);
  const instance = await contract.deploy(...args);
  await instance.waitForDeployment();
  console.log(`${contractName} deployed to ${instance.target}`);
  return instance as BaseContract;
};
