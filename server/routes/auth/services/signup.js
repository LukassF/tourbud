const bcrypt = require("bcryptjs");
const userModel = require("../../../models/userModel");
const ErrorWithCode = require("../../../exceptions/errorWithCode");

const signUpUser = async (user) => {
  if (!user) throw new ErrorWithCode("User data invalid", 400);
  const { fname, lname, username, email, password } = user;

  if (!username || !email || !password || !fname || !lname)
    throw new ErrorWithCode("Missing user credentials", 400);

  if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email))
    throw new ErrorWithCode("Invalid email", 400, "email");

  const takenUsername = await userModel.getUserByUsername(username);
  if (takenUsername.rows.length > 0)
    throw new ErrorWithCode("Username is taken", 400, "username");

  const takenEmail = await userModel.getUserByEmail(email);
  if (takenEmail.rows.length > 0)
    throw new ErrorWithCode("Email is taken", 400, "email");

  const salt = await bcrypt.genSalt(10);
  const hashed_password = await bcrypt.hash(password, salt);

  return userModel.insertUser(fname, lname, username, email, hashed_password);
};

module.exports = {
  signUpUser,
};
