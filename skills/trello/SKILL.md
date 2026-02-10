# Trello Skill

Manage Trello boards, lists, and cards directly from OpenClaw.

## Setup

Credentials are stored in environment variables:

- `TRELLO_API_KEY`
- `TRELLO_TOKEN`

Set them in your shell profile (e.g. `~/.zshenv`) or OpenClaw's env config.

## Quick Commands

All helper scripts are in this directory:

```bash
# List all boards
./list-boards.sh

# List lists in a board
./list-lists.sh <boardId>

# List cards in a list
./list-cards.sh <listId>

# Create a card
./create-card.sh <listId> "Card Title" "Card description"

# Move a card
./move-card.sh <cardId> <newListId>

# Add a comment
./add-comment.sh <cardId> "Comment text"

# Archive a card
./archive-card.sh <cardId>
```

## Board IDs

Jeff's Board: liK3EPqY (full ID can be extracted from URL)

## Direct API Usage

All commands use curl to hit the Trello REST API:

```bash
# List boards
curl -s "https://api.trello.com/1/members/me/boards?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" | jq '.[] | {name, id}'

# List lists in a board
curl -s "https://api.trello.com/1/boards/{boardId}/lists?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" | jq '.[] | {name, id}'

# List cards in a list
curl -s "https://api.trello.com/1/lists/{listId}/cards?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" | jq '.[] | {name, id, desc}'

# Create a card
curl -s -X POST "https://api.trello.com/1/cards?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "idList={listId}" \
  -d "name=Card Title" \
  -d "desc=Card description"

# Move a card to another list
curl -s -X PUT "https://api.trello.com/1/cards/{cardId}?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "idList={newListId}"

# Add a comment to a card
curl -s -X POST "https://api.trello.com/1/cards/{cardId}/actions/comments?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "text=Your comment here"

# Archive a card
curl -s -X PUT "https://api.trello.com/1/cards/{cardId}?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "closed=true"
```

## Notes

- Board/List/Card IDs can be found in the Trello URL or via the list commands
- The API key and token provide full access to your Trello account - keep them secret!
- Rate limits: 300 requests per 10 seconds per API key; 100 requests per 10 seconds per token
