#!/bin/sh

# Get the directory where this script is located
DFDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $HOME

# Install Oh-My-Zsh (http://ohmyz.sh)
echo "Installing Oh-my-zsh..."
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

echo -n "Creating symlinks to dotfiles in home directory"

for file in $(ls $DFDIR); do
  if [ $file != README.md ] && [ $file != setup.sh ]; then
    ln -b -s $DFDIR/$file .$file
    echo -n "."
  fi
done

echo " done!"

cd $DFDIR
