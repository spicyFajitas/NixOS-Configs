#!/usr/bin/env bash
# Convert full dconf dump to Nix home-manager dconf.settings format
# Usage:
#   dconf dump / > full-dconf.txt
#   ./dconf-to-nix-wrapper.sh full-dconf.txt > dconf-settings.nix

dconf dump / > full-dconf.txt

input="${1:-full-dconf.txt}"

echo "# Auto-generated from dconf dump"
echo "dconf.settings = {"

current_path=""
while IFS= read -r line; do
  # Section header like [/org/gnome/shell/extensions/dash-to-panel/]
  if [[ "$line" =~ ^\[.*\]$ ]]; then
    # Close previous section if any
    if [[ -n "$current_path" ]]; then
      echo "  };"
    fi
    # Extract the path inside []
    path=$(echo "$line" | sed 's/^\[\(.*\)\]$/\1/' | sed 's:/$::')
    current_path="$path"
    echo "  \"$current_path\" = {"
    continue
  fi

  # Skip empty lines
  [[ -z "$line" ]] && continue

  # Parse key=value pairs
  key="${line%%=*}"
  value="${line#*=}"
  key=$(echo "$key" | xargs)
  value=$(echo "$value" | xargs)

  # Detect array
  if [[ "$value" =~ ^\[.*\]$ ]]; then
    # Remove brackets and split by comma
    inner=$(echo "$value" | sed -E "s/^\[|\]$//" | tr "," "\n" | sed "s/'/\"/g" | xargs)
    nix_array="["
    for v in $inner; do
      nix_array="$nix_array $v"
    done
    nix_array="$nix_array ]"
    value="$nix_array"

  # Detect quoted string (convert single quotes to double)
  elif [[ "$value" =~ ^\'.*\'$ ]]; then
    value="\"${value:1:-1}\""

  # Detect tuple (e.g. (980, 640, true))
  elif [[ "$value" =~ ^\(.*\)$ ]]; then
    value="\"$value\""

  # Detect JSON-like or multi-line (wrap with Nix multiline quotes)
  elif [[ "$value" == *"{"* || "$value" == *"}"* ]]; then
    value="''\n$value\n''"

  # Detect booleans or numbers
  elif [[ "$value" =~ ^(true|false|-?[0-9]+(\.[0-9]+)?)$ ]]; then
    : # leave as is

  # Everything else → string
  else
    value="\"$value\""
  fi

  echo "    $key = $value;"
done < "$input"

# Close last section
if [[ -n "$current_path" ]]; then
  echo "  };"
fi

echo "};"