const express = require("express");
const apiRouter = express.Router();

const userService = require("./services/userService");

apiRouter.get("/users/:id", async (req, res) => {
  try {
    const user_id = Number(req.params.id);
    const response = await userService.getUserById(user_id);

    res.status(200).json({ message: "User found", content: response });
  } catch (error) {
    res.status(error.statusCode ?? 404).json({
      message: "Something went wrong when fetching user",
      error: error.message,
    });
  }
});

module.exports = apiRouter;
