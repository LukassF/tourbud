const pool = require("../utils/db");

const getAllUsers = async (limit, offset) => {
  const response = await pool.query("SELECT * FROM users LIMIT $1 OFFSET $2", [
    limit,
    offset,
  ]);

  return response;
};

const getUsersByRegex = async (regex, limit, offset) => {
  const response = await pool.query(
    "SELECT * FROM users u WHERE LIKE(u.username, $1) OR LIKE(u.email, $1) LIMIT $2 OFFSET $3",
    [regex, limit, offset]
  );

  return response;
};

const getUserById = async (id) => {
  const response = await pool.query(
    "SELECT id, first_name, last_name, username, email, image, created_at FROM users WHERE users.id = $1",
    [id]
  );

  return response;
};

const insertUser = async (first_name, last_name, username, email, password) => {
  const response = await pool.query(
    "INSERT INTO users (first_name, last_name, username, email, password) VALUES ($1, $2, $3, $4, $5)",
    [first_name, last_name, username, email, password]
  );

  return response;
};

const getUserByUsername = async (username) => {
  const response = await pool.query(
    "SELECT * FROM users WHERE users.username = $1",
    [username]
  );

  return response;
};

const getUserByEmail = async (email) => {
  const response = await pool.query(
    "SELECT * FROM users WHERE users.email = $1",
    [email]
  );

  return response;
};

const getUserByUsernameOrEmail = async (login) => {
  const response = await pool.query(
    "SELECT * FROM users WHERE users.email = $1 OR users.username = $1",
    [login]
  );

  return response;
};

module.exports = {
  getAllUsers,
  getUsersByRegex,
  getUserById,
  insertUser,
  getUserByUsername,
  getUserByEmail,
  getUserByUsernameOrEmail,
};
