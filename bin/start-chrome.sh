#!/bin/bash
sleep 5
open -na "Google Chrome" --args \
  --app=http://localhost:4173 \
  --disable-session-crashed-bubble \
  --disable-infobars
