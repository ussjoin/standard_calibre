#!/bin/bash

# Requires `gh auth login` even for public repos

mkdir -p books
mkdir -p tooling

gh repo list standardebooks --limit 4000 | while read -r repo _; do
  shortrepo=$(echo $repo | cut -d'/' -f2)
  if [ "$shortrepo" = "tools" ] || [ "$shortrepo" = "web" ] || [ "$shortrepo" = "manual" ] || [ "$shortrepo" = "standard-blackletter" ]
  then
    if test -d "tooling/$shortrepo"; then
      bash -c "cd tooling/$shortrepo && git pull"
    else
      gh repo clone "$repo" "tooling/$shortrepo"
    fi
  else
    if test -d "books/$shortrepo"; then
      bash -c "cd books/$shortrepo && git pull"
    else
      gh repo clone "$repo" "books/$shortrepo"
    fi
  fi
done

