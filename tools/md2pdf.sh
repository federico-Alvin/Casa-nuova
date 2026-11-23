#!/usr/bin/env bash
# Uso: tools/md2pdf.sh report/AAAA-MM-GG_report-NN.md  -> crea il PDF accanto al .md
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
MD="$(realpath "$1")"; PDF="${MD%.md}.pdf"
TMP="$(mktemp -d)"; HTML="$TMP/$(basename "${MD%.md}").html"
pandoc "$MD" -f gfm -s --embed-resources --css "$DIR/report.css" --metadata pagetitle="$(basename "${MD%.md}")" -o "$HTML"
node "$DIR/topdf.js" "$HTML" "$PDF"
rm -rf "$TMP"; echo "PDF creato: $PDF"
