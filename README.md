Discord.js Bot Docker Container for Unraid

This repository provides a Docker container for self-hosting a Discord.js bot on an Unraid server. The container is built with Node.js and supports automatic code updates from a GitHub repository each time the container starts.
Features

    Automatic Code Updates: Pulls the latest code from a GitHub repository on each start.
    Environment Variable Configuration: Easily configure your bot’s token and other settings through environment variables.
    Persistent Storage: Mount a volume to persist data across container restarts.
    Private Docker Repository: Optionally push and pull the image from a private Docker repository.

Prerequisites

    Unraid Server: Ensure Docker is enabled in Unraid.
    GitHub Repository: Your bot’s code should be hosted on GitHub.
    Discord Token: A valid Discord bot token to run the bot.

Setup Instructions
1. Clone This Repository

Clone or download this repository to your Unraid server. If cloning, use:

git clone https://github.com/yourusername/discord-bot-docker
cd discord-bot-docker

2. Configure the Dockerfile

    Update the REPO_URL and REPO_BRANCH with your GitHub repository details if needed.
    Modify the entry point in start.sh to match the main file of your bot (e.g., node bot.js).

3. Configure Environment Variables

You’ll need to set up environment variables in Unraid to configure the bot’s settings:
Variable	Description
DISCORD_TOKEN	Discord bot token required to connect to Discord
REPO_URL	GitHub repository URL (for cloning bot code)
REPO_BRANCH	Branch to use (default: main)
4. Build the Docker Image

From your Unraid server’s terminal, navigate to the directory where you saved the Dockerfile and run the following commands:

docker build -t yourusername/discord-bot:latest .

5. Push to Private Docker Repository (Optional)

If you want to store the image in a private Docker repository (e.g., Docker Hub):

    Log In to Docker Hub:

docker login

Push the Image:

    docker push yourusername/discord-bot:latest

6. Set Up and Deploy on Unraid

    Add the Container:
        Go to Unraid’s Docker tab and click Add Container.
        In the Repository field, enter yourusername/discord-bot:latest (or your private repo URL).
        Configure environment variables under Environment (e.g., DISCORD_TOKEN, REPO_URL, REPO_BRANCH).

    Volume Mapping (Optional):
        To persist files, set up a volume mapping such as /mnt/user/appdata/discord-bot:/usr/src/app.

    Review and Start:
        Start the container and review the logs to ensure it’s running properly.

7. Verify Bot Functionality

Test the bot in Discord to confirm it’s connected and functioning.
File Structure

    Dockerfile: Defines the environment and setup for the Docker container.
    start.sh: Script that updates code and starts the bot on each container start.

Troubleshooting

    Bot Not Starting: Check the logs in Unraid for any error messages.
    GitHub Repository Access: If using a private repo, ensure SSH keys or tokens are set up correctly.

Additional Notes

    Customizing Start Commands: Modify start.sh if you need custom commands or logic.
    Docker Compose: For more advanced setups, consider creating a docker-compose.yml.

License

This project is licensed under the MIT License. See the LICENSE file for details.