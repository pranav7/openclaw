#!/bin/bash
: "${TRELLO_API_KEY:?Missing TRELLO_API_KEY}"
: "${TRELLO_TOKEN:?Missing TRELLO_TOKEN}"
CARD_ID="698af91ea4f7a4b263d29082"

# Get checklists
CHECKLISTS=$(curl -s "https://api.trello.com/1/cards/$CARD_ID/checklists?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN")

# Core Documents checklist
CL1=$(echo $CHECKLISTS | jq -r '.[] | select(.name=="📋 Core Documents (Both Applicants)") | .id')
curl -s -X POST "https://api.trello.com/1/checklists/$CL1/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Completed online application summary (printed & signed)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL1/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Original passport (valid 6+ months)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL1/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=2x passport photos (recent, color, 4.5x3.5cm)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL1/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Letter of invitation from Pranav" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL1/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Previous Irish visa copies (2021, 2022)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL1/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Marriage certificate copy" > /dev/null

# Financial Documents
CL2=$(echo $CHECKLISTS | jq -r '.[] | select(.name=="💼 Financial Documents") | .id')
curl -s -X POST "https://api.trello.com/1/checklists/$CL2/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Bank statements - last 6 months (both parents)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL2/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Pension/retirement income proof (Dad)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL2/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Employment letter from Divya Public School (Mum)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL2/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Salary slips - last 3 months (Mum)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL2/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Property ownership documents (India)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL2/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=ITR (Income Tax Returns) - last 2 years" > /dev/null

# Travel & Accommodation
CL3=$(echo $CHECKLISTS | jq -r '.[] | select(.name=="✈️ Travel & Accommodation") | .id')
curl -s -X POST "https://api.trello.com/1/checklists/$CL3/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Flight booking confirmation (roundtrip)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL3/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Travel insurance covering entire stay" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL3/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Day-by-day itinerary" > /dev/null

# Host Documents
CL4=$(echo $CHECKLISTS | jq -r '.[] | select(.name=="🏠 Host Documents (Pranav)") | .id')
curl -s -X POST "https://api.trello.com/1/checklists/$CL4/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Passport copy (all pages with stamps)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL4/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=IRP card copy (Stamp 1G)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL4/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Employment letter/contract" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL4/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Recent payslips (3 months)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL4/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Bank statements (3-6 months)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL4/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Proof of address (utility bill/tenancy agreement)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL4/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Birth certificate copy (proving relationship)" > /dev/null

# Additional Documents
CL5=$(echo $CHECKLISTS | jq -r '.[] | select(.name=="📎 Additional Documents") | .id')
curl -s -X POST "https://api.trello.com/1/checklists/$CL5/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Cover letter explaining visit purpose" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL5/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Family photos (previous visits)" > /dev/null
curl -s -X POST "https://api.trello.com/1/checklists/$CL5/checkItems?key=$TRELLO_API_KEY&token=$TRELLO_TOKEN" -d "name=Previous visa stamps/permits copies" > /dev/null

echo "✅ All checklist items added!"
