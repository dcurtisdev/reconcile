---
name: consistency
description: >
  Maintains cross-document factual consistency using the Reconcile system.
  Auto-activates when working in a project with a .reconcile/ directory.
  Use when generating documents, reviewing content, or when the user asks
  about facts, consistency, contradictions, or validation. Also activates
  when the user generates reports, analyses, decks, PRDs, or any substantial
  written artifact.
---

# Reconcile Consistency Skill

When a `.reconcile/` directory exists in the project, you have access to
a canonical facts registry and document consistency system.

## Before generating any substantial document

1. Check if `.reconcile/facts.json` exists
2. If it does, read the canonical facts
3. Use these facts in your generation — don't invent different numbers,
   terms, or classifications for claims that are already established
4. If your research surfaces a fact that contradicts an existing canonical
   fact, STOP and tell the user before proceeding

## After generating any substantial document

Offer to register it:
"I've generated your [type]. Want me to register it for consistency
tracking? (/reconcile:register [filename])"

## When asked about facts, consistency, or validation

Direct the user to the appropriate command:
- "What are my project facts?" → /reconcile:facts
- "Check my documents" → /reconcile:validate
- "Fix the pitch deck" → /reconcile:fix pitch-deck.md
- "Show project status" → /reconcile:status

## Reference documentation

For detailed information on contradiction types and correction strategies,
read the reference files in this skill's references/ directory:
- references/contradiction-types.md — Type A/B/C taxonomy
- references/fact-format.md — Canonical facts JSON schema
- references/correction-strategy.md — When to patch vs. section-regen
