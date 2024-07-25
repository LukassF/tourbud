const pool = require("../utils/db");
const jwt = require("jsonwebtoken");

const generateAccessToken = (user) => {
  const token_data = {
    user: {
      id: user.id,
      fname: user.first_name,
      lname: user.last_name,
      username: user.username,
      email: user.email,
      created_at: user.created_at,
      image: user.image,
    },
  };
  return jwt.sign(token_data, process.env.JWT_SECRET, { expiresIn: "10m" });
};

const generateRefreshToken = (user) => {
  const token_data = {
    user: {
      id: user.id,
      fname: user.first_name,
      lname: user.last_name,
      username: user.username,
      email: user.email,
      created_at: user.created_at,
      image: user.image,
    },
  };
  return jwt.sign(token_data, process.env.REFRESH_SECRET, { expiresIn: "6h" });
};

const insertRefreshToken = async (refresh_token, user_id) => {
  try {
    await deleteExistingRefreshToken(user_id);

    const response = await pool.query(
      "INSERT INTO refresh_tokens (token,user_id) VALUES ($1,$2)",
      [refresh_token, user_id]
    );

    return response;
  } catch (error) {
    return error;
  }
};

const deleteExistingRefreshToken = async (user_id) => {
  const response = await pool.query(
    "DELETE FROM refresh_tokens rt WHERE rt.user_id = $1",
    [user_id]
  );

  return response;
};

const getTokenFromDb = async (refresh_token) => {
  const response = await pool.query(
    "SELECT * FROM refresh_tokens rt WHERE rt.token = $1",
    [refresh_token]
  );

  return response;
};

const deleteTokenFromDb = async (refresh_token) => {
  const response = await pool.query(
    "DELETE FROM refresh_tokens rt WHERE rt.token = $1",
    [refresh_token]
  );

  return response;
};

module.exports = {
  generateAccessToken,
  generateRefreshToken,
  insertRefreshToken,
  getTokenFromDb,
  deleteTokenFromDb,
};
