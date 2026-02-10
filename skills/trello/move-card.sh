#!/bin/bash
# Move a card to another list
# Usage: ./move-card.sh <cardId> <newListId>

: "${TRELLO_API_KEY:?Missing TRELLO_API_KEY}"
: "${TRELLO_TOKEN:?Missing TRELLO_TOKEN}"

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <cardId> <newListId>"
  exit 1
fi

curl -s -X PUT "https://api.trello.com/1/cards/$1?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "idList=$2" | jq '{name, id, idList}'
