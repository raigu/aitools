# aitools

Installable Claude Code plugins — shared tools for commit conventions, issue workflows, and more.

## Install

Add the marketplace to your Claude Code settings:

```json
// ~/.claude/settings.json → extraKnownMarketplaces
"aitools-marketplace": {
  "source": { "source": "github", "repo": "raigu/aitools" }
}
```

Then install individual plugins:

```
claude /install writing-commit-messages
```

## Plugins

| Plugin | Description |
|--------|-------------|
| `writing-commit-messages` | Enforce clear commit messages: imperative mood, 50-char subject, business language, GitLab issue prefix |
