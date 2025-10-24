#!/usr/bin/env bash
set -euo pipefail

USER_FILE="user-dconf.nix"
SYSTEM_FILE="system-dconf.nix"
TMP_DUMP=$(mktemp)

echo "Dumping dconf..."
dconf dump / > "$TMP_DUMP"

# Prepare output files
cat > "$USER_FILE" <<EOF
# Auto-generated user dconf settings
{ config, ... }: {
  dconf.settings = {
EOF

cat > "$SYSTEM_FILE" <<EOF
# Auto-generated system dconf settings
{ config, ... }: {
  dconf.settings = {
EOF

# Function to convert dconf key/values to Nix lines
convert_to_nix() {
  awk '
    BEGIN { section="" }
    /^\[/ { section=$0; gsub(/^\[|\]$/, "", section); next }
    /^[^#[:space:]]/ {
      split($0, kv, "=")
      key=kv[1]; val=kv[2]
      gsub(/^ +| +$/, "", key)
      gsub(/^ +| +$/, "", val)
      gsub(/^['\"]/,"",val)
      gsub(/['\"]$/,"",val)
      printf "    \"%s/%s\" = \"%s\";\n", section, key, val
    }
  ' "$1"
}

# Helper to classify user vs system settings
is_user_setting() {
  case "$1" in
    /org/gnome/*|/ca/desrt/*|/com/github/*)
      return 0 ;; # true
    *)
      return 1 ;;
  esac
}

# Split dump by section and process each
awk '/^\[/{if (s)print s; s=$0; next}{s=s"\n"$0}END{print s}' "$TMP_DUMP" |
while IFS= read -r block; do
  section=$(grep '^\[' <<< "$block" | sed 's/^\[\(.*\)\]$/\1/')
  tmp_section=$(mktemp)
  echo "$block" > "$tmp_section"
  nix_lines=$(convert_to_nix "$tmp_section" || true)

  if [[ -n "$nix_lines" ]]; then
    if is_user_setting "/$section"; then
      echo "$nix_lines" >> "$USER_FILE"
    else
      echo "$nix_lines" >> "$SYSTEM_FILE"
    fi
  fi

  rm -f "$tmp_section"
done

# Close Nix blocks
echo "  };" >> "$USER_FILE"
echo "}" >> "$USER_FILE"

echo "  };" >> "$SYSTEM_FILE"
echo "}" >> "$SYSTEM_FILE"

rm -f "$TMP_DUMP"

echo "✅ Generated:"
echo " - $USER_FILE (user-specific settings)"
echo " - $SYSTEM_FILE (system-wide settings)"
