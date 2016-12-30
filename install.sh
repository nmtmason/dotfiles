#!/usr/bin/env bash

for file in .*; do
  if [ "$file" != "." ] && [ "$file" != ".." ] && [ "$file" != ".git" ]; then
    echo "Copying $file"
    rm -rf "$HOME/$file"
    cp -r "$file" "$HOME/$file"
  fi
done

mkdir -p "$HOME/.vim/bundle"
git clone https://github.com/gmarik/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"

vim +BundleInstall +qall

echo "Finished."
exit 0
