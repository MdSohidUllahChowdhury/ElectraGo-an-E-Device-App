const express = require('express');
const mysql = require('mysql2');
const bcrypt = require('bcrypt');
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

  console.log('📩 SignUp request from Flutter Side:', {'User Name': userName, 'Email': email, 'Password': password });

  // Validation
  // ── Check 1: Are all fields present? ────────────────────────
  if (!userName || !email || !password) {
    return res.status(400).json({
      success: false,
      message: 'userName, email and password are all required',
    });
  }

  // ── Check 2: Username length ─────────────────────────────────
  if (userName.trim().length < 2) {
    return res.status(400).json({
      success: false,
      message: 'Username must be at least 2 characters',
    });
  }

  if (userName.trim().length > 15) {
    return res.status(400).json({
      success: false,
      message: 'Username must be less than 15 characters',
    });
  }

  // ── Check 3: Valid email format ──────────────────────────────
  const emailRegex = /^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({
      success: false,
      message: 'Please provide a valid email address',
    });
  }

  // ── Check 4: Password strength ───────────────────────────────
  if (password.length < 8) {
    return res.status(400).json({
      success: false,
      message: 'Password must be at least 8 characters',
    });
  }

  if (!/[A-Z]/.test(password)) {
    return res.status(400).json({
      success: false,
      message: 'Password must contain at least one uppercase letter',
    });
  }

  if (!/[a-z]/.test(password)) {
    return res.status(400).json({
      success: false,
      message: 'Password must contain at least one lowercase letter',
    });
  }

  if (!/[0-9]/.test(password)) {
    return res.status(400).json({
      success: false,
      message: 'Password must contain at least one number',
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

    console.log(`✅ Profile saved →
      ID: ${result.insertId} |
      User Name: ${userName} |
      Email: ${email} |
      Password: ${password} |
      With Hash Password: ${hashedPassword} `);

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

  console.log('📩 Full body:', req.body);
  console.log('📧 Email:', req.body.email);
  console.log('🔑 Password:', req.body.password);

    //  Are all fields present?
  if (!email || !password) {
    return res.status(400).json({
      success: false,
      message: 'Email and password are required',
    });
  }

  // Step 2: Find this email in MySQL
  const sql = 'SELECT * FROM authInfo WHERE email = ? LIMIT 1';

  db.query(sql, [email], async (err, results) => {

    if (err) {
      console.error('❌ DB error:', err.message);
      return res.status(500).json({
        success: false,
        message: 'Database error, please try again',
      });
    }
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
      { expiresIn: '20m' }
    );

    // Step 6: Send token back to Flutter
    res.status(200).json({
      success: true,
      message: 'Login successful!',
      token: token,
      user: {
        id: user.id,
        email: user.email,
        name: user.name,
      }
    });

  });
});


app.get('/verifyToken', verifyToken, (req, res) => {
  // If we reach here, verifyToken middleware passed
  // meaning the token is still valid
  res.status(200).json({
    success: true,
    message: 'Token is valid',
    user: {
      userId: req.user.userId,
      email:  req.user.email,
    }
  });
});

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

    req.user = decoded;
    next();

  } catch (err) {
    return res.status(401).json({
      success: false,
      message: 'Invalid or expired token. Please login again.',
    });
  }
}


//!─────────────────────────────────────────────────────────────
//? Profile Data
//!─────────────────────────────────────────────────────────────

// Protected — needs valid JWT token
app.get('/profile', verifyToken, (req, res) => {

  // req.user.userId comes from the token
  // We use it to find the right user in MySQL
  const sql = 'SELECT id, userName, email, created_at FROM authInfo WHERE id = ?';
  //           ↑ never select password column

  db.query(sql, [req.user.userId], (err, results) => {
    if (err) {
      return res.status(500).json({ success: false, message: 'Database error' });
    }

    if (results.length === 0) {
      return res.status(404).json({ success: false, message: 'User not found' });
    }

    res.status(200).json({
      success: true,
      user: results[0],
      // returns: { id, userName, email, created_at }
    });
  });
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
