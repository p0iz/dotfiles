#!/bin/sh

# Get the directory where this script is located
DFDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $HOME
echo -n "Creating symlinks to dotfiles in home directory"

for file in $(ls $DFDIR); do
  if [ $file != README.md ]; then
    ln -b -s $DFDIR/$file .$file
    echo -n "."
  fi
done

echo " done!"

popd
