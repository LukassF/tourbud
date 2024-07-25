const ErrorWithCode = require("../../../exceptions/errorWithCode");
const userModel = require("../../../models/userModel");

const getUserById = async (user_id) => {
  const foundUser = await userModel.getUserById(user_id);

  if (foundUser.rowCount > 0) return foundUser.rows[0];
  else {
    throw new ErrorWithCode(`No user found with id ${user_id}`, 404);
  }
};

module.exports = {
  getUserById,
};
