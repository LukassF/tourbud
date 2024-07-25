require("dotenv/config");
const jwt = require("jsonwebtoken");

const tokenModel = require("./../../../models/tokenModel");
const ErrorWithCode = require("../../../exceptions/errorWithCode");

const regenerateAccessTokenFromRefreshToken = async (refresh_token) => {
  if (!refresh_token) throw new ErrorWithCode("You are not authorized", 401);

  const found_token = await tokenModel.getTokenFromDb(refresh_token);

  if (found_token.rowCount == 0)
    throw new ErrorWithCode("Invalid refresh token", 403);

  let access_token;

  jwt.verify(refresh_token, process.env.REFRESH_SECRET, (err, data) => {
    if (err || !data) throw new ErrorWithCode("Invalid refresh token", 403);

    access_token = tokenModel.generateAccessToken(data.user);
  });

  return access_token;
};

module.exports = {
  regenerateAccessTokenFromRefreshToken,
};
