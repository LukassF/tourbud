const tokenModel = require("./../../../models/tokenModel");

const logOut = async (refresh_token) => {
  await tokenModel.deleteTokenFromDb(refresh_token);
};

module.exports = {
  logOut,
};
