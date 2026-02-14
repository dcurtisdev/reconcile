# Canonical Facts JSON Format

Facts are stored in `.reconcile/facts.json`.

## Structure

```json
{
  "schema": "general | medtech | saas | legal | finance",
  "facts": {
    "<category>": {
      "<field>": {
        "value": "The specific fact value",
        "source": "Citation or origin",
        "source_document": "Which file established this fact",
        "added_at": "ISO 8601 timestamp"
      }
    }
  },
  "annotations": [
    {
      "category": "category",
      "field": "field",
      "note": "Explanatory note (e.g., two sources disagree)",
      "added_at": "ISO 8601 timestamp"
    }
  ]
}
```

## Rules

- First document to establish a fact owns it
- Subsequent documents can ADD new facts but should not overwrite existing ones
- Conflicts are flagged during registration and resolved by the user
- Only user-approved resolutions update the registry
