# Use a Node.js base image compatible with discord.js v14
FROM node:23

# Install Git and add user for bot
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/* && \
    adduser --uid 99 --gid 100 --home /data --disabled-password discord-bot

# Copy the start script into the container
COPY start.sh /start.sh
RUN chmod +x start.sh

# Set the user to run the bot
USER discord-bot

# Set the working directory
VOLUME /data
WORKDIR /data

# Default command to run the start script
CMD ["/start.sh"]