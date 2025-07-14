#!/bin/bash

# Load .env if available
if [ -f ".env" ]; then
  export $(cat .env | xargs)
fi

NTFY_URL=${NTFY_URL:-https://ntfy.sh}
NTFY_TOPIC=${NTFY_TOPIC:-zscaler-devsecops}

echo "🔔 Sending test notification to $NTFY_URL/$NTFY_TOPIC ..."
curl -H "Title: Manual Notification" \
     -H "Tags: test" \
     -H "Priority: default" \
     -d "This is a manual test notification from $(hostname)" \
     "$NTFY_URL/$NTFY_TOPIC"
