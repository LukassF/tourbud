const express = require("express");
const app = express();
require("dotenv/config");
const bodyParser = require("body-parser");
const cors = require("cors");
app.use(cors());

// const pool = require("./utils/db");

const crypto = require("crypto");
const port = process.env.PORT || "5000";

// console.log(crypto.randomBytes(64).toString("hex"));

app.use(bodyParser.urlencoded({ extended: true, limit: "50mb" }));
app.use(bodyParser.json({ limit: "50mb" }));

const authRouter = require("./routes/auth/authRouter");
app.use("/auth", authRouter);

const apiRouter = require("./routes/api/apiRouter");
const jwtMiddleware = require("./routes/api/middleware");
app.use("/api/v1", jwtMiddleware, apiRouter);

// app.get("/books", async (req, res) => {
//   try {
//     const response = await pool.query("SELECT * FROM books LIMIT 20");

//     res.json(response.rows).status(200);
//   } catch (error) {
//     res.json({ message: error }).status(400);
//   }
// });

app.listen(port, () => {
  console.log("App running on port 5000");
});
