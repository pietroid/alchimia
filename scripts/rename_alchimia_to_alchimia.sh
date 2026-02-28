#!/bin/bash
# rename_alchimia_to_alchimia.sh
# Replaces every occurrence of "alchimia" → "alchimia" (case-preserved)
# in file contents and file names across the project.
#
# Usage:
#   ./scripts/rename_alchimia_to_alchimia.sh            # apply changes
#   ./scripts/rename_alchimia_to_alchimia.sh --dry-run  # preview only

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

EXCLUDES=(".git" ".idea" "build" ".dart_tool" "node_modules")

# Build prune args for find
PRUNE_ARGS=()
for d in "${EXCLUDES[@]}"; do
  PRUNE_ARGS+=(-path "*/$d" -prune -o)
done

apply_sed() {
  local file="$1"
  if $DRY_RUN; then
    grep -n "alchimia\|ALCHIMIA\|Alchimia" "$file" | while IFS= read -r line; do
      echo "  [content] $file: $line"
    done
  else
    sed -i '' \
      -e 's/ALCHIMIA/ALCHIMIA/g' \
      -e 's/Alchimia/Alchimia/g' \
      -e 's/alchimia/alchimia/g' \
      "$file"
  fi
}

rename_path() {
  local old="$1"
  local new
  new=$(echo "$old" \
    | sed -e 's/ALCHIMIA/ALCHIMIA/g' \
          -e 's/Alchimia/Alchimia/g' \
          -e 's/alchimia/alchimia/g')
  if [[ "$old" != "$new" ]]; then
    if $DRY_RUN; then
      echo "  [rename] $old → $new"
    else
      mv "$old" "$new"
    fi
  fi
}

echo "=== Replace in file contents ==="
while IFS= read -r -d '' file; do
  # Skip binary files
  if file "$file" | grep -qE 'text|empty'; then
    if grep -qiE "alchimia" "$file" 2>/dev/null; then
      apply_sed "$file"
      $DRY_RUN || echo "  [updated] $file"
    fi
  fi
done < <(find "$ROOT_DIR" "${PRUNE_ARGS[@]}" -type f -print0)

echo ""
echo "=== Rename files and directories ==="
# Process deepest paths first (reverse sort) to avoid parent rename breaking children
while IFS= read -r path; do
  rename_path "$path"
done < <(find "$ROOT_DIR" "${PRUNE_ARGS[@]}" \( -type f -o -type d \) -iname "*alchimia*" -print | sort -r)

echo ""
$DRY_RUN && echo "Dry-run complete. No files were changed." || echo "Done."
