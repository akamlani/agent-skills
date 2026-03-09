#!/usr/bin/env bash
set -euo pipefail

component_dir="$1"
claude_dir="$2"
total_linked=0
total_source=0

print_summary_header() {
  echo
  echo "Link Summary"
  printf '%-10s | %8s | %8s\n' "Type" "Linked" "Source"
  printf '%-10s-+-%8s-+-%8s\n' "----------" "--------" "--------"
}

print_summary_row() {
  local name="$1"
  local linked="$2"
  local source="$3"
  printf '%-10s | %8s | %8s\n' "$name" "$linked" "$source"
}

print_summary_footer() {
  local linked_total="$1"
  local source_total="$2"
  printf '%-10s-+-%8s-+-%8s\n' "----------" "--------" "--------"
  print_summary_row "total" "$linked_total" "$source_total"
  echo
}

print_summary_header

for kind in commands skills; do
  src="${component_dir}/${kind}"
  dst="${claude_dir}/${kind}"

  if [[ ! -d "$src" ]]; then
    echo "ERROR: Missing ${src}"
    exit 1
  fi

  rm -rf -- "$dst"
  mkdir -p "$dst"

  src_abs="$(cd "$src" && pwd)"

  shopt -s nullglob dotglob
  for entry in "$src_abs"/*; do
    ln -sfn "$entry" "$dst/$(basename "$entry")"
  done
  shopt -u nullglob dotglob

  source_count=$(find "$src_abs" -mindepth 1 -type f \( -name '*.md' -o -name '*.mdc' \) | wc -l | tr -d ' ')
  linked_count=$(find -L "$dst" -mindepth 1 -type f \( -name '*.md' -o -name '*.mdc' \) | wc -l | tr -d ' ')
  total_linked=$((total_linked + linked_count))
  total_source=$((total_source + source_count))

  print_summary_row "$kind" "$linked_count" "$source_count"
done

print_summary_footer "$total_linked" "$total_source"
