const express = require("express");
const axios = require("axios");
const app = express();
app.use(express.json());

// 🔗 Your Discord webhook URL
const DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/1360147748464103455/1n3Zhr8LHOeG7bnSnSLMWH6cwZzuQHV9MomC1DH-4w-j-z4f-ElP9c2k678oFoRyqKP-";

app.post("/", async (req, res) => {
  const { msg, from, type } = req.body;

  // Format the message
  const message = `**${from || "A3 System"} Alert**\n${msg || "No message provided."}`;

  try {
    await axios.post(DISCORD_WEBHOOK_URL, {
      content: message
    });
    res.send("✅ Relay sent to Discord!");
  } catch (error) {
    console.error("❌ Discord Error:", error.message);
    res.status(500).send("❌ Failed to send to Discord");
  }
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`🚀 Server running on port ${port}`);
});
