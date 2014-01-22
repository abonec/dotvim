Install dependencies
====================

    sudo apt-get build-dep vim-gnome

Install ack and ctags
=====================

    sudo apt-get install ack-grep ctags

Get vim
=======

    git clone https://github.com/b4winckler/vim.git

Configure before make:

    ./configure --with-features=huge  --disable-largefile \
                --enable-pythoninterp --enable-rubyinterp   \
                --enable-gui=gtk2

Install plugins
===============

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim -c "BundleInstall"

and restart vim


Better tags support for ruby
----------------------------

    gem install rdoc-tags
    rdoc -f tags -a .

__(-a for all methods includes private)__

Git config (e.g. for tags)
--------------------------

    git config --global core.excludesfile ~/.gitignore
    echo "TAGS" >> ~/.gitignore

    git config --global web.browser chromium-browser
