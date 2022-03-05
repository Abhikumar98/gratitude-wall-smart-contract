require("dotenv").config();
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
	const accounts = await hre.ethers.getSigners();

	for (const account of accounts) {
		console.log(account.address);
	}
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
console.log(process.env.ALCHEMY_RINKEBY_URL);
module.exports = {
	solidity: "0.8.4",
	// settings: {
	// 	optimizer: {
	// 		enabled: true,
	// 		runs: 1000,
	// 	},
	// },
	networks: {
		rinkeby: {
			url: process.env.ALCHEMY_RINKEBY_URL,
			accounts: [process.env.PRIVATE_KEY],
		},
	},
	etherscan: {
		apiKey: process.env.ETHERSCAN_API_KEY,
	},
};

// To verify the contract:
// npx hardhat verify --network rinkeby contract_address
