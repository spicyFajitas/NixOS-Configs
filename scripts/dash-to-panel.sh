#!/usr/bin/env bash
# Convert GNOME Dash-to-Panel dconf dump to Nix dconf.settings format
# Output to a hard-coded Nix file path

# Temporary file for dconf dump
TMP_DCONF="dash-to-panel-settings.txt"
OUTPUT_NIX="./system/dash-to-panel.nix"

# Dump Dash-to-Panel settings
dconf dump /org/gnome/shell/extensions/dash-to-panel/ > "$TMP_DCONF"

# Start writing the Nix file
{
    echo '{ config, lib, pkgs, ... }:'
    echo ''
    echo '{'
    echo '  dconf.settings = {'
    echo '    "org/gnome/shell/extensions/dash-to-panel" = {'

    # Process each key=value line
    grep -v "^\[" "$TMP_DCONF" | grep -v "^$" | while IFS='=' read -r key value; do
        key=$(echo "$key" | xargs)
        value=$(echo "$value" | xargs)

        # Wrap complex structures (JSON-like dicts/arrays) in multi-line Nix string
        if [[ "$value" =~ ^\{.*\}$ || "$value" =~ ^\[.*\]$ ]]; then
            value="''$value''"
        # Convert single-quoted strings to double quotes
        elif [[ "$value" =~ ^\'.*\'$ ]]; then
            value="\"${value:1:-1}\""
        # Keep booleans and numbers as-is
        elif [[ "$value" =~ ^(true|false|[0-9]+(\.[0-9]+)?)$ ]]; then
            :
        # Empty values -> GVariant-compatible empty string
        elif [[ "$value" == "" || "$value" == "null" ]]; then
            value="\"\""
        else
            # Fallback: quote any other string
            value="\"$value\""
        fi

        echo "    ${key} = ${value};"
    done

    echo '    };'
    echo '  };'
    echo '}'
} > "$OUTPUT_NIX"

echo "Dash-to-Panel Nix settings written to $OUTPUT_NIX"
