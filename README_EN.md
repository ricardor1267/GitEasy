# GitEasy


GitEasy is a shell script that simplifies common Git operations for working with GitHub repositories. Designed to make Git workflow faster and easier, especially for developers who prefer to avoid the complexity of native Git commands.

## Main Features

- 🔄 **Quick Setup**: Initialize repositories and configure them with GitHub in seconds
- 💾 **Simplified Saving**: Combines add, commit, and push in a single command
- 🌿 **Branch Management**: Create and switch between branches easily
- 📋 **.gitignore Templates**: Create optimized .gitignore files for different project types
- 🔒 **Private Repository Support**: Option to create private or public repositories
- 📊 **Status and History**: View current status and change history

## Prerequisites

- Git installed on your system
- Active GitHub account
- GitHub personal access token with permissions to create repositories

## Installation

1. Download the `gitEasy.sh` script
2. Make the script executable:
   ```bash
   chmod +x gitEasy.sh
   ```
3. [Optional] Add the script to your PATH to run it from any location:
   ```bash
   # Add to the end of your .bashrc or .zshrc file
   export PATH=$PATH:/path/to/gitEasy
   ```
4. [Optional] Create an alias for easier use:
   ```bash
   # Add to the end of your .bashrc or .zshrc file
   alias ge='/path/to/gitEasy.sh'
   ```

## Initial Configuration

Before using the script, configure your GitHub data in the file:

1. Open the script in a text editor
2. Modify the `DEFAULT_USER` and `TOKEN` variables with your GitHub username and personal token:
   ```bash
   DEFAULT_USER="your-github-username"
   TOKEN="your-github-personal-token"
   ```

## Available Commands

| Command | Description |
|---------|-------------|
| `gitEasy.sh setup [repo]` | Configure a new or existing repository (initialize Git, create GitHub repo, add remote) |
| `gitEasy.sh save [message]` | Save all changes (add, commit, push) with the specified message |
| `gitEasy.sh update` | Update the local repository with changes from remote (pull) |
| `gitEasy.sh branch [name]` | Create a new branch and switch to it |
| `gitEasy.sh status` | Display the current repository status |
| `gitEasy.sh log` | Show recent commit history |
| `gitEasy.sh help` | Display help with all available commands |

## Security

⚠️ **Important**: The GitHub token is stored in plain text within the script, which poses a security risk. To mitigate this risk:

- **NEVER share** this script with your token included
- Set restrictive permissions for the file: `chmod 700 gitEasy.sh`
- Do not upload this script to public repositories without first removing your token
- Consider using environment variables as a more secure alternative:
  ```bash
  # Instead of hardcoding the token in the script, modify it like this:
  TOKEN="${GITHUB_TOKEN}"
  # And then export the variable in your .bashrc or .zshrc file:
  export GITHUB_TOKEN="your-github-token"
  ```

## Getting a GitHub Token

To use GitEasy, you need a GitHub personal access token:

1. Log in to GitHub: https://github.com
2. Go to your profile picture → **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)**
3. Click on **Generate new token** → **Generate new token (classic)**
4. Configure the token:
   - **Note**: "GitEasy Script"
   - **Expiration**: Select duration (recommended: 90 days)
   - **Scopes**: Check all boxes under `repo` and the `delete_repo` box
5. Click on **Generate token**
6. **IMPORTANT!** Immediately copy the generated token. GitHub will not show it to you again.

For detailed instructions with images, see the TUTORIAL_EN.md file.

## Contributions

Contributions are welcome. You can improve this script by adding new features, improving documentation, or fixing bugs.

## License

This script is open source and available for personal and commercial use.
