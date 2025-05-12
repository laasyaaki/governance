#!/bin/bash
set -e

PR_AUTHOR=$1
TEAM_FILE=$2

# Check if PR author is in members list
if ! grep -qE "members\s*=\s*\[" "$TEAM_FILE" || ! grep -qE "(\"$PR_AUTHOR\"|'$PR_AUTHOR')" "$TEAM_FILE"; then
    echo "::error::Team creator must be listed as a member in $TEAM_FILE"
    exit 1
fi

echo "Team creator membership validated"
