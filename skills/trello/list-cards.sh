#!/bin/bash
# List all cards in a list
# Usage: ./list-cards.sh <listId>

: "${TRELLO_API_KEY:?Missing TRELLO_API_KEY}"
: "${TRELLO_TOKEN:?Missing TRELLO_TOKEN}"

if [ -z "$1" ]; then
  echo "Usage: $0 <listId>"
  exit 1
fi

curl -s "https://api.trello.com/1/lists/$1/cards?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" | jq '.[] | {name, id, desc, url}'
