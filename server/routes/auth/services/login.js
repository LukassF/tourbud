const bcrypt = require("bcryptjs");
const userModel = require("../../../models/userModel");
const tokenModel = require("./../../../models/tokenModel");
const ErrorWithCode = require("../../../exceptions/errorWithCode");

const logInUser = async (user) => {
  if (!user) throw new ErrorWithCode("User data invalid", 400);

  const { login, password } = user;

  if (!login || !password)
    throw new ErrorWithCode("Missing user credentials", 400);

  const foundUser = await userModel.getUserByUsernameOrEmail(login);

  if (foundUser.rowCount === 0)
    throw new ErrorWithCode("User not found", 404, "login");

  const hashed_password = foundUser.rows[0].password;

  const validPassword = await bcrypt.compare(password, hashed_password);

  if (!validPassword)
    throw new ErrorWithCode("Invalid password", 400, "password");

  const access_token = tokenModel.generateAccessToken(foundUser.rows[0]);
  const refresh_token = tokenModel.generateRefreshToken(foundUser.rows[0]);
  await tokenModel.insertRefreshToken(refresh_token, foundUser.rows[0].id);

  return { access_token, refresh_token };
};

module.exports = {
  logInUser,
};
