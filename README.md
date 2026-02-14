# Reconcile

**Stop your AI-generated reports from contradicting each other.**

Reconcile is a Claude Code/Cowork plugin that maintains factual
consistency across all your generated documents. It stores canonical
facts, tracks document claims, detects contradictions, and surgically
corrects files — all on disk, all git-versionable.

## Install

### Claude Code
```
/plugin marketplace add dcurtisdev/reconcile
/plugin install reconcile@reconcile
```

### Claude Cowork
1. Open **Settings** → **Plugins**
2. Click **Add Marketplace**
3. Enter: `dcurtisdev/reconcile`
4. Install **reconcile**

## Usage

### Register a document
```
/reconcile:register docs/market-research.md
```
Extracts key claims and canonical facts. Stores everything in `.reconcile/`.

### Check consistency
```
/reconcile:validate
/reconcile:validate market-research.md against pitch-deck.md
```

### Fix a document
```
/reconcile:fix pitch-deck.md
```
Shows exact changes. Writes the corrected file on confirmation.

### View facts
```
/reconcile:facts
```

### Project status
```
/reconcile:status
```

## How It Works

Three layers:

1. **Prevention** — Canonical facts in `.reconcile/facts.json` are read
   before generating new documents (via the consistency skill)
2. **Detection** — Validator compares key claims across documents and
   against canonical facts
3. **Correction** — Patch agent applies surgical fixes, changing only
   contradicted passages

## Domain Templates

```
/reconcile:facts init medtech
/reconcile:facts init saas
/reconcile:facts init legal
/reconcile:facts init finance
```

## What Gets Stored

```
.reconcile/
├── facts.json          # Canonical facts registry
├── documents.json      # Document metadata + key claims
├── conclusions.json    # Analytical conclusions
├── config.json         # Schema and settings
└── validations/        # Validation run history
```

Everything is JSON. Inspect it, version it, share it with your team.

## License

AGPL-3.0 — see [LICENSE](LICENSE) for details.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines and our Contributor License Agreement.
