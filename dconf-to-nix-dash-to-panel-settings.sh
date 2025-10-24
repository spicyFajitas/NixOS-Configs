#!/usr/bin/env bash
# Convert GNOME Dash-to-Panel dconf dump to Nix dconf.settings format

input="${1:-dash-to-panel-settings.txt}"

echo 'dconf.settings = {'
echo '  "org/gnome/shell/extensions/dash-to-panel" = {'

grep -v "^\[" "$input" | grep -v "^$" | while IFS='=' read -r key value; do
  key=$(echo "$key" | xargs)
  value=$(echo "$value" | xargs)

  # Convert strings: 'text' → "text"
  if [[ "$value" =~ ^\'.*\'$ ]]; then
    value="\"${value:1:-1}\""
  fi

  # Convert boolean and numeric values (leave as-is)
  # Otherwise wrap in quotes
  if [[ "$value" =~ ^(true|false|[0-9]+)$ ]]; then
    :
  elif [[ "$value" == "" ]]; then
    value="null"
  fi

  echo "    ${key} = ${value};"
done

echo '  };'
echo '};'
