#!/bin/sh
cp .gitconfig ~/
cp .bashrc ~/
cp .bash_profile ~/
cp .profile ~/
cp .vimrc ~/

### TODO: ask for vim plugins installation

#
# Vim plugins
#
VIM_INSTALL_PATH=~/.vim
VIM_TMP_PATH=/tmp/vim-plugins
VIM_PLUGIN_DIRS='autoload doc plugin'

GIT_CLONE='git clone -q --depth=1'

mkdir -p $VIM_TMP_PATH
mkdir -p $VIM_INSTALL_PATH

# Emmet (ex-zen-coding)
PLUGIN=emmet
URL=https://github.com/mattn/emmet-vim
PLUGIN_PATH=$VIM_TMP_PATH/$PLUGIN
ARCHIVE_NAME=emmet-vim.zip
echo Installing Vim plugin: $PLUGIN
$GIT_CLONE $URL $PLUGIN_PATH > /dev/null
pushd $PLUGIN_PATH > /dev/null
cp -R */ $VIM_INSTALL_PATH > /dev/null
popd > /dev/null

# BufExplorer
PLUGIN=bufexplorer
URL=https://github.com/jlanzarotta/bufexplorer
PLUGIN_PATH=$VIM_TMP_PATH/$PLUGIN
echo Installing Vim plugin: $PLUGIN
$GIT_CLONE $URL $PLUGIN_PATH > /dev/null
pushd $PLUGIN_PATH > /dev/null
if [ ! -d $PLUGIN_INSTALL_PATH ]
then
    mkdir -p $PLUGIN_INSTALL_PATH > /dev/null
fi
for dir in $VIM_PLUGIN_DIRS
do
    if [ -d $dir ]
    then
        cp -R -f $dir $VIM_INSTALL_PATH > /dev/null
    fi
done
popd > /dev/null

# NERDTree
PLUGIN=nerdtree
URL=https://github.com/scrooloose/nerdtree
PLUGIN_PATH=$VIM_TMP_PATH/$PLUGIN
echo Installing Vim plugin: $PLUGIN
$GIT_CLONE $URL $PLUGIN_PATH > /dev/null
pushd $PLUGIN_PATH > /dev/null
cp -R */ $VIM_INSTALL_PATH > /dev/null
popd > /dev/null

# NERDCommanter
PLUGIN=nerdcommenter
URL=https://github.com/scrooloose/nerdcommenter
PLUGIN_PATH=$VIM_TMP_PATH/$PLUGIN
echo Installing Vim plugin: $PLUGIN
$GIT_CLONE $URL $PLUGIN_PATH > /dev/null
pushd $PLUGIN_PATH > /dev/null
cp -R */ $VIM_INSTALL_PATH > /dev/null
popd > /dev/null

rm -rf $VIM_TMP_PATH

