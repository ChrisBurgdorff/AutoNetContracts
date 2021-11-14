const Migrations = artifacts.require("Migrations");
const AutoNet = artifacts.require("AutoNet");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(AutoNet);
};
