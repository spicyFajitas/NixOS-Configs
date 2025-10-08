#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$HOME/Documents/code/NixOS-Configs"
SYSTEM_DIR="/etc/nixos"
GIT_REMOTE="git@github.com:spicyFajitas/nixos-config.git"
BRANCH="main"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "→ Restoring NixOS configuration from repo to system"
echo "   Branch: $BRANCH"
echo "   Time:   $TIMESTAMP"
echo

# Ensure repo exists
if [ ! -d "$REPO_DIR/.git" ]; then
  echo "→ Cloning $GIT_REMOTE into $REPO_DIR"
  git clone -b "$BRANCH" "$GIT_REMOTE" "$REPO_DIR"
fi

cd "$REPO_DIR"

# Pull latest repo version
echo "→ Updating local repo..."
git fetch origin "$BRANCH"
git checkout "$BRANCH"
git pull --rebase origin "$BRANCH"

# Commit any local changes before overwrite (just in case)
if ! git diff --quiet; then
  echo "→ Local repo changes detected. Committing..."
  git add -A
  git commit -m "Auto-commit before system sync - $TIMESTAMP"
  git push origin "$BRANCH"
fi

# Show a concise diff summary (non-interactive)
echo
echo "→ Summary of differences (repo vs system):"
sudo diff -qr "$SYSTEM_DIR" "$REPO_DIR" || true
echo "→ Syncing repo → /etc/nixos"

# Sync and rebuild automatically
sudo rsync -a --delete "$REPO_DIR/" "$SYSTEM_DIR/"
echo "✓ Sync complete."

echo "→ Rebuilding system..."
sudo nixos-rebuild switch
echo "✓ System rebuild complete."

echo
echo "✓ NixOS configuration successfully restored from repo."
