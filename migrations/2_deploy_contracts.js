var certificates = artifacts.require("./certificates.sol");

module.exports = function(deployer) {
  deployer.deploy(certificates);
};