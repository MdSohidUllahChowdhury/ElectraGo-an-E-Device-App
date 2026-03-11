const express = require('express');
const bcrypt = require('bcrypt');
const mysql = require('mysql2');
const app = express();
app.use(express.json());

//!─────────────────────────────────────────────────────────────
//? CONNECT TO MYSQL
//!─────────────────────────────────────────────────────────────
const db = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'root',
  port: 8889,
  database: 'ElectraGo_DB',
  waitForConnections: true,
  connectionLimit: 10,
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



app.post('/authInfo', async (req, res) => {

  const userName = req.body.userName;
  const email = req.body.email;
  const password = req.body.password;

  console.log('📩 SignUp request:', { userName, email, password });

  // Validate
  if (!userName || !email || !password) {
    return res.status(400).json({
      success: false,
      message: 'Name, email and password are required',
    });
  }

  // Hash password
  const hashedPassword = await bcrypt.hash(password, 10);

  const sql = 'INSERT INTO authInfo (userName,email,password) VALUES(?,?,?)';
  const values = [userName, email, hashedPassword]

  // Query
  db.query(sql, values, (err, result) => {
    if (err && err.code === 'ER_DUP_ENTRY') {
      return res.status(409).json({
        success: false,
        message: 'This email is already registered',
      });
    }
    if (err) {
      console.error('❌ DB error:', err.message);
      return res.status(500).json({
        success: false,
        message: 'Database error, please try again',
      });
    }

    console.log(`✅ Profile saved → ID: ${result.insertId} | User Name: ${userName} | Email: ${email} | Password: ${password} | With Hash Password: ${hashedPassword} `);

    // ── Only ONE res.json() at the end ────────────
    res.status(201).json({
      success: true,
      message: 'Profile saved successfully!',
      data: {
        id: result.insertId,
        userName: userName,
        email: email,
        password: password,
      },
    })
  });

})



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


app.post('/profileData', async (req, res) => {
  try {
    console.log('📩 Received from Flutter:', req.body);

    // ── Read values from req.body first ───────────
    const full_name = req.body.full_name;
    const phone_number = req.body.phone_number;
    const address = req.body.address;

    // ── Basic validation ─────────────────────────────────────
    if (!full_name || !phone_number || !address) {
      return res.status(400).json({
        success: false,
        message: 'full_name, phone_number and address are all required',
      });
    }

    // ── Actually call db.query() ──────────────────
    const sql = 'INSERT INTO users (full_name, phone_number, address) VALUES (?, ?, ?)';
    const values = [full_name, phone_number, address];

    db.query(sql, values, (err, result) => {

      if (err) {
        console.error('❌ DB error:', err.message);
        return res.status(500).json({
          success: false,
          message: 'Database error, please try again',
        });
      }

      console.log(`✅ Profile saved → ID: ${result.insertId} | Name: ${full_name} | Number: ${phone_number} | Address: ${address}`);

      // ── Only ONE res.json() at the end ────────────
      res.status(201).json({
        success: true,
        message: 'Profile saved successfully!',
        data: {
          id: result.insertId,
          full_name: full_name,
          phone_number: phone_number,
          address: address,
        },
      });

    }); // ← db.query ends here

  } catch (err) {
    console.error('❌ Unexpected error:', err.message);
    res.status(500).json({ success: false, message: 'Something went wrong' });
  }
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`🌐 Server started: http://localhost:${PORT}`);
});
