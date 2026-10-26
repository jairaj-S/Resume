#!/bin/sh
# Usage: ./new.sh <name>   Copies the SOT resume into Sandbox/<name>/<name>.tex
set -e
cd "$(dirname "$0")"
[ -n "$1" ] || { echo "Usage: ./new.sh <name>"; exit 1; }
[ ! -e "Sandbox/$1" ] || { echo "Sandbox/$1 already exists"; exit 1; }
mkdir "Sandbox/$1"
cp SOT/Jairaj_Sharma_resume.tex "Sandbox/$1/$1.tex"
echo "Created Sandbox/$1/$1.tex"
