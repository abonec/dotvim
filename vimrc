call pathogen#infect()
syntax on
filetype plugin indent on
"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible
"allow backspacing over everything in insert mode
set backspace=indent,eol,start
"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

" call add(g:pathogen_disabled, 'vim-commentary')
