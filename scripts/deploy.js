const main = async () => {
	const [deployer] = await ethers.getSigners();

	console.log("Deploying contracts with the account:", deployer.address);

	console.log("Account balance:", (await deployer.getBalance()).toString());

	const GratitudeWall = await ethers.getContractFactory("GratitudeWall");
	const deployedContract = await GratitudeWall.deploy();

	console.log("Contract address:", deployedContract.address);
};

main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.error(error);
		process.exit(1);
	});
