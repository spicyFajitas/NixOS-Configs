#!/usr/bin/env bash
# Convert full dconf dump to Nix home-manager dconf.settings format
# Usage:
#   dconf dump / > full-dconf.txt
#   ./dconf-to-nix-wrapper.sh full-dconf.txt > dconf-settings.nix

dconf dump / > full-dconf.txt


output_file="./system/dconf-settings.nix"

{
  echo "# Auto-generated from dconf dump"
  echo "dconf.settings = {"

  # Dump from dconf and convert
  dconf dump / | awk '
    BEGIN { section="" }
    /^\[/ {
      section=$0
      gsub(/[\[\]]/, "", section)
      next
    }
    /^[a-zA-Z0-9_.-]+=/ {
      split($0, kv, "=")
      key=kv[1]
      val=kv[2]
      # Trim leading/trailing spaces
      sub(/^[ \t]+/, "", val)
      sub(/[ \t]+$/, "", val)
      # Remove surrounding quotes
      gsub(/^["'\'']/, "", val)
      gsub(/["'\'']$/, "", val)
      # Escape internal quotes
      gsub(/"/, "\\\"", val)
      printf("  \"%s\" = { %s = \"%s\"; };\n", section, key, val)
    }
  '

  echo "};"
} > "$output_file"

echo "✅ Exported to $output_file"