#!/bin/bash
: "${TRELLO_API_KEY:?Missing TRELLO_API_KEY}"
: "${TRELLO_TOKEN:?Missing TRELLO_TOKEN}"

# Create card
CARD_JSON=$(curl -s -X POST "https://api.trello.com/1/cards?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "idList=6989a5ff8819c90caa7f1e98" \
  -d "name=🇮🇪 Parents Visa Documents Checklist" \
  -d "desc=**Applications:**
- 👨 Dad (Harmohan): #81934962
- 👩 Mum (Nisha): #81940362 (NEW - correct dates)

**Travel Dates:** 15 May - 15 Aug 2026

**Next Steps:**
1. ✅ Complete online applications
2. ⏳ Gather all documents below
3. Book biometric appointment
4. Submit to VFS Global Dublin

**Visa Application Centre:**
VFS Global Dublin
📍 Ballsbridge Business Centre, 54 Lansdowne Rd, Dublin 4
🌐 https://visa.vfsglobal.com/irl/en/ind")

CARD_ID=$(echo $CARD_JSON | jq -r '.id')

# Create checklists
curl -s -X POST "https://api.trello.com/1/checklists?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "idCard=$CARD_ID" \
  -d "name=📋 Core Documents (Both Applicants)" > /dev/null

curl -s -X POST "https://api.trello.com/1/checklists?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "idCard=$CARD_ID" \
  -d "name=💼 Financial Documents" > /dev/null

curl -s -X POST "https://api.trello.com/1/checklists?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "idCard=$CARD_ID" \
  -d "name=✈️ Travel & Accommodation" > /dev/null

curl -s -X POST "https://api.trello.com/1/checklists?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "idCard=$CARD_ID" \
  -d "name=🏠 Host Documents (Pranav)" > /dev/null

curl -s -X POST "https://api.trello.com/1/checklists?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" \
  -d "idCard=$CARD_ID" \
  -d "name=📎 Additional Documents" > /dev/null

echo $CARD_JSON | jq '{name, id, url}'
