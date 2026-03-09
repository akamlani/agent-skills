#!/usr/bin/env bash
set -euo pipefail

component_dir="$1"
claude_dir="$2"

print_header() {
  echo
  echo "Verify Agents"
  printf '%-10s | %-7s | %s\n' "Type" "Status" "Notes"
  printf '%-10s-+-%-7s-+-%s\n' "----------" "-------" "------------------------------"
}

print_row() {
  local kind="$1"
  local status="$2"
  local notes="$3"
  printf '%-10s | %-7s | %s\n' "$kind" "$status" "$notes"
}

list_tree() {
  local root="$1"
  find -L "$root" -mindepth 1 \( -type d -o -type f \) \
    | sed "s#^${root}/##" \
    | sort
}

verify_kind() {
  local kind="$1"
  local src="${component_dir}/${kind}"
  local dst="${claude_dir}/${kind}"

  if [[ ! -d "$src" ]]; then
    print_row "$kind" "FAIL" "missing source: $src"
    return 1
  fi

  if [[ ! -e "$dst" ]]; then
    print_row "$kind" "FAIL" "missing destination: $dst"
    return 1
  fi

  local src_list
  local dst_list
  src_list="$(list_tree "$src")"
  dst_list="$(list_tree "$dst")"

  if [[ "$src_list" == "$dst_list" ]]; then
    local item_count
    item_count="$(printf '%s\n' "$src_list" | sed '/^$/d' | wc -l | tr -d ' ')"
    print_row "$kind" "PASS" "tree matches (${item_count} entries)"
    return 0
  fi

  print_row "$kind" "FAIL" "tree drift detected"
  echo "--- Missing in destination (${kind}) ---"
  comm -23 <(printf '%s\n' "$src_list") <(printf '%s\n' "$dst_list") | sed 's/^/  - /' || true
  echo "--- Extra in destination (${kind}) ---"
  comm -13 <(printf '%s\n' "$src_list") <(printf '%s\n' "$dst_list") | sed 's/^/  + /' || true
  return 1
}

print_header

status=0
verify_kind commands || status=1
verify_kind skills || status=1

echo
exit "$status"
