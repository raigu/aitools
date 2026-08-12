#!/usr/bin/env bash
set -euo pipefail
# Pre-commit hook that reminds Claude about commit message conventions

# Self-locate the plugin root (fallback if CLAUDE_PLUGIN_ROOT is unset)
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

# Read JSON input from stdin
input=$(cat)

# Extract the command — prefer jq, fall back to grep
if command -v jq &>/dev/null; then
    command=$(echo "$input" | jq -r '.tool_input.command // ""' 2>/dev/null) || true
else
    command=$(echo "$input" | grep -oP '"command"\s*:\s*"\K[^"]*' 2>/dev/null) || true
fi

# Check if this is a git commit command
if [[ "$command" == git\ commit* ]] || [[ "$command" == *"&& git commit"* ]] || [[ "$command" == *"; git commit"* ]]; then
    skill_file="$PLUGIN_ROOT/skills/writing-commit-messages/SKILL.md"
    if [[ -f "$skill_file" ]]; then
        echo "REMINDER - Follow this skill for commit messages:"
        echo ""
        cat "$skill_file"
    else
        echo "REMINDER: Use the writing-commit-messages skill before committing."
    fi
fi

exit 0
