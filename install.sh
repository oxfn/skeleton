#!/bin/sh

for item in .gitconfig .bashrc .bashrc.local .bash_profile .profile .vimrc
do
    cp -i $item ~/
done

#
# Vim plugins
#

# Ask for Vim plugins installation
echo "The following plugins will be installed:"
echo " - emmet"
echo " - bufexplorer"
echo " - nerdtree"
echo " - nerdcommenter"
read -p "Proceed? (y/N) "
if [[ $REPLY =~ ^[yY]$ ]]
then
    VIM_INSTALL_PATH=~/.vim
    VIM_TMP_PATH=/tmp/vim-plugins
    VIM_PLUGIN_DIRS='autoload doc plugin'

    GIT_CLONE='git clone -q --depth=1'

    mkdir -p $VIM_TMP_PATH
    mkdir -p $VIM_INSTALL_PATH

    # Emmet (ex-zen-coding)
    PLUGIN=emmet
    if [ ! -e $VIM_INSTALL_PATH/plugin/emmet.vim ]
    then
        URL=https://github.com/mattn/emmet-vim
        PLUGIN_PATH=$VIM_TMP_PATH/$PLUGIN
        ARCHIVE_NAME=emmet-vim.zip
        echo Installing Vim plugin: $PLUGIN
        $GIT_CLONE $URL $PLUGIN_PATH > /dev/null
        pushd $PLUGIN_PATH > /dev/null
        cp -R */ $VIM_INSTALL_PATH > /dev/null
        popd > /dev/null
    else
        echo "Plugin $PLUGIN already installed (skipping)"
    fi

    # BufExplorer
    PLUGIN=bufexplorer
    if [ ! -e $VIM_INSTALL_PATH/plugin/bufexplorer.vim ]
    then
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
    else
        echo "Plugin $PLUGIN already installed (skipping)"
    fi

    # NERDTree
    PLUGIN=nerdtree
    if [ ! -e $VIM_INSTALL_PATH/plugin/NERD_tree.vim ]
    then
        URL=https://github.com/scrooloose/nerdtree
        PLUGIN_PATH=$VIM_TMP_PATH/$PLUGIN
        echo Installing Vim plugin: $PLUGIN
        $GIT_CLONE $URL $PLUGIN_PATH > /dev/null
        pushd $PLUGIN_PATH > /dev/null
        cp -R */ $VIM_INSTALL_PATH > /dev/null
        popd > /dev/null
    else
        echo "Plugin $PLUGIN already installed (skipping)"
    fi

    # NERDCommenter
    PLUGIN=nerdcommenter
    if [ ! -e $VIM_INSTALL_PATH/plugin/NERD_commenter.vim ]
    then
        URL=https://github.com/scrooloose/nerdcommenter
        PLUGIN_PATH=$VIM_TMP_PATH/$PLUGIN
        echo Installing Vim plugin: $PLUGIN
        $GIT_CLONE $URL $PLUGIN_PATH > /dev/null
        pushd $PLUGIN_PATH > /dev/null
        cp -R */ $VIM_INSTALL_PATH > /dev/null
        popd > /dev/null
    else
        echo "Plugin $PLUGIN already installed (skipping)"
    fi

    rm -rf $VIM_TMP_PATH
fi
