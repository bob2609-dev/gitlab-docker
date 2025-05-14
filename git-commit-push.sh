#!/bin/bash
# Script to add all changed files, commit with a message, and push to remote
# Usage: ./git-commit-push.sh "Your commit message"

set -e  # Exit immediately if a command exits with a non-zero status

# Check if commit message is provided
if [ -z "$1" ]; then
  echo "Error: Commit message is required"
  echo "Usage: $0 \"Your commit message\""
  exit 1
fi

# Store the commit message
COMMIT_MESSAGE="$1"

# Check if we are in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Error: Not a git repository"
  exit 1
fi

echo "==> Checking git status"
git status

echo "==> Adding all changed files"
git add .

echo "==> Committing with message: $COMMIT_MESSAGE"
git commit -m "$COMMIT_MESSAGE"

# Check if there is a remote repository configured
REMOTE_EXISTS=$(git remote)
if [ -z "$REMOTE_EXISTS" ]; then
  echo "Warning: No remote repository configured. Commit is local only."
  echo "To push later, set up a remote with: git remote add origin <your-repo-url>"
  exit 0
fi

echo "==> Pushing to remote repository"
# Try to push, handling potential errors
if ! git push; then
  echo "Warning: Push failed."
  echo "This could be because:"
  echo "  1. The remote branch doesn't exist yet"
  echo "  2. You don't have permission to push"
  echo "  3. There are conflicts with remote changes"
  
  # Ask if user wants to force push or push to a new branch
  read -p "Do you want to push to a new branch? (y/n): " CREATE_NEW
  if [[ $CREATE_NEW == "y" || $CREATE_NEW == "Y" ]]; then
    read -p "Enter new branch name: " BRANCH_NAME
    git push --set-upstream origin "$BRANCH_NAME"
  else
    read -p "Do you want to force push? (y/n): " FORCE_PUSH
    if [[ $FORCE_PUSH == "y" || $FORCE_PUSH == "Y" ]]; then
      echo "Force pushing..."
      git push --force
    else
      echo "Push cancelled. Your changes are committed locally."
    fi
  fi
fi

echo "==> Done!"
