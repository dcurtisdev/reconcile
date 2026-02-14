---
description: Register a document in the Reconcile registry and extract canonical facts
---

# Register Document

Register one or more documents in the Reconcile consistency registry. This extracts key claims from each document, stores them in the document registry, and optionally saves cross-cutting facts to the canonical fact store.

## What to do

1. **Identify the target file(s).** $ARGUMENTS should contain a file path, glob pattern, or description. If empty, ask the user which file(s) to register. Resolve to absolute paths and confirm the files exist.

2. **Initialize `.reconcile/` if it doesn't exist.** Create the directory and empty JSON files:
   - `facts.json`: `{ "schema": "general", "facts": {}, "annotations": [] }`
   - `documents.json`: `{ "documents": [] }`
   - `conclusions.json`: `{ "conclusions": [] }`
   - `config.json`: `{ "schema": "general", "created": "<ISO timestamp>" }`

   If a schema template name is provided (e.g., "medtech", "saas"), set it in config.json and load the corresponding schema from the plugin's `schemas/` directory.

3. **Read the document content.** Read the full file.

4. **Delegate to the claim-extractor agent** to extract:
   - 10-20 key claims (specific, verifiable facts with document locations)
   - A 2-3 sentence summary
   - A module category (market_research, competitive_analysis, jtbd_analysis, product_requirements, pitch_deck, regulatory_strategy, financial_model, technical_spec, marketing_brief, or ask user)

5. **Delegate to the fact-extractor agent** to extract canonical facts matching the project's schema. Compare against existing facts in `.reconcile/facts.json` and flag any conflicts.

6. **Present results to user:**
   - Show the document summary and claim count
   - Show extracted canonical facts grouped by category
   - If conflicts with existing facts, show them clearly:
     ```
     ⚠️ CONFLICT: Market size
     Existing: TAM $4.2B (Grand View Research 2024)
     This document: TAM $5.8B (Allied Market Research 2024)
     → Which should be canonical? [Keep existing / Use new / Keep both with note]
     ```
   - Ask for confirmation before saving

7. **On confirmation:**
   - Append the document entry to `.reconcile/documents.json`
   - Merge confirmed facts into `.reconcile/facts.json`
   - If the document contains analytical conclusions, extract 3-6 and append to `.reconcile/conclusions.json`

8. **If the project has 2+ registered documents**, offer validation:
   "You now have N registered documents. Want me to check this new document for consistency against the others? (/reconcile:validate)"
