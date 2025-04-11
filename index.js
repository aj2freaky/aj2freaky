const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

// Middleware to parse JSON
app.use(express.json());

// Main route that handles POST requests
app.post("/", (req, res) => {
  console.log("📦 Incoming body:", req.body);
  res.send("✅ Received");
});

// Optional: test GET route to verify server is up
app.get("/ping", (req, res) => {
  res.send("pong");
});

// Start the server
app.listen(port, () => {
  console.log(`🚀 Server running on port ${port}`);
});
