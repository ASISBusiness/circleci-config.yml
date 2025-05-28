async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying CASABECI contract with:", deployer.address);

  const CASABECI = await ethers.getContractFactory("CASABECI");
  const contract = await CASABECI.deploy();
  await contract.deployed();

  console.log("CASABECI deployed to:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
