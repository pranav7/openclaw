#!/bin/bash
# Create a new card in a list
# Usage: ./create-card.sh <listId> "Card Title" "Card description"

: "${TRELLO_API_KEY:?Missing TRELLO_API_KEY}"
: "${TRELLO_TOKEN:?Missing TRELLO_TOKEN}"

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <listId> \"Card Title\" [\"Card description\"]"
  exit 1
fi

LISTID="$1"
TITLE="$2"
DESC="${3:-}"

curl -s -X POST "https://api.trello.com/1/cards?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "idList=$LISTID" \
  -d "name=$TITLE" \
  -d "desc=$DESC" | jq '{name, id, url}'
