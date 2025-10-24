#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "$0")/.." && pwd)
en_dir="$repo_root/docs/en"
bg_dir="$repo_root/docs/bg"
report_dir="$repo_root/reports/locale-diffs"

mkdir -p "$report_dir/diffs"

missing_in_bg=()
missing_in_en=()
diff_files=()

while IFS= read -r -d '' file; do
  rel=${file#"$en_dir"/}
  bgfile="$bg_dir/$rel"
  if [[ ! -f "$bgfile" ]]; then
    missing_in_bg+=("$rel")
  else
    if ! diff --brief --strip-trailing-cr "$file" "$bgfile" >/dev/null 2>&1; then
      diff_files+=("$rel")
      out="$report_dir/diffs/${rel//\//_}.diff"
      mkdir -p "$(dirname "$out")"
      diff -u --strip-trailing-cr "$file" "$bgfile" > "$out" || true
    fi
  fi
done < <(find "$en_dir" -type f -name '*.md' -print0)

while IFS= read -r -d '' file; do
  rel=${file#"$bg_dir"/}
  enfile="$en_dir/$rel"
  if [[ ! -f "$enfile" ]]; then
    missing_in_en+=("$rel")
  fi
done < <(find "$bg_dir" -type f -name '*.md' -print0)

summary="$report_dir/summary.txt"
{
  echo "Locale diff report: $report_dir"
  echo
  en_count=$(find "$en_dir" -type f -name '*.md' | wc -l)
  bg_count=$(find "$bg_dir" -type f -name '*.md' | wc -l)
  echo "English files scanned: $en_count"
  echo "Bulgarian files scanned: $bg_count"
  echo
  if (( ${#missing_in_bg[@]} )); then
    echo "Files missing in bg (${#missing_in_bg[@]}):"
    printf '%s\n' "${missing_in_bg[@]}"
    echo
  fi
  if (( ${#missing_in_en[@]} )); then
    echo "Files missing in en (${#missing_in_en[@]}):"
    printf '%s\n' "${missing_in_en[@]}"
    echo
  fi
  if (( ${#diff_files[@]} )); then
    echo "Files that differ (${#diff_files[@]}). Unified diffs saved to $report_dir/diffs/"
    for f in "${diff_files[@]}"; do
      echo "- $f -> diffs/$(echo "$f" | sed 's:/:_:g').diff"
    done
  else
    echo "No differences detected in common files."
  fi
} | tee "$summary"

echo
echo "Report written to: $summary"
echo "Per-file diffs (if any) are under: $report_dir/diffs/"

exit 0
