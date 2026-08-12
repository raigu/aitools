# aitools — Installable Claude Code Plugins

## Core Principle

Every tool in this repo must describe **what** to do and **why** — never **how**.

The local AI knows the project's language, framework, tooling, and environment.
These plugins give it the right intent and direction. The local project's
CLAUDE.md can override or extend any plugin instruction.

## What This Means in Practice

- **No language references** — no Python, JavaScript, Ruby, Go, etc.
- **No framework references** — no Django, React, Rails, Spring, etc.
- **No tool references** — no GitLab, GitHub, Jira, Docker, npm, etc.
- **No environment assumptions** — no OS, shell, package manager specifics
- **No implementation examples in code** — use business-language examples only

### Good vs Bad

| Bad (how) | Good (what/why) |
|-----------|-----------------|
| "Run `pytest` before pushing" | "Run the project's test suite before pushing" |
| "Create a GitLab merge request" | "Create a merge request" |
| "Use `npm run lint`" | "Run the linter" |
| "Add a Django migration" | "Add a database migration" |
| "Branch: `134-add-invoice`" | ✅ OK — branch naming is tool-agnostic |

## Pre-commit Guard

A pre-commit hook (`hooks/pre-commit`) blocks commits containing specific
tool/platform/framework references. Additional project-specific patterns
can be added to `~/.config/aitools/blocklist` (local-only, never committed).

New clones: run `git config core.hooksPath hooks` to activate.

## Plugin Structure

```
plugins/<name>/
  .claude-plugin/plugin.json
  skills/<name>/SKILL.md
  hooks/                          # optional
    hooks.json
    *.sh
```
