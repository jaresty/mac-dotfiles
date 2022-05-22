#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title schemastore
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Search string", "percentEncoded": true }

# Documentation:
# @raycast.description Search json schema store

curl --silent https://www.schemastore.org/api/json/catalog.json | jq '.schemas | .[] | select(.description | match("'${1}'"))'

