# Contradiction Types

## Type A — Factual (Severity: HIGH)
Different numbers, dates, classifications, or data points for the same claim across documents.

**Detection:** Compare specific numeric values, dates, proper nouns, and classifications. Check against canonical facts registry.

**Examples:**
- Document A: "TAM of $4.2B" vs Document B: "$5.8B market"
- Document A: "Class II" vs Document B: "Class III"
- Document A: "prevalence 9-37%" vs Document B: "affects 30-50%"

**Resolution:** Surgical patch — find and replace the specific incorrect values.

## Type B — Terminological (Severity: MEDIUM)
Different names, labels, or abbreviations for the same concept.

**Detection:** Compare how the same entities, products, roles, and concepts are named. Check against canonical terminology.

**Examples:**
- "fecal management system" vs "bowel containment device"
- "FMS" vs "FMD"
- "ICU nurse" vs "bedside nurse"

**Resolution:** Global find-and-replace of the non-standard term.

## Type C — Analytical (Severity: VARIABLE)
Different conclusions or characterizations drawn from the same evidence.

**Detection:** Compare analytical judgments, characterizations, risk assessments, and recommendations.

**Assessment:** Determine:
- **TRUE CONFLICT** — one must be wrong (same data, contradictory conclusions)
- **LEGITIMATE DIFFERENCE** — different frameworks can validly reach different conclusions

**Resolution:**
- True conflict, shallow (1-2 passages) → Surgical patch
- True conflict, deep (structural) → Section regeneration
- Legitimate difference → Explanatory footnote in both documents
