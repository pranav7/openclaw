#!/bin/bash
# Add a comment to a card
# Usage: ./add-comment.sh <cardId> "Comment text"

: "${TRELLO_API_KEY:?Missing TRELLO_API_KEY}"
: "${TRELLO_TOKEN:?Missing TRELLO_TOKEN}"

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <cardId> \"Comment text\""
  exit 1
fi

curl -s -X POST "https://api.trello.com/1/cards/$1/actions/comments?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "text=$2" | jq '{id, type, data: {text: .data.text}}'
