const express = require('express');
const app = express();
app.use(express.json());

app.get('/scim/v2/ServiceProviderConfig', (req, res) => {
  res.json({
    schemas: ["urn:ietf:params:scim:schemas:core:2.0:ServiceProviderConfig"]
  });
});

app.post('/scim/v2/Users', (req, res) => {
  console.log('POST /Users:', req.body);

  if (!req.body.userName) {
    return res.status(400).json({ error: 'Missing userName field' });
  }

  const userResponse = {
    id: Math.floor(Math.random() * 10000),
    ...req.body
  };

  // ✅ CORRECT LINE — only json(), no send()
  res.status(201).json(userResponse);
});

app.listen(8880, () => console.log('SCIM Mock Server running on http://localhost:8880'));
