const express = require('express');
const bcrypt = require('bcrypt');
const mysql = require('mysql2');
const jwt = require('jsonwebtoken');

const app = express();
const JWT_SECRET = 'electrago_secret_key_2024';
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
//? Auth Info
//!─────────────────────────────────────────────────────────────
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

  // Query
  const sql = 'INSERT INTO authInfo (userName,email,password) VALUES(?,?,?)';
  const values = [userName, email, hashedPassword]

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


//!─────────────────────────────────────────────────────────────
//? Log In
//!─────────────────────────────────────────────────────────────
app.post('/login', async (req, res) => {

  // Step 1: Read what Flutter sent
  const email = req.body.email;
  const password = req.body.password;
console.log('─────────────────────────');
  console.log('📩 Full body:', req.body);
  console.log('📧 Email:', req.body.email);
  console.log('🔑 Password:', req.body.password);
  console.log('─────────────────────────');
  // Step 2: Find this email in MySQL
  const sql = 'SELECT * FROM authInfo WHERE email = ? LIMIT 1';

  db.query(sql, [email], async (err, results) => {

    // Step 3: No user found with this email
    if (results.length === 0) {
      return res.status(401).json({
        success: false,
        message: 'Invalid email or password'
      });
    }

    // Step 4: User found — now check the password
    const user = results[0];
    const passwordMatch = await bcrypt.compare(password, user.password);

    if (!passwordMatch) {
      return res.status(401).json({
        success: false,
        message: 'Invalid email or password'
      });
    }

    // Step 5: Password correct — create a token
    const token = jwt.sign(
      { userId: user.id, email: user.email },
      JWT_SECRET,
      { expiresIn: '2h' }
    );

    // Step 6: Send token back to Flutter
    res.status(200).json({
      success: true,
      message: 'Login successful!',
      token: token,
      user: {
        id: user.id,
        name: user.name,
        email: user.email }
    });

  });
});


// ─────────────────────────────────────────────────────────────
// MIDDLEWARE: verifyToken  ← NEW IN STEP 4
//
// What is middleware?
//   A function that runs BETWEEN the request and your route.
//   Like a security guard at a door — checks you before letting you in.
//
// How to use it:
//   Add "verifyToken" between the URL and your function:
//   app.get('/someRoute', verifyToken, (req, res) => { ... })
//                              ↑
//                      guard stands here
//
// How Flutter sends the token:
//   Headers: { 'Authorization': 'Bearer eyJhbGciOi...' }
//
// If token is valid   → req.user is filled → route runs
// If token is invalid → 401 error → route never runs
// ─────────────────────────────────────────────────────────────
function verifyToken(req, res, next) {
  // 1. Read the Authorization header
  const authHeader = req.headers['authorization'];

  // 2. No header at all → block
  if (!authHeader) {
    return res.status(401).json({
      success: false,
      message: 'Access denied. Please login first.',
    });
  }

  // 3. Header format is "Bearer TOKEN"
  //    Split by space → ['Bearer', 'eyJhbGci...']
  //    Take index [1]  → just the token
  const token = authHeader.split(' ')[1];

  if (!token) {
    return res.status(401).json({
      success: false,
      message: 'Token missing. Please login.',
    });
  }

  // 4. Verify the token is real and not expired
  try {
    // jwt.verify will THROW an error if token is:
    //   - fake (not made by our server)
    //   - expired
    //   - tampered with
    const decoded = jwt.verify(token, JWT_SECRET);

    // 5. Attach decoded data to req.user
    //    Now your route can use req.user.userId, req.user.email etc.
    req.user = decoded;
    // decoded looks like: { userId: 1, email: 'ali@test.com', name: 'Ali' }

    // 6. Everything OK — move to the actual route
    next();

  } catch (err) {
    return res.status(401).json({
      success: false,
      message: 'Invalid or expired token. Please login again.',
    });
  }
}







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

// ─────────────────────────────────────────────────────────────
app.get('/', (req, res) => {
  res.json({
    success: true,
    message: 'ElectraGo server is running! 🚗⚡',
  });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`🌐 Server started: http://localhost:${PORT}`);
});
// ─────────────────────────────────────────────────────────────
