#!/bin/bash
# GitEasy - Simplified Git Script
# Author: 2R
# Modified by: Claude

# CONFIGURE YOUR DATA HERE
DEFAULT_USER="yourGitUser"
TOKEN="yourGitHubToken"

# Colors for messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to show help
show_help() {
  echo -e "${YELLOW}GitEasy - Simplified Git Commands${NC}"
  echo "Usage: gitEasy [command]"
  echo ""
  echo "Available commands:"
  echo "  setup [repo]  - Set up repository for the first time (e.g., myproject)"
  echo "                  If not specified, it will ask for a name"
  echo "  save [message]- Save changes (add, commit, and push)"
  echo "  update        - Update local repository (pull)"
  echo "  branch [name] - Create a new branch and switch to it"
  echo "  status        - Show current status"
  echo "  log           - Show recent commit history"
  echo "  help          - Show this help"
}

# Create .gitignore file based on project type
create_gitignore() {
  echo -e "${YELLOW}What type of project is this?${NC}"
  echo "1) Node.js/JavaScript"
  echo "2) Python"
  echo "3) Java"
  echo "4) PHP"
  echo "5) General (basic)"
  echo "6) Don't create .gitignore"
  read -p "Select an option (1-6): " OPTION

  # If .gitignore already exists, ask if they want to overwrite it
  if [ -f ".gitignore" ]; then
    echo -e "${YELLOW}A .gitignore file already exists. Do you want to overwrite it? (y/n)${NC}"
    read OVERRIDE
    if [[ $OVERRIDE != "y" && $OVERRIDE != "Y" && $OVERRIDE != "yes" && $OVERRIDE != "YES" ]]; then
      echo -e "${YELLOW}Keeping existing .gitignore.${NC}"
      return 0
    fi
  fi

  case $OPTION in
    1) # Node.js/JavaScript
      cat > .gitignore << 'EOL'
# Dependencies
node_modules/
npm-debug.log
yarn-debug.log
yarn-error.log
package-lock.json
yarn.lock

# Environment
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Build/distribution files
/dist
/build
/out

# Cache files
.cache
.next
.nuxt
.vuepress/dist
.serverless
.docz
.netlify

# Testing
/coverage

# Logs
logs
*.log

# Operating system
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE and editors
/.idea
.project
.classpath
.c9/
*.launch
.settings/
*.sublime-workspace
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json
EOL
      echo -e "${GREEN}✓ .gitignore file for Node.js/JavaScript created${NC}"
      ;;
    2) # Python
      cat > .gitignore << 'EOL'
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Virtual environments
venv/
ENV/
env/
.env
.venv
env.bak/
venv.bak/
.python-version

# Testing
.coverage
htmlcov/
.tox/
.nox/
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/

# Jupyter Notebook
.ipynb_checkpoints

# Logs
*.log

# Operating system
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE and editors
.idea/
.vscode/
*.swp
*.swo
EOL
      echo -e "${GREEN}✓ .gitignore file for Python created${NC}"
      ;;
    3) # Java
      cat > .gitignore << 'EOL'
# Compiled class file
*.class

# Log file
*.log

# BlueJ files
*.ctxt

# Mobile Tools for Java (J2ME)
.mtj.tmp/

# Package Files
*.jar
*.war
*.nar
*.ear
*.zip
*.tar.gz
*.rar

# virtual machine crash logs
hs_err_pid*

# Build folders
/target/
/build/
/out/
/bin/

# Maven
.mvn/
mvnw
mvnw.cmd
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
pom.xml.next
release.properties
dependency-reduced-pom.xml

# Gradle
.gradle/
gradle/
gradlew
gradlew.bat
settings.gradle
build.gradle

# IntelliJ IDEA
.idea/
*.iws
*.iml
*.ipr

# Eclipse
.settings/
.classpath
.project
.factorypath

# Spring Boot
.springBeans

# Environment
.env
application-local.properties
application-local.yml

# Operating system
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
EOL
      echo -e "${GREEN}✓ .gitignore file for Java created${NC}"
      ;;
    4) # PHP
      cat > .gitignore << 'EOL'
# Composer files
/vendor/
/composer.phar
composer.lock

# Configuration files
.env
.env.backup
phpunit.xml
.phpunit.result.cache

# Application directories
/node_modules/
/public/hot
/public/storage
/storage/*.key
/storage/logs/*
/storage/framework/cache/*
/storage/framework/sessions/*
/storage/framework/views/*

# Laravel Mix
/public/css/
/public/js/
/public/mix-manifest.json

# Logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Cache
.cache

# System files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE and editors
/.idea
/.vscode
*.swp
*.swo
EOL
      echo -e "${GREEN}✓ .gitignore file for PHP created${NC}"
      ;;
    5) # General
      cat > .gitignore << 'EOL'
# Configuration and environment files
.env
.env.*
config.local.js
*.local.conf

# Dependency directories
node_modules/
vendor/
bower_components/

# Build directories
/dist/
/build/
/out/
/target/

# Cache files
.cache/
.temp/
tmp/
temp/

# Logs
*.log
logs/
log/

# Operating system files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE and editors
.idea/
.vscode/
*.sublime-project
*.sublime-workspace
*.swp
*.swo

# Temporary and backup files
*~
*.bak
*.tmp
EOL
      echo -e "${GREEN}✓ Basic general .gitignore file created${NC}"
      ;;
    6) # Don't create
      echo -e "${YELLOW}No .gitignore file will be created${NC}"
      ;;
    *)
      echo -e "${RED}Invalid option. No .gitignore file will be created${NC}"
      ;;
  esac
}

# Initial setup
setup_repo() {
  REPO_NAME="$1"

  # If no name is provided, ask for it
  if [ -z "$REPO_NAME" ]; then
    echo -e "${YELLOW}Enter name for the repository:${NC}"
    read REPO_NAME

    if [ -z "$REPO_NAME" ]; then
      echo -e "${RED}Error: You must specify a name for the repository${NC}"
      exit 1
    fi
  fi

  # Ask if repository should be private
  echo -e "${YELLOW}Do you want the repository to be private? (y/n)${NC}"
  read IS_PRIVATE
  PRIVATE_OPTION=""
  if [[ $IS_PRIVATE == "y" || $IS_PRIVATE == "Y" || $IS_PRIVATE == "yes" || $IS_PRIVATE == "YES" ]]; then
    PRIVATE_OPTION='"private":true'
    echo -e "${YELLOW}Repository will be created as private${NC}"
  else
    PRIVATE_OPTION='"private":false'
    echo -e "${YELLOW}Repository will be created as public${NC}"
  fi

  # Build the full repository path
  FULL_REPO="$DEFAULT_USER/$REPO_NAME"

  echo -e "${YELLOW}Setting up repository $FULL_REPO...${NC}"

  # Check if it's a git repository
  if [ ! -d ".git" ]; then
    echo -e "${YELLOW}Initializing repository...${NC}"
    git init
    echo -e "${GREEN}✓ Git repository initialized${NC}"
  fi

  # Create .gitignore file
  create_gitignore

  # Remove current origin if it exists
  git remote remove origin 2>/dev/null

  # Try to create repository on GitHub first
  echo -e "${YELLOW}Creating repository on GitHub...${NC}"

  # Create repository on GitHub using curl
  RESPONSE=$(curl -s -X POST -H "Authorization: token $TOKEN" \
    -d "{\"name\":\"$REPO_NAME\", $PRIVATE_OPTION}" \
    "https://api.github.com/user/repos" || echo "ERROR")

  if [[ "$RESPONSE" == *"ERROR"* || "$RESPONSE" == *"message"*"Bad credentials"* ]]; then
    echo -e "${RED}⚠️ Error creating repository on GitHub. Check your token.${NC}"
  elif [[ "$RESPONSE" == *"message"*"already exists"* ]]; then
    echo -e "${YELLOW}Repository already exists on GitHub. Continuing...${NC}"
  elif [[ "$RESPONSE" == *"\"name\":\"$REPO_NAME\""* ]]; then
    echo -e "${GREEN}✓ Repository successfully created on GitHub${NC}"
  else
    echo -e "${RED}⚠️ Unexpected response when creating repository:${NC}"
    echo "$RESPONSE" | head -n 10
  fi

  # Add origin with token
  git remote add origin https://$TOKEN@github.com/$FULL_REPO.git
  echo -e "${GREEN}✓ Remote origin configured${NC}"

  # Configure main branch
  git branch -M main 2>/dev/null || echo -e "${YELLOW}Note: No commits yet, main branch will be created on first commit${NC}"

  # If there are no files or commits, create a basic README
  if [ -z "$(git rev-parse --verify HEAD 2>/dev/null)" ]; then
    # Only create README.md if it doesn't exist
    if [ ! -f "README.md" ]; then
      echo -e "${YELLOW}Creating initial README.md...${NC}"
      echo "# $REPO_NAME" > README.md
      echo "Repository created with GitEasy" >> README.md
      echo -e "${GREEN}✓ Basic README.md created${NC}"
    else
      echo -e "${YELLOW}Using existing README.md${NC}"
    fi

    # Add README and .gitignore (if it exists)
    git add README.md
    if [ -f ".gitignore" ]; then
      git add .gitignore
    fi

    git commit -m "Initial commit: README.md and .gitignore"
    echo -e "${GREEN}✓ Initial commit created${NC}"
  fi

  echo -e "${GREEN}✓ Repository configured successfully${NC}"

  # Ask if want to do initial push
  echo -e "${YELLOW}Do you want to do an initial push now? (y/n)${NC}"
  read RESPONSE
  if [[ $RESPONSE == "y" || $RESPONSE == "Y" || $RESPONSE == "yes" || $RESPONSE == "YES" ]]; then
    git push -u origin main
    PUSH_EXIT_CODE=$?
    if [ $PUSH_EXIT_CODE -eq 0 ]; then
      echo -e "${GREEN}✓ Initial push completed successfully${NC}"
    else
      echo -e "${RED}⚠️ There was a problem with the initial push (code: $PUSH_EXIT_CODE)${NC}"
      echo -e "${YELLOW}Verify that the repository exists on GitHub and that you have permissions${NC}"
    fi
  else
    echo -e "${YELLOW}You can push later with: gitEasy save${NC}"
  fi
}


# Create a new branch
create_branch() {
  BRANCH_NAME="$1"

  # If no name is provided, ask for it
  if [ -z "$BRANCH_NAME" ]; then
    echo -e "${YELLOW}Enter name for the new branch:${NC}"
    read BRANCH_NAME

    if [ -z "$BRANCH_NAME" ]; then
      echo -e "${RED}Error: You must specify a name for the branch${NC}"
      exit 1
    fi
  fi

  echo -e "${YELLOW}Creating branch '$BRANCH_NAME'...${NC}"

  # Check if branch already exists locally
  if git show-ref --verify --quiet refs/heads/$BRANCH_NAME; then
    echo -e "${RED}Branch '$BRANCH_NAME' already exists locally.${NC}"
    echo -e "${YELLOW}Do you want to switch to that branch? (y/n)${NC}"
    read RESPONSE
    if [[ $RESPONSE == "y" || $RESPONSE == "Y" || $RESPONSE == "yes" || $RESPONSE == "YES" ]]; then
      git checkout $BRANCH_NAME
      if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Switched to branch '$BRANCH_NAME'${NC}"
      else
        echo -e "${RED}⚠️ Error switching to branch${NC}"
      fi
    fi
    return 0
  fi

  # Check if there are unsaved changes
  if [ -n "$(git status --porcelain)" ]; then
    echo -e "${RED}⚠️ You have unsaved local changes.${NC}"
    echo -e "${YELLOW}Do you want to save your changes before creating the branch? (y/n)${NC}"
    read RESPONSE
    if [[ $RESPONSE == "y" || $RESPONSE == "Y" || $RESPONSE == "yes" || $RESPONSE == "YES" ]]; then
      save_changes "Save changes before creating branch $BRANCH_NAME"
    else
      echo -e "${YELLOW}Your changes will be carried to the new branch.${NC}"
    fi
  fi

  # Create branch and switch to it
  git checkout -b $BRANCH_NAME

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Branch '$BRANCH_NAME' created and you are now on it${NC}"

    # Ask if want to push branch
    echo -e "${YELLOW}Do you want to publish this branch to GitHub now? (y/n)${NC}"
    read RESPONSE
    if [[ $RESPONSE == "y" || $RESPONSE == "Y" || $RESPONSE == "yes" || $RESPONSE == "YES" ]]; then
      git push -u origin $BRANCH_NAME
      if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Branch published on GitHub${NC}"
      else
        echo -e "${RED}⚠️ Error publishing branch${NC}"
        echo -e "${YELLOW}The branch was created locally. You can publish it later with:${NC}"
        echo -e "  git push -u origin $BRANCH_NAME"
      fi
    else
      echo -e "${YELLOW}The branch only exists locally. You can publish it later with:${NC}"
      echo -e "  git push -u origin $BRANCH_NAME"
    fi
  else
    echo -e "${RED}⚠️ Error creating branch${NC}"
  fi
}

# Save changes
save_changes() {
  MESSAGE="$*"
  if [ -z "$MESSAGE" ]; then
    # If no message is provided, use a default one with date
    MESSAGE="Update $(date '+%Y-%m-%d %H:%M')"
  fi

  # Check if there are changes to save
  if [ -z "$(git status --porcelain)" ]; then
    echo -e "${YELLOW}No changes to save.${NC}"

    # Check if there are commits that haven't been sent
    if [ -n "$(git log origin/main..main 2>/dev/null)" ]; then
      echo -e "${YELLOW}But there are local commits that haven't been sent to GitHub.${NC}"
      echo -e "${YELLOW}Do you want to send them now? (y/n)${NC}"
      read RESPONSE
      if [[ $RESPONSE == "y" || $RESPONSE == "Y" || $RESPONSE == "yes" || $RESPONSE == "YES" ]]; then
        git push -u origin main
        if [ $? -eq 0 ]; then
          echo -e "${GREEN}✓ Changes sent to GitHub${NC}"
        else
          echo -e "${RED}⚠️ Error sending changes to GitHub${NC}"
        fi
      fi
    fi
    return 0
  fi

  echo -e "${YELLOW}Saving changes...${NC}"

  # Show which files will be saved
  echo -e "${YELLOW}Files to save:${NC}"
  git status --short

  # Ask for confirmation
  echo -e "${YELLOW}Confirm saving these changes? (y/n)${NC}"
  read RESPONSE
  if [[ $RESPONSE != "y" && $RESPONSE != "Y" && $RESPONSE != "yes" && $RESPONSE != "YES" ]]; then
    echo -e "${YELLOW}Operation canceled.${NC}"
    return 0
  fi

  # Add all changes
  git add .

  # Commit with message
  git commit -m "$MESSAGE"

  # Ask if want to send changes
  echo -e "${YELLOW}Send changes to GitHub now? (y/n)${NC}"
  read RESPONSE
  if [[ $RESPONSE == "y" || $RESPONSE == "Y" || $RESPONSE == "yes" || $RESPONSE == "YES" ]]; then
    git push -u origin main
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}✓ Changes saved and sent correctly${NC}"
    else
      echo -e "${RED}⚠️ Error sending changes to GitHub${NC}"
      echo -e "${GREEN}✓ Changes saved locally${NC}"
    fi
  else
    echo -e "${GREEN}✓ Changes saved locally${NC}"
    echo -e "${YELLOW}You can send them later with: gitEasy save${NC}"
  fi
}

# Update repository
update_repo() {
  echo -e "${YELLOW}Updating repository...${NC}"

  # Check if there are local changes that could have conflicts
  if [ -n "$(git status --porcelain)" ]; then
    echo -e "${RED}⚠️ You have unsaved local changes that could have conflicts.${NC}"
    echo -e "${YELLOW}Do you want to save your changes first? (y/n)${NC}"
    read RESPONSE
    if [[ $RESPONSE == "y" || $RESPONSE == "Y" || $RESPONSE == "yes" || $RESPONSE == "YES" ]]; then
      save_changes "Save changes before updating"
    else
      echo -e "${YELLOW}Your local changes will be maintained, but there could be conflicts.${NC}"
    fi
  fi

  git pull origin main
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Repository updated${NC}"
  else
    echo -e "${RED}⚠️ There was a problem updating. Check conflicts.${NC}"
  fi
}

# Show status
show_status() {
  echo -e "${YELLOW}Repository status:${NC}"
  git status

  # Show additional useful information
  echo -e "\n${YELLOW}Branches:${NC}"
  git branch -v

  echo -e "\n${YELLOW}Remote:${NC}"
  git remote -v
}

# Show log
show_log() {
  echo -e "${YELLOW}Recent history:${NC}"
  git log --oneline --graph --decorate -n 10
}

# Command handling
case "$1" in
  setup)
    shift
    setup_repo "$1"
    ;;
  save)
    shift
    # Check if we're in a Git repository
    if [ ! -d ".git" ]; then
      echo -e "${RED}Error: You are not in a Git repository${NC}"
      echo "First run 'gitEasy setup [repo-name]' to configure"
      exit 1
    fi
    save_changes "$@"
    ;;
  update)
    # Check if we're in a Git repository
    if [ ! -d ".git" ]; then
      echo -e "${RED}Error: You are not in a Git repository${NC}"
      echo "First run 'gitEasy setup [repo-name]' to configure"
      exit 1
    fi
    update_repo
    ;;
  branch)
    # Check if we're in a Git repository
    if [ ! -d ".git" ]; then
      echo -e "${RED}Error: You are not in a Git repository${NC}"
      echo "First run 'gitEasy setup [repo-name]' to configure"
      exit 1
    fi
    shift
    create_branch "$1"
    ;;
  status)
    # Check if we're in a Git repository
    if [ ! -d ".git" ]; then
      echo -e "${RED}Error: You are not in a Git repository${NC}"
      echo "First run 'gitEasy setup [repo-name]' to configure"
      exit 1
    fi
    show_status
    ;;
  log)
    # Check if we're in a Git repository
    if [ ! -d ".git" ]; then
      echo -e "${RED}Error: You are not in a Git repository${NC}"
      echo "First run 'gitEasy setup [repo-name]' to configure"
      exit 1
    fi
    show_log
    ;;
  help|*)
    show_help
    ;;
esac
