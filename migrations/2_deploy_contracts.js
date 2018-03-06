var token = artifacts.require("MusesChainToken");

module.exports = function(deployer) {
  deployer.deploy(token);
};
