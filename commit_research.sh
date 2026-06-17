#!/usr/bin/env bash

set -euo pipefail

git add research/

echo "Files staged from research/:"
git diff --cached --name-only --diff-filter=A -- research/

echo
read -r -p "Type your commit message: " commit_message

if [[ -z "${commit_message}" ]]; then
  echo "Commit message cannot be empty."
  exit 1
fi

git commit -m "${commit_message}" && git push
