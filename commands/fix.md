---
description: Generate a surgically corrected version of a document
---

# Fix Document

Apply surgical corrections to a document to resolve contradictions found by /reconcile:validate.

## What to do

1. **Identify the target file.** $ARGUMENTS should contain a filename. If empty, show documents with status "has_contradictions" and ask which to fix.

2. **Load the relevant validation run** from `.reconcile/validations/` — find the most recent run involving this document. Show the contradictions that affect this file.

3. **Ask the user which contradictions to fix.** Present each with options:
   - **Accept** — fix this document (use canonical fact or the other document's value)
   - **Reverse** — fix the OTHER document instead
   - **Footnote** — keep both, add an explanatory note
   - **Skip** — leave this contradiction unresolved

4. **For accepted fixes, determine correction strategy:**

   | Contradiction type | Strategy |
   |---|---|
   | Type A (factual) — wrong number, date | Surgical find-and-replace |
   | Type B (terminological) — wrong term | Global find-and-replace throughout file |
   | Type C shallow — wrong conclusion, 1-2 passages | Replace specific passages |
   | Type C deep — conclusion woven throughout | Regenerate affected sections |

5. **Delegate to the patch-agent** with:
   - The full file content (read from disk)
   - The specific contradictions to fix
   - The canonical facts
   - The correction strategy

6. **Show the user the exact changes before applying:**
   ```
   Changes to apply to pitch-deck.md:

   1. Line 42: "$5.8B market opportunity" → "$4.2B market (Grand View Research 2024)"
   2. Line 67: "$5.8B" → "$4.2B"
   3. Line 12: "bowel management device" → "fecal management system (FMS)"
   4. Line 31: "bowel management device" → "fecal management system (FMS)"
   5. Line 55: "bowel management" → "fecal management"

   5 corrections across 5 locations. All other content preserved.
   Apply these changes? [Yes / No / Show diff]
   ```

7. **On confirmation, write the file and update state:**
   - Write corrected content to the file
   - Update `.reconcile/documents.json`: increment version, update status to "corrected", re-extract key claims from the corrected content
   - Update canonical facts if the resolution changed any established facts
   - If contradictions were reversed (fix other document), note which file still needs correction

8. **Run a confirmation validation** — re-validate the corrected document against the others to confirm the fixes are clean. If new contradictions were introduced, warn the user.
