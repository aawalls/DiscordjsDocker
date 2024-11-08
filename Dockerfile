# Use Node.js 16.7 or higher for compatibility with discord.js v14
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Install git to pull your bot code from GitHub
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone the Discord bot repository - Replace this with your GitHub repository URL
ARG REPO_URL
ARG REPO_BRANCH=main
RUN git clone -b ${REPO_BRANCH} ${REPO_URL} .

# Install dependencies for the bot
RUN npm install

# Copy start script
COPY start.sh .

# Make the start script executable
RUN chmod +x start.sh

# Start the bot using the start script
CMD ["./start.sh"]