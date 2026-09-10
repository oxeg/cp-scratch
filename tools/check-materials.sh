#!/usr/bin/env bash
# Structural checks for the course materials.
# Usage: tools/check-materials.sh [all|<course>|<course>/<lesson-dir>|<path-prefix>]
#   e.g. all | space-shooter | space-shooter/lesson-1-fly-the-ship
set -uo pipefail

# Run from the repo root whatever directory the caller is in.
cd "$(dirname "$0")/.." || exit 1

fail=0
err() { echo "FAIL: $*"; fail=1; }
ok()  { echo "ok:   $*"; }

target="${1:-all}"

all_files=(
  "README.md"
  "space-shooter/README.md"
  "space-shooter/reference/block-cheat-sheet.md"
  "space-shooter/reference/extra-challenges.md"
  "space-shooter/lesson-1-fly-the-ship/instructor-plan.md"
  "space-shooter/lesson-1-fly-the-ship/step-cards.md"
  "space-shooter/lesson-2-shoot-and-survive/instructor-plan.md"
  "space-shooter/lesson-2-shoot-and-survive/step-cards.md"
  "space-shooter/lesson-3-enemies-and-polish/instructor-plan.md"
  "space-shooter/lesson-3-enemies-and-polish/step-cards.md"
)

selected=()
for f in "${all_files[@]}"; do
  case "$target" in
    all) selected+=("$f") ;;
    *)   [[ "$f" == "$target"* ]] && selected+=("$f") ;;
  esac
done

if [ ${#selected[@]} -eq 0 ]; then
  echo "No files match target '$target'"; exit 1
fi

check_placeholders() {
  if grep -nE 'TODO|TBD|FIXME|XXX' "$1" >/dev/null; then
    err "$1 contains a placeholder marker"
  else
    ok "$1 has no placeholders"
  fi
}

check_timing() {
  # Timing rows look like: | 0:00-0:10 | Activity |
  local file="$1"
  awk -F'|' '
    $2 ~ /^ *[0-9]+:[0-9][0-9]-[0-9]+:[0-9][0-9] *$/ {
      gsub(/ /, "", $2)
      split($2, r, "-")
      split(r[1], a, ":"); split(r[2], b, ":")
      start = a[1]*60 + a[2]; end = b[1]*60 + b[2]
      if (n == 0 && start != 0) { print "first row does not start at 0:00"; bad=1 }
      if (n > 0 && start != prev) { print "gap or overlap at " $2; bad=1 }
      prev = end; n++
    }
    END {
      if (n == 0) { print "no timing rows found"; bad=1 }
      else if (prev != 90) { print "timing ends at " prev " minutes, expected 90"; bad=1 }
      exit bad ? 1 : 0
    }
  ' "$file" && ok "$file timing adds up to 90 minutes" || err "$file timing table is wrong"
}

check_milestones() {
  local file="$1"
  local m c s
  m=$(grep -c '^## Milestone' "$file")
  c=$(grep -c '^\*\*Check it works\*\*' "$file")
  s=$(grep -c '^\*\*Stuck?\*\*' "$file")
  if [ "$m" -ne 4 ]; then
    err "$file has $m '## Milestone' headings, expected 4"
  elif [ "$c" -ne "$m" ] || [ "$s" -ne "$m" ]; then
    err "$file has $m milestones but $c 'Check it works' and $s 'Stuck?' boxes"
  else
    ok "$file has 4 milestones, each with both boxes"
  fi
}

# Advisory only. Prints the number of numbered steps under each '## Milestone'
# heading so the next person editing these can see when a milestone has grown.
# This NEVER fails and NEVER touches the exit code - the checks above are the
# only things that gate.
advise_step_counts() {
  local file="$1" counts
  counts=$(awk '
    /^## Milestone/ { if (seen) printf("%d ", n); seen=1; n=0; next }
    /^## /          { if (seen) printf("%d ", n); seen=0; n=0; next }
    /^[0-9]+\. /    { if (seen) n++ }
    END             { if (seen) printf("%d ", n) }
  ' "$file")
  echo "note: $file steps per milestone: ${counts% }"
}

for f in "${selected[@]}"; do
  if [ ! -f "$f" ]; then err "$f is missing"; continue; fi
  check_placeholders "$f"
  case "$f" in
    *instructor-plan.md) check_timing "$f" ;;
    *step-cards.md)      check_milestones "$f"; advise_step_counts "$f" ;;
  esac
done

if [ "$fail" -eq 0 ]; then echo "ALL CHECKS PASSED"; else echo "CHECKS FAILED"; fi
exit "$fail"
