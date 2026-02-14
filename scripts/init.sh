#!/usr/bin/env bash
set -euo pipefail

SCHEMA="${1:-general}"
VALID_SCHEMAS=("general" "medtech" "saas" "legal" "finance")
RECONCILE_DIR=".reconcile"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Validate schema name
valid=false
for s in "${VALID_SCHEMAS[@]}"; do
  if [[ "$s" == "$SCHEMA" ]]; then
    valid=true
    break
  fi
done

if [[ "$valid" == "false" ]]; then
  echo "Error: Unknown schema '$SCHEMA'"
  echo "Valid schemas: ${VALID_SCHEMAS[*]}"
  exit 1
fi

# Warn before overwriting
if [[ -d "$RECONCILE_DIR" ]]; then
  echo "Warning: $RECONCILE_DIR already exists."
  read -r -p "Overwrite? This will reset all facts, documents, and validations. [y/N] " confirm
  if [[ "$confirm" != [yY] ]]; then
    echo "Aborted."
    exit 0
  fi
  rm -rf "$RECONCILE_DIR"
fi

# Create directory structure
mkdir -p "$RECONCILE_DIR/validations"

# Create empty state files
cat > "$RECONCILE_DIR/facts.json" << EOF
{
  "schema": "$SCHEMA",
  "facts": {},
  "annotations": []
}
EOF

cat > "$RECONCILE_DIR/documents.json" << 'EOF'
{
  "documents": []
}
EOF

cat > "$RECONCILE_DIR/conclusions.json" << 'EOF'
{
  "conclusions": []
}
EOF

cat > "$RECONCILE_DIR/config.json" << EOF
{
  "schema": "$SCHEMA",
  "created": "$TIMESTAMP"
}
EOF

echo "Initialized $RECONCILE_DIR with '$SCHEMA' schema."
echo ""
echo "Next steps:"
echo "  /reconcile:register <file>  — register your first document"
echo "  /reconcile:facts            — view the canonical facts store"
