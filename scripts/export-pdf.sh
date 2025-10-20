#!/usr/bin/env bash
# Generate combined PDF manuals (English & Bulgarian) using pandoc.
# Requirements: pandoc, a LaTeX engine (e.g. xelatex) for better Unicode output.
# Usage: ./scripts/export-pdf.sh [--no-root]
#   --no-root : exclude root README/LICENSE/CONTRIBUTING/CODE_OF_CONDUCT from combined PDFs
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$ROOT_DIR/export/pdf"
INCLUDE_ROOT=true
if [[ "${1:-}" == "--no-root" ]]; then
  INCLUDE_ROOT=false
fi
mkdir -p "$OUT_DIR"

command -v pandoc >/dev/null 2>&1 || { echo "Error: pandoc not found in PATH" >&2; exit 1; }

# Ordered files per README index
EN_DOCS=(
  docs/en/overview.md
  docs/en/prerequisites.md
  docs/en/version-matrix.md
  docs/en/install-ubuntu.md
  docs/en/install-rhel.md
  docs/en/configuration.md
  docs/en/language-packs.md
  docs/en/security-hardening.md
  docs/en/publishing-campus-network.md
  docs/en/maintenance-upgrades.md
  docs/en/backup-restore.md
  docs/en/troubleshooting.md
  docs/en/appendix-checklists.md
  docs/en/release-notes-3.5.md
)
BG_DOCS=(
  docs/bg/overview.md
  docs/bg/prerequisites.md
  docs/bg/version-matrix.md
  docs/bg/install-ubuntu.md
  docs/bg/install-rhel.md
  docs/bg/configuration.md
  docs/bg/language-packs.md
  docs/bg/security-hardening.md
  docs/bg/publishing-campus-network.md
  docs/bg/maintenance-upgrades.md
  docs/bg/backup-restore.md
  docs/bg/troubleshooting.md
  docs/bg/appendix-checklists.md
  docs/bg/release-notes-3.5.md
)

# Root bilingual docs (optional)
ROOT_EN_BG=( README.md LICENSE CONTRIBUTING.md CODE_OF_CONDUCT.md )

build_pdf() {
  local lang="$1"; shift
  local files=("$@")
  local tmp_input_list=( )
  if $INCLUDE_ROOT; then
    # Prepend root docs only once per language (README contains both languages)
    tmp_input_list+=( README.md LICENSE CONTRIBUTING.md CODE_OF_CONDUCT.md )
  fi
  tmp_input_list+=( "${files[@]}" )
  local output="$OUT_DIR/ojs-playbook-${lang}.pdf"
  echo "[+] Building $output" >&2
  pandoc \
    -V geometry:margin=1in \
    -V toc=true \
    -V lang=${lang} \
    -V mainfont="DejaVu Serif" \
    -V monofont="DejaVu Sans Mono" \
    --pdf-engine=xelatex \
    -o "$output" \
    "${tmp_input_list[@]}"
}

build_pdf en "${EN_DOCS[@]}"
build_pdf bg "${BG_DOCS[@]}"

echo "PDFs written to $OUT_DIR" >&2
