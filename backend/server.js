const express = require('express');
const bcrypt = require('bcrypt');
const app = express();
app.use(express.json());


app.get('/', (req, res) => {
  res.json({
    success: true,
    message: 'ElectraGo server is running! 🚗⚡',
  });
});

const listOfProfileData = [];

app.post('/singUp', async function (req, res) {
  try {
    console.log("User Input:", req.body);
    const salt = await bcrypt.genSalt();
    const hashedPassword = await bcrypt.hash(req.body.password, salt);
    const dataOfProfile = {
      'id': listOfProfileData.length + 1,
      'email': req.body.email,
      'password': hashedPassword,
    }
    listOfProfileData.push(dataOfProfile);
    res.status(200).send({
      "statusCode": 200,
      "BackendData": dataOfProfile
    });
    console.log(`Connected to Backend: ${JSON.stringify(dataOfProfile)}`);
  } catch {
    res.status(500).send();
  }
});


const PORT = 3000;
app.listen(PORT, () => {
  console.log(`🌐 Server started: http://localhost:${PORT}`);
});
