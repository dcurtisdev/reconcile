---
description: Compare registered documents for contradictions
---

# Validate Documents

Compare registered documents for factual, terminological, and analytical contradictions.

## What to do

1. **Load the document registry** from `.reconcile/documents.json`. If it doesn't exist or has fewer than 2 documents, tell the user they need at least 2 registered documents.

2. **Determine which documents to compare.** $ARGUMENTS may specify:
   - Specific files: "market-research.md against pitch-deck.md"
   - "all" — compare all pairs
   - Empty — show registered documents and ask which to compare

3. **For each document pair, delegate to the validator agent** with:
   - The key claims from both documents (from the registry)
   - The full file contents (read from disk)
   - The canonical facts from `.reconcile/facts.json`
   - The prior conclusions from `.reconcile/conclusions.json`

4. **Collect and present results.** For each contradiction found:

   ```
   🔴 C001 — FACTUAL (HIGH)
   market-research.md [§2 Market Assessment, ¶1]:
     "The global FMS market is valued at $4.2B (Grand View Research 2024)"
   pitch-deck.md [Slide 3]:
     "a $5.8B market opportunity"
   Canonical fact: TAM $4.2B (Grand View Research 2024)
   → Recommended: Fix pitch-deck.md to use $4.2B

   🟡 C002 — TERMINOLOGICAL (MEDIUM)
   market-research.md: "fecal management system (FMS)"
   pitch-deck.md: "bowel management device"
   Canonical term: fecal management system (FMS)
   → Recommended: Fix pitch-deck.md terminology

   🟠 C003 — ANALYTICAL (Variable)
   market-research.md [§3]: "Competitor landscape is fragmented"
   jtbd-analysis.md [§5]: "Market dominated by single incumbent"
   Assessment: TRUE CONFLICT
   → Recommended: Reconcile market structure characterization
   ```

   If no contradictions: "✅ No contradictions found between [documents]. All N compared claims are consistent."

5. **Save the validation run** to `.reconcile/validations/val-<NNN>.json` with full contradiction details, timestamps, and which documents were compared.

6. **Update document statuses** in `.reconcile/documents.json`:
   - Documents with contradictions: `"status": "has_contradictions"`
   - Documents that passed: `"status": "validated"`

7. **If contradictions found, offer to fix:**
   "Found N contradictions. Use /reconcile:fix <filename> to generate corrected versions."
