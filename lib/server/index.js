const express = require("express");
const { default: mongoose } = require("mongoose");
const adminRouter = require("./route/admin");
const authRouter = require("./route/auth");

const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://naviz:insha%4020022020@cluster0.hcegknf.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", function () {
  console.log(`Connected at port ${PORT}`);
});
