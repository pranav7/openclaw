#!/bin/bash
# List all lists in a board
# Usage: ./list-lists.sh <boardId>

: "${TRELLO_API_KEY:?Missing TRELLO_API_KEY}"
: "${TRELLO_TOKEN:?Missing TRELLO_TOKEN}"

if [ -z "$1" ]; then
  echo "Usage: $0 <boardId>"
  exit 1
fi

curl -s "https://api.trello.com/1/boards/$1/lists?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" | jq '.[] | {name, id}'
