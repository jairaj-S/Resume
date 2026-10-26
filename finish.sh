#!/bin/sh
# Usage: ./finish.sh <name>   Compiles Sandbox/<name> and moves it to Finished Resumes/<name>
set -e
cd "$(dirname "$0")"
[ -n "$1" ] || { echo "Usage: ./finish.sh <name>"; exit 1; }
[ -f "Sandbox/$1/$1.tex" ] || { echo "Sandbox/$1/$1.tex not found"; exit 1; }
[ ! -e "Finished Resumes/$1" ] || { echo "Finished Resumes/$1 already exists"; exit 1; }
(cd "Sandbox/$1" && latexmk -pdf -interaction=nonstopmode -quiet "$1.tex" && latexmk -c "$1.tex" && rm -f "$1.synctex.gz")
mv "Sandbox/$1" "Finished Resumes/$1"
echo "Finished: Finished Resumes/$1/$1.pdf"
