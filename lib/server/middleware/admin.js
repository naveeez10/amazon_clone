const jwt = require("jsonwebtoken");
const user = require("../model/user");

const admin = (req, res, next) => {
  try {
    const token = req.header("x-auth-token");

    if (!token) {
      return res.status(401).json({ msg: "No auth token, access denied" });
    }

    const verified = jwt.verify(token, "passwordKey");
    if (!verified) {
      return res
        .status(401)
        .json({ msg: "Token verification failed, access denied" });
    }

    next();
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = admin;
