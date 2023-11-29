#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Run firebase hosting deploy
firebase use --token $FIREBASE_TOKEN testing-project-b8e11

# Get the deployed URL from the Firebase CLI output using awk
deployed_url=$(firebase hosting:channel:deploy "pr-$BITBUCKET_PR_ID"  --non-interactive --json | grep -o '"url": *"[^"]*"' | awk -F'"' '{print $4}')

# Trim whitespaces
deployed_url=$(echo "$deployed_url" | tr -d '[:space:]')

# Check if the URL is empty
if [ -z "$deployed_url" ]; then
    echo "Failed to retrieve the deployed URL from Firebase hosting."
    exit 1
fi

echo "Deployed URL: $deployed_url"

# Call the Bitbucket API script with the deployed URL
"$SCRIPT_DIR/post_preview_url.sh" "$deployed_url"
