#!/bin/bash
# Archive a card
# Usage: ./archive-card.sh <cardId>

: "${TRELLO_API_KEY:?Missing TRELLO_API_KEY}"
: "${TRELLO_TOKEN:?Missing TRELLO_TOKEN}"

if [ -z "$1" ]; then
  echo "Usage: $0 <cardId>"
  exit 1
fi

curl -s -X PUT "https://api.trello.com/1/cards/$1?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "closed=true" | jq '{name, id, closed}'
