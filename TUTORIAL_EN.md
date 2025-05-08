# Tutorial: GitEasy

This tutorial will guide you step by step in using the GitEasy script to simplify your Git and GitHub workflow.

## Table of Contents

1. [Initial Preparation](#initial-preparation)
2. [Configuring Your First Repository](#configuring-your-first-repository)
3. [Working with Your Repository](#working-with-your-repository)
4. [Branch Management](#branch-management)
5. [Common Use Cases](#common-use-cases)
6. [Tips and Tricks](#tips-and-tricks)
7. [Troubleshooting](#troubleshooting)

## Initial Preparation

### Getting a GitHub Token

Before you start using GitEasy, you need to create a GitHub personal access token (PAT). Follow these detailed steps:

1. Log in to your GitHub account (https://github.com)

2. Click on your profile picture in the top-right corner and select **Settings**

3. Scroll down in the left sidebar menu and click on **Developer settings**

4. In the new sidebar menu, select **Personal access tokens** and then **Tokens (classic)**

5. Click on the **Generate new token** button and select **Generate new token (classic)**

6. You'll be asked to enter your GitHub password to confirm

7. On the "New personal access token" page:
   - In the **Note** field, write a descriptive name like "GitEasy Script"
   - In **Expiration**, select how long you want the token to be valid (you can choose "No expiration" if you don't want it to expire, although for security it's better to set a date)
   - In **Select scopes**, check the following boxes:
     - The entire `repo` section (for full repository access)
     - `workflow` (if you plan to use GitHub Actions)
     - `delete_repo` (if you want to be able to delete repositories)

8. Scroll down and click on the green **Generate token** button

9. **IMPORTANT!** You'll see your new personal token. **Copy it immediately** and save it in a secure place (like a password manager). GitHub will not show you this token again.

   ![Example of generated token](https://docs.github.com/assets/cb-49935/mw-1000/images/help/settings/personal_access_tokens.webp)

This token functions as a password, so keep it secure and don't share it with anyone.

### Configuring the Script

1. Open the `gitEasy.sh` file in a text editor
2. Edit the following lines with your information:
   ```bash
   DEFAULT_USER="your-github-username"
   TOKEN="your-github-token"
   ```
3. Save the file

### Making the Script Accessible from Any Folder

There are several ways to make the GitEasy script accessible from any location on your system. The most common methods are detailed below:

#### Method 1: Moving the script to a folder in PATH

1. First, make the script executable:
   ```bash
   chmod +x /Users/mimac/mining/githubEasy/gitEasy.sh
   ```

2. Create a folder for your personal scripts (if it doesn't exist):
   ```bash
   mkdir -p ~/bin
   ```

3. Copy or move the script to that folder:
   ```bash
   cp /Users/mimac/mining/githubEasy/gitEasy.sh ~/bin/gitEasy
   # Or to move it:
   # mv /Users/mimac/mining/githubEasy/gitEasy.sh ~/bin/gitEasy
   ```
   Note: We remove the `.sh` extension to make it cleaner to use.

4. Make sure this folder is in your PATH. Add this line to the end of your `~/.bashrc`, `~/.bash_profile`, or `~/.zshrc` file (depending on your shell):
   ```bash
   export PATH="$HOME/bin:$PATH"
   ```

5. Apply the changes in your current terminal:
   ```bash
   source ~/.bashrc  # or ~/.bash_profile or ~/.zshrc as appropriate
   ```

6. Now you can use the `gitEasy` command from any location:
   ```bash
   gitEasy help
   ```

#### Method 2: Creating a symbolic link

1. Make the script executable (if you haven't already):
   ```bash
   chmod +x /Users/mimac/mining/githubEasy/gitEasy.sh
   ```

2. Create a symbolic link in a folder that's already in your PATH:
   ```bash
   ln -s /Users/mimac/mining/githubEasy/gitEasy.sh /usr/local/bin/gitEasy
   ```
   Note: You may need to use `sudo` for this command.

3. Now you can use the `gitEasy` command from any location.

#### Method 3: Creating an alias

If you prefer a shorter alias (like `ge`):

1. Open your shell configuration file:
   ```bash
   # For bash:
   nano ~/.bashrc  # or ~/.bash_profile
   
   # For zsh:
   nano ~/.zshrc
   ```

2. Add this line to the end of the file:
   ```bash
   alias ge='/Users/mimac/mining/githubEasy/gitEasy.sh'
   ```

3. Save the file (Ctrl+O, then Enter, then Ctrl+X in nano)

4. Apply the changes in your current terminal:
   ```bash
   source ~/.bashrc  # or ~/.bash_profile or ~/.zshrc as appropriate
   ```

5. Now you can use the `ge` alias from any location:
   ```bash
   ge help
   ```

#### Verification

To verify that the installation was successful, open a new terminal, navigate to any folder, and run:

```bash
ge help  # If you used an alias
# or
gitEasy help  # If you used the other methods
```

You should see the GitEasy script help menu.

## Configuring Your First Repository

### Starting a New Project

1. Create a folder for your project:
   ```bash
   mkdir my-project
   cd my-project
   ```

2. Configure the repository:
   ```bash
   /Users/mimac/mining/githubEasy/gitEasy.sh setup
   ```
   Or if you've set up the alias:
   ```bash
   ge setup
   ```

3. Follow the on-screen instructions:
   - Enter the repository name
   - Decide if it will be private or public
   - Select the project type to generate the appropriate `.gitignore`
   - Confirm if you want to make the initial push

### Using an Existing Project

If you already have a project on your machine that you want to connect to GitHub:

1. Navigate to the project folder:
   ```bash
   cd my-existing-project
   ```

2. Configure the repository:
   ```bash
   ge setup repo-name
   ```

3. Follow the instructions, selecting the appropriate `.gitignore` type.

## Working with Your Repository

### Saving Changes

After modifying files, save your changes with:

```bash
ge save "Descriptive message of the changes"
```

The script will:
1. Show the modified files
2. Ask for confirmation
3. Execute `git add .`, `git commit`, and optionally `git push`

If you don't provide a message, a generic one with the current date will be used.

### Updating Your Repository

To get the latest changes from the remote repository:

```bash
ge update
```

The script will check if you have local changes before pulling and give you options to handle them.

### Checking Status

To see the current repository status:

```bash
ge status
```

This shows an enhanced view of the status, including information about branches and remotes.

### Viewing History

To see recent commits:

```bash
ge log
```

## Branch Management

### Creating a New Branch

```bash
ge branch new-feature
```

Or if you want the script to ask for the name:

```bash
ge branch
```

The script will create the branch, switch to it, and optionally publish it to GitHub.

### Working with Branches

Once on your branch, use `ge save` normally to save changes.

To return to the main branch:
```bash
git checkout main
```

## Common Use Cases

### Starting a New Project

```bash
mkdir new-project
cd new-project
ge setup
# Follow the instructions to name the repo and configure it
touch app.js
ge save "First code file"
```

### Collaborating on an Existing Project

```bash
# Clone the repository (use normal git clone)
git clone https://github.com/username/repo.git
cd repo

# Create a branch for your feature
ge branch my-feature

# Make changes
echo "// New code" >> file.js
ge save "Added new functionality"

# Update with changes from others
ge update
```

## Tips and Tricks

### Script Customization

You can customize GitEasy by editing the file to:
- Add new commands
- Modify messages or colors
- Change default behaviors

### Combining with Standard Git

GitEasy can be used alongside standard Git commands. For example:

```bash
# Use GitEasy for initial setup
ge setup my-project

# Use standard git for specific operations
git diff file.js
git checkout -- file.js

# Use GitEasy for saving and updating
ge save "Fixed critical bug"
```

## Troubleshooting

### Authentication Error

If you receive "Bad credentials" or authentication errors:
1. Verify that the token in the script is correct
2. Make sure the token has the necessary permissions
3. Confirm that the token has not expired

### Merge Conflicts

If you encounter conflicts during `ge update`:
1. Resolve the conflicts manually
2. Use `git add` to mark the files as resolved
3. Complete the merge with `git commit`
4. Continue using GitEasy normally

### Other Issues

If the script fails with a non-descriptive error:
1. Try running the equivalent Git command manually
2. Check the detailed error messages
3. Make sure you're in a directory that is a Git repository (for commands that require it)

---

With this tutorial, you should be ready to use GitEasy to simplify your Git and GitHub workflow. Happy coding!
