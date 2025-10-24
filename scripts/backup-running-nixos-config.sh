#!/usr/bin/env bash
set -euo pipefail

# === Configurable Variables ===
SRC="/etc/nixos"                       # Source: your live NixOS config
DEST="$HOME/Documents/code/nixos-configs"  # Destination repo clone
GIT_REMOTE="git@github.com:spicyFajitas/nixos-config.git"  # Change to your repo URL
BRANCH="main"                          # Git branch name

# === Timestamp for commit ===
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# === Ensure destination exists ===
if [ ! -d "$DEST" ]; then
  echo "→ Cloning $GIT_REMOTE into $DEST"
  git clone "$GIT_REMOTE" "$DEST"
fi

# === Sync configs ===
echo "→ Syncing configs from $SRC to $DEST"
rsync -a --delete "$SRC/" "$DEST/"

# === Commit changes ===
cd "$DEST"
git add -A

if git diff --cached --quiet; then
  echo "→ No changes to commit."
else
  echo "→ Committing and pushing changes."
  git commit -m "NixOS config backup - $TIMESTAMP"
  git push origin "$BRANCH"
fi

echo "✓ Backup complete."
