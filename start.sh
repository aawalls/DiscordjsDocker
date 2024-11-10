#!/bin/bash

# Ensure REPO_URL and GITHUB_TOKEN are provided
if [ -z "$REPO_URL" ] || [ -z "$REPO_BRANCH" ]; then
  echo "Error: REPO_URL and REPO_BRANCH environment variables must be set."
  exit 1
fi

# Construct the authenticated URL if GITHUB_TOKEN is provided
if [ -z "$GITHUB_TOKEN" ]; then
  AUTH_REPO_URL=$REPO_URL
else
  AUTH_REPO_URL=$(echo $REPO_URL | sed "s://://$GITHUB_TOKEN@:")
fi

# Check if .git directory exists in the bot folder
if [ -d ".git" ]; then
  echo "Repository already cloned. Pulling latest changes..."
  git fetch origin $REPO_BRANCH
  git reset --hard origin/$REPO_BRANCH
else
  # If .git does not exist, attempt a fresh clone
  echo "Cloning repository $AUTH_REPO_URL..."
  git clone -b $REPO_BRANCH $AUTH_REPO_URL .
fi

# Verify that package.json exists to confirm successful clone
if [ ! -f package.json ]; then
  echo "Error: Failed to clone repository or repository is missing package.json."
  exit 1
fi

# Install dependencies and start the bot
npm install
node bot.js  # Make sure 'bot.js' is the main entry file for your bot