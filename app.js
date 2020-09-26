const express = require("express");
const logger = require("morgan");
const mysql = require("mysql");

// Create connection
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "dbbril_agen",
});

// Connect
db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log("MySql Connected...");
});

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(logger("dev"));

// Get all agen_level
app.get("/agen_level", (req, res) => {
  let sql = "SELECT * FROM `dbo.agen_level`";
  let query = db.query(sql, (err, results) => {
    if (err) {
      res.sendStatus(500);
    } else {
      res.json({ agen_levels: results });
    }
  });
});

// Get agen_level by id
app.get("/agen_level/:id", (req, res) => {
  let sql = "SELECT * FROM `dbo.agen_level` WHERE id=" + req.params.id;
  let query = db.query(sql, (err, results) => {
    if (err) {
      res.sendStatus(500);
    } else {
      res.json({ agen_level: results[0] });
    }
  });
});

// Get all agen
app.get("/agen", (req, res) => {
  let sql = "SELECT * FROM `dbo.agen`";
  let query = db.query(sql, (err, results) => {
    if (err) {
      res.sendStatus(500);
    } else {
      res.json({ agens: results });
    }
  });
});

// Get agen by id
app.get("/agen/:id", (req, res) => {
  let sql = "SELECT * FROM `dbo.agen` WHERE id=" + req.params.id;
  let query = db.query(sql, (err, results) => {
    if (err) {
      res.sendStatus(500);
    } else {
      res.json({ agen: results[0] });
    }
  });
});

// Add an agen
app.post("/agen", (req, res) => {
  let post = req.body;
  let sql = "INSERT INTO `dbo.agen` SET ?";
  let query = db.query(sql, post, (err, result) => {
    if (err) {
      res.status(500).send(err);
    } else {
      const response = {
        status: "SUCCESS",
        agen: {
          id: result.insertId,
          ...post,
        },
      };
      res.json(response);
    }
  });
});

// Get all agen_struktur
app.get("/agen_struktur", (req, res) => {
  let sql = "SELECT * FROM `dbo.agen_struktur`";
  let query = db.query(sql, (err, results) => {
    if (err) {
      res.sendStatus(500);
    } else {
      res.json({ agen_struktur: results });
    }
  });
});

// Get agen_struktur by id
app.get("/agen_struktur/:id", (req, res) => {
  let sql = "SELECT * FROM `dbo.agen_struktur` WHERE id=" + req.params.id;
  let query = db.query(sql, (err, results) => {
    if (err) {
      res.sendStatus(500);
    } else {
      res.json({ agen_struktur: results[0] });
    }
  });
});

// Add an agen_struktur
app.post("/agen_struktur", (req, res) => {
  let post = req.body;
  let sql = "INSERT INTO `dbo.agen_struktur` SET ?";
  let query = db.query(sql, post, (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send(err);
    } else {
      const response = {
        status: "SUCCESS",
        agen: {
          id: result.insertId,
          ...post,
        },
      };
      res.json(response);
    }
  });
});

app.listen("5000", () => {
  console.log("Server started on port 5000");
});
