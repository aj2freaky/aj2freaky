from flask import Flask, request, jsonify
import requests

app = Flask(name)

DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/1360147748464103455/1n3Zhr8LHOeG7bnSnSLMWH6cwZzuQHV9MomC1DH-4w-j-z4f-ElP9c2k678oFoRyqKP-"

@app.route("/", methods=["GET"])
def index():
    return "✅ A3 Discord Relay is online!"

@app.route("/webhook", methods=["POST"])
def relay_to_discord():
    data = request.json
    message = data.get("message") or data.get("content") or "No message provided"
    payload = {"content": message}

    response = requests.post(DISCORD_WEBHOOK_URL, json=payload)

    if response.status_code in [200, 204]:
        return jsonify({"status": "forwarded", "discord_status": response.status_code}), 200
    else:
        return jsonify({"error": "Failed to
