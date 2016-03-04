#!/bin/bash

SKELETON_FILE="$HOME/.skeleton"
TARGETS="\
    .bash_profile
    .bashrc
    .bashrc.local
    .gitconfig
    .profile
    .vim/
    .vimrc"
VUNDLE_REPO="https://github.com/VundleVim/Vundle.vim.git"
VUNDLE_PATH="$HOME/.vim/bundle/Vundle.vim"

# Check if skeleton is already installed
UPGRADE=0
FORCE_DOTFILES=0
FORCE_VIM_PLUGINS=0
if [[ -f $SKELETON_FILE ]]
then
    UPGRADE=1
fi

# Detect git
HAS_GIT=0
git_path=$(which git 2>&1)
if [[ $? -eq 0 ]]
then
    HAS_GIT=1
fi

# Install all items
for item in $TARGETS
do
    echo Copying item to $HOME
    cp -Ri $item $HOME
done

# Install Vundle
if [[ $HAS_GIT -eq 1 ]]
then
    mkdir ~/.vim/bundle
    git clone $VUNDLE_REPO $VUNDLE_PATH
    vim -c VundleInstall -c qa
else
    echo git was not found. Please install Vundle bundle manually
fi

touch $SKELETON_FILE

