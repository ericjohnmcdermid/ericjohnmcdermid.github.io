#!/bin/bash

set -e

# Ask for commit message
echo "📄 Enter a commit message:"
read MAIN_COMMIT_MSG

# Step 1: Ensure we're on main
echo "🔁 Switching to main..."
git checkout main

# Step 2: Add and commit local changes
echo "💾 Staging and committing changes to main..."
git add .
git commit -m "$MAIN_COMMIT_MSG"

# Step 3: Build the site
echo "🏗️  Building site..."
bundle exec jekyll build

# Step 4: Copy built site to a temp folder
echo "📦 Copying site to temp folder..."
rm -rf /tmp/site-build
cp -r _site /tmp/site-build

# Step 5: Deploy to gh-pages
echo "🚀 Switching to gh-
