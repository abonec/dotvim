" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost vimrc source $MYVIMRC
endif
"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible
" show confirm when buffer is not saved
set confirm
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set guioptions-=r
set guioptions-=L
set directory=~/.vim/swap,.

Bundle 'gmarik/vundle'

Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
"extension for fugitive:
Bundle 'gregsexton/gitv' 
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
" Bundle 'greyblake/vim-preview'
Bundle 'vim-scripts/rubycomplete.vim'
Bundle 'vim-scripts/SuperTab-continued.'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/toggle_words.vim'
Bundle 'stjernstrom/vim-ruby-run'
Bundle 'vim-scripts/ZoomWin'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'kana/vim-textobj-user'
Bundle 'bootleq/vim-textobj-rubysymbol'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'edsono/vim-matchit'
Bundle 'wojtekmach/vim-rename'
Bundle 'lmeijvogel/vim-yaml-helper'
Bundle 'godlygeek/tabular'
" Bundle 'astashov/vim-ruby-debugger'
Bundle 'sjl/gundo.vim'
Bundle 'austintaylor/vim-open'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'chrisbra/NrrwRgn'
Bundle 'skalnik/vim-vroom'
Bundle 'benmills/vimux'
Bundle 'kien/ctrlp.vim'
Bundle 'Align'

" Syntax:
Bundle 'elixir-lang/vim-elixir'
Bundle 'pangloss/vim-javascript'
Bundle 'itspriddle/vim-jquery'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bbommarito/vim-slim'

" Colorschemes:
Bundle 'Atom'
Bundle 'Gravity'
Bundle 'gregsexton/Muon'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'
Bundle 'croaker/mustang-vim'

syntax on
filetype plugin indent on
syntax enable

"allow backspacing over everything in insert mode
set backspace=indent,eol,start
"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers

" When you type the first tab hit will complete as much as possible, the second tab hit will provide a list, the third and subsequent tabs will cycle through completion options so you can complete the file without further keys
set wildmode=longest,list,full
" Disable balloons on gui

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    set guitablabel=%M%t
    set noballooneval

    if has("gui_gnome")
        set term=gnome-256color
        set guifont=Monospace\ Bold\ 12
    endif

    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h12
        set transparency=7
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
    else
        if $TERM == 'xterm'
            set term=xterm-256color
        else
        endif
    endif
endif

" tab settings
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

"disable visual bell
set visualbell t_vb=

"statusline setup
set statusline=%f       "tail of the filename

"Git
set statusline+=%{fugitive#statusline()}

"RVM
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2
" set statusline=%{ruby_debugger#statusline()}

" column with mark folding
set foldcolumn=1

set pastetoggle=<F2>
" copy and paste bind
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gp
vnoremap <C-p> "+gp

nnoremap gp `[v`]

nnoremap <M-i> :tabn<CR>
nnoremap <M-h> :tabp<CR>

nnoremap <silent> <CR> za
" Tab Control (others)
map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt
map <A-0> 10gt
imap <A-1> <ESC>1gt
imap <A-2> <ESC>2gt
imap <A-3> <ESC>3gt
imap <A-4> <ESC>4gt
imap <A-5> <ESC>5gt
imap <A-6> <ESC>6gt
imap <A-7> <ESC>7gt
imap <A-8> <ESC>8gt
imap <A-9> <ESC>9gt
imap <A-0> <ESC>10gt

" Create empty split related to the current one
nmap <Leader><left>  :leftabove  vnew<CR>
nmap <Leader><right> :rightbelow vnew<CR>
nmap <Leader><up>    :leftabove  new<CR>
nmap <Leader><down>  :rightbelow new<CR>

" nnoremap <Leader>d :NERDTree<CR>
nmap <silent> <Leader>t :NERDTreeToggle<CR>
" nnoremap <Leader>b :CommandTBuffer<CR>
" nnoremap <Leader>r :call RunRspecCurrentFileConque()<CR>
" nnoremap <Leader>l :call RunRspecCurrentLineConque()<CR>

" CtrlP settings:
nnoremap <silent> <Leader>p :CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = ''

" Gundo settings:
nnoremap <F4> :GundoToggle<CR>

" Yankring settings:
" nnoremap <silent> <F11> :YRShow<CR>
" let g:yankring_replace_n_pkey = '<m-p>'
" let g:yankring_replace_n_nkey = '<m-n>'
" let g:yankring_zap_keys = 'f F t T / ?'

let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
nnoremap <silent> <F9> :TlistToggle<CR>


"Syntastic
let g:syntastic_warning_symbol='#'
let g:syntastic_quiet_warnings=1

" vim-ruby-run
noremap  <silent> <Leader>e :call RubyRun()<CR>
vnoremap <silent> <Leader>e :call RubyRangeRun()<CR>


nnoremap <silent> <F12> :CoffeeMake<CR>

nnoremap <silent> <Leader>] :tabe ~/.vim/vimrc<CR>
nnoremap <Leader>[ :lcd %:p:h<CR>

" tags
map <A-b> :tp<CR>
map <A-n> :tn<CR>

" map <C-t> <ESC>:tabnew<CR>
      
nmap ,t :ToggleWord<CR>

" Vim Ruby Debugger settings
" let g:ruby_debugger_debug_mode = 1
let g:ruby_debugger_spec_path = 'rspec'
let g:ruby_debugger_default_script = 'script/rails s'
let g:ruby_debugger_no_maps = 1
" let g:ruby_debugger_progname = 'mvim'

map <A-b>  :call g:RubyDebugger.toggle_breakpoint()<CR>
map <A-v>  :call g:RubyDebugger.open_variables()<CR>
map <A-m>  :call g:RubyDebugger.open_breakpoints()<CR>
map <F7>   :call g:RubyDebugger.step()<CR>
map <F5>   :call g:RubyDebugger.next()<CR>
map <F8>   :call g:RubyDebugger.continue()<CR>
map <A-e>  :call g:RubyDebugger.exit()<CR>
map <A-d>  :call g:RubyDebugger.remove_breakpoints()<CR>


let g:ackprg="ack-grep -H --nocolor --nogroup --column"



"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" abbreviations
cab help tab help
cabbrev gitv Gitv
cabbrev git Git


cnoremap <M-v> <C-r>"
cnoremap <C-v> <C-r>+

command! Gdt tabedit %|Gdiff

"Surround selected text by spaces
vnoremap <CR> <ESC>`<i<SPACE><ESC>`>la<SPACE><ESC>h
" back to parent in git buffer explorer
" autocmd User fugitive
"   \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
"   \   nnoremap <buffer> .. :edit %:h<CR> |
"   \ endif


" auto delete buffers with git objects
" autocmd BufReadPost fugitive://* set bufhidden=delete
"
" Highlight word under cursor
" autocmd CursorMoved * exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
" map russian's keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


" scripts
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
