#!/bin/zsh -le

project_name=${PWD##*/}
mcp tools -f json npx -y @lamemind/mcp-server-multiverse@latest /Users/tkma6d4/dev/${project_name}-multiverse.json

wait

ps aux | grep mcp | awk '{print $2}' | xargs kill &> /dev/null || true