---
name: writing-commit-messages
description: Use when committing code, running git commit, or creating commits - enforces clear commits: imperative mood subject (50 chars), blank line, wrapped body (72 chars) explaining what/why in business language
---

# Writing Commit Messages

## The Imperative Test
Subject must complete: "If applied, this commit will ___"

## Quick Reference
| Rule | Good | Bad |
|------|------|-----|
| Imperative | Add user auth | Added user auth |
| Capitalize | Fix login bug | fix login bug |
| No period | Update README | Update README. |
| 50 chars | Short and clear | Very long subject that goes on... |

## Business Language Rule

Commit messages are for **PMs tracking work** and **future devs needing business context** — not for explaining implementation.

**Avoid in subjects and bodies:**
- Variable/function names (`userDto`, `handleSubmit`)
- Internal class/module names (`PaymentGatewayAdapter`, `OrderValidator`)
- Framework specifics (`Redux selector`, `React hook`)

**Instead describe:**
- User/business impact when obvious
- Problem being solved when impact is indirect

**Exception:** Purely technical changes (infra, tooling, CI) may use technical terms when no business meaning exists.

**Examples:**
| Bad (implementation) | Good (business) |
|---------------------|-----------------|
| Fix null check in `OrderValidator` | Prevent checkout crash on empty cart |
| Add caching to `InvoiceRepository` | Speed up invoice loading |
| Refactor `EmailService` to use templates | Enable customizable email formatting |

## Format
```
<Subject: imperative, capitalized, no period>

<Body: 72-char wrapped, explains WHAT and WHY>
```

## Ticket Prefix
If the branch name starts with a ticket number, prefix the subject with it.
- Branch: `134-add-invoice-re-sending` → Subject: `#134 Add invoice re-sending`
- Branch: `PROJ-42-fix-login` → Subject: `PROJ-42 Fix login`
- Branch: `feature/login` → No prefix needed

## Common Mistakes
- Past tense ("Fixed", "Added") → Use imperative ("Fix", "Add")
- Describing HOW → Focus on WHAT changed and WHY
- No blank line between subject and body
- Subject too long (truncated in git log --oneline)
- Using internal names → Describe business impact instead

## Red Flags - Rewrite Commit
- Subject doesn't pass imperative test
- Subject > 50 characters
- Lowercase first letter
- Trailing period on subject
- Body explains implementation details instead of reasoning
- Contains variable, class, or function names (unless purely technical change)
- Any AI-generated references (no "Generated with...", no "Co-Authored-By: Claude", etc.)
