const express = require("express");
const authRouter = express.Router();

const signupService = require("./services/signup");
const loginService = require("./services/login");
const refreshService = require("./services/refresh");
const logoutService = require("./services/logout");

authRouter.post("/signup", async (req, res) => {
  try {
    const user = req.body;
    const response = await signupService.signUpUser(user);

    res.status(201).json({ message: "Sign up successful", content: response });
  } catch (error) {
    res.status(error.statusCode ?? 400).json({
      message: "An error occured while signing up.",
      error: error.message,
      type: error.type,
    });
  }
});

authRouter.post("/login", async (req, res) => {
  try {
    const user = req.body;
    const response = await loginService.logInUser(user);

    res.status(200).json({ message: "Log in successful", content: response });
  } catch (error) {
    res.status(error.statusCode ?? 400).json({
      message: "An error occured while logging in.",
      error: error.message,
      type: error.type,
    });
  }
});

authRouter.post("/refresh", async (req, res) => {
  try {
    const refresh_token = req.body.refresh_token;

    const access_token =
      await refreshService.regenerateAccessTokenFromRefreshToken(refresh_token);

    res.status(200).json({ access_token });
  } catch (error) {
    res.status(error.statusCode ?? 400).json({
      message: "An error occured while regenerating access token",
      error: error.message,
      type: error.type,
    });
  }
});

authRouter.post("/logout", async (req, res) => {
  try {
    const refresh_token = req.body;
    await logoutService.logOut(refresh_token);

    res.status(200).json({ message: "Logout successful" });
  } catch (error) {
    res.status(500).json({
      message: "Could not log out",
      error: error.message,
      type: error.type,
    });
  }
});

module.exports = authRouter;
