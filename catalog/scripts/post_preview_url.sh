#!/bin/bash

# Bitbucket API URL
BITBUCKET_API_URL="https://api.bitbucket.org/2.0/repositories/$BITBUCKET_REPO_OWNER/$BITBUCKET_REPO_SLUG/pullrequests/$BITBUCKET_PR_ID/comments"

echo "Posting a comment to $BITBUCKET_API_URL"

# Access token variable
ACCESS_TOKEN=$PIPELINE_PR_TOKEN

# Comment content
COMMENT_CONTENT="Your preview is ready at: [$1]($1)"

# Check if the comment already exists
existing_comment=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" $BITBUCKET_API_URL)

if echo "$existing_comment" | grep -q "Your preview is ready"; then
    echo "Comment already exists, updating it..."
    # Comment exists, update it
    comment_id=$(echo "$existing_comment" | awk -F'"id":' '{print $2}' | awk -F, '{print $1}')
    
    # Trim whitespaces
    comment_id=$(echo "$comment_id" | tr -d '[:space:]')

    echo "Comment ID: $comment_id"
    curl -X PUT -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -d "{\"content\": {\"raw\": \"$COMMENT_CONTENT\"}}" $BITBUCKET_API_URL/$comment_id
else
    echo "Comment does not exist, posting a new comment..."
    # Comment does not exist, post a new comment
    curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -d "{\"content\": {\"raw\": \"$COMMENT_CONTENT\"}}" $BITBUCKET_API_URL
fi
