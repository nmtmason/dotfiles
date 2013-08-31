#!/usr/bin/env bash

git submodule init
git submodule update

for file in .*; do
  if [ "$file" != "." ] && [ "$file" != ".." ] && [ "$file" != ".git" ] && [ "$file" != ".gitmodules" ]; then
    echo "Copying $file"
    rm -rf "$HOME/$file"
    cp -r "$file" "$HOME/$file"
  fi
done

vim +BundleInstall +qall

echo "Finished."
exit 0

