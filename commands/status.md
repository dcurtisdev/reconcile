---
description: Show the document registry and project consistency status
---

# Project Status

Show all registered documents, their validation status, and overall project health.

## What to do

1. **Load state** from `.reconcile/documents.json`, `.reconcile/facts.json`, and the most recent validation run from `.reconcile/validations/`.

2. **Display the dashboard:**

   ```
   Reconcile — Project Status

   📄 Documents (4 registered)
   ┌─────────────────────────────────────────────────────────────┐
   │ market-research.md          v1  ✅ validated    18 claims   │
   │ jtbd-analysis.md            v1  ✅ validated    14 claims   │
   │ pitch-deck.md               v2  🔧 corrected   12 claims   │
   │ prd-draft.md                v1  🔵 registered    9 claims   │
   └─────────────────────────────────────────────────────────────┘

   📊 Canonical Facts: 14 facts across 5 categories (medtech schema)

   🔍 Last Validation: Feb 12, 2026
      Compared: pitch-deck.md ↔ market-research.md
      Result: 2 contradictions found → corrected

   ⚠️  prd-draft.md has not been validated against other documents.

   Commands:
     /reconcile:validate all     — check all document pairs
     /reconcile:validate prd     — validate specific document
     /reconcile:facts            — view canonical facts
     /reconcile:register <file>  — register a new document
   ```

3. **If `.reconcile/` doesn't exist**, show:
   ```
   Reconcile is not initialized in this project.
   Run /reconcile:register <file> to register your first document,
   or /reconcile:facts init to create an empty fact store.
   ```
