---
description: View and manage the canonical facts registry
---

# Manage Facts

View, add, edit, or remove canonical facts for this project.

## What to do

1. **Load facts** from `.reconcile/facts.json`. If it doesn't exist, tell the user to register a document first or run this command with "init" to create an empty registry.

2. **Interpret $ARGUMENTS:**
   - Empty or "show" → Display all facts grouped by category
   - "add [category] [fact]" → Add a fact manually
   - "remove [id or description]" → Remove a fact (with confirmation)
   - "edit [id or description]" → Edit a fact in place
   - "schema [name]" → Switch to a different fact schema template
   - "export" → Output facts as formatted markdown to stdout
   - "init [schema]" → Initialize `.reconcile/` with optional schema (general, medtech, saas, legal, finance)

3. **When displaying facts**, format cleanly:
   ```
   Reconcile — Canonical Facts (medtech schema)

   📊 Market (3 facts)
     • tam: $4.2B global FMS market
       Source: Grand View Research 2024 | From: market-research.md
     • cagr: 6.1% projected through 2030
       Source: Grand View Research 2024 | From: market-research.md
     • geography: North America 42% share, Europe 28%
       Source: Grand View Research 2024 | From: market-research.md

   🏢 Competitive (2 facts)
     • leader: ConvaTec Flexi-Seal ~68% market share
       Source: market-research.md analysis | From: market-research.md
     • pricing: Flexi-Seal $180/unit, Hollister ~$150/unit
       Source: manufacturer data | From: market-research.md

   📋 Regulatory (3 facts)
     ...

   5 categories, 14 total facts
   Documents using these facts: 3
   Last validation: 2 days ago (2 contradictions in pitch-deck.md)
   ```
