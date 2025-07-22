#!/bin/bash

set -e

echo "🔁 Building site on main branch..."
git checkout main
bundle exec jekyll build

echo "📦 Copying site to temporary folder..."
rm -rf /tmp/site-build
cp -r _site /tmp/site-build

echo "🚀 Switching to gh-pages and deploying..."
git checkout gh-pages
rm -rf *
cp -r /tmp/site-build/* .
git add .
git commit -m "Deploy site update"
git push origin gh-pages --force

echo "🔙 Switching back to main..."
git checkout main

echo "✅ Deployment complete."
