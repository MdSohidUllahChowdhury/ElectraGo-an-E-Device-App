const express = require('express');
const bcrypt = require('bcrypt');
const mysql   = require('mysql2');
const app = express();
app.use(express.json());

//!─────────────────────────────────────────────────────────────
//? CONNECT TO MYSQL
//!─────────────────────────────────────────────────────────────
const db = mysql.createPool({
  host:               'localhost',
  user:               'root',
  password:           'root',
  port:                8889,          // ← your MySQL password here
  database:           'ElectraGo_DB',
  waitForConnections: true,
  connectionLimit:    10,
});

// Test connection on startup
db.getConnection((err, connection) => {
  if (err) {
    console.error('❌ MySQL connection failed:', err.message);
    return;
  }
  console.log('✅ MySQL connected!');
  connection.release();
});
//!─────────────────────────────────────────────────────────────
//? API Path
//!─────────────────────────────────────────────────────────────
app.get('/', (req, res) => {
  res.json({
    success: true,
    message: 'ElectraGo server is running! 🚗⚡',
  });
});


app.post(
  '/singUp',
  async (req, res) => {
    try {
      console.log("User Input:", req.body);
      const salt = await bcrypt.genSalt();
      const hashedPassword = await bcrypt.hash(req.body.password, salt);
      const dataOfProfile = {
        'id': listOfProfileData.length + 1,
        'email': req.body.email,
        'password': hashedPassword,
      }
      res.status(200).send({
        "statusCode": 200,
        "BackendData": dataOfProfile
      });
      console.log(`Connected to Backend: ${JSON.stringify(dataOfProfile)}`);
    } catch {
      res.status(500).send();
    }
  }
);


const PORT = 3000;
app.listen(PORT, () => {
  console.log(`🌐 Server started: http://localhost:${PORT}`);
});
