#!/bin/bash

# Navigate to the app directory
cd /usr/src/app

# Pull the latest code from GitHub
git pull origin main

# Install any new dependencies
npm install

# Start the bot
node bot.js  # Make sure to replace 'bot.js' with the entry point file for your bot