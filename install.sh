#!/usr/bin/env bash

for file in .*; do
  if [ "$file" != "." ] && [ "$file" != ".." ] && [ "$file" != ".git" ]; then
    echo "Copying $file"
    rm -rf "$HOME/$file"
    cp -r "$file" "$HOME/$file"
  fi
done

vim +BundleInstall +qall

echo "Finished."
exit 0

