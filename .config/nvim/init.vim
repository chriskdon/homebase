set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" == Add Vundle plugins here ==
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://github.com/urso/haskell_syntax.vim.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-sensible'
Plugin 'vim-syntastic/syntastic'
Plugin 'dag/vim2hs'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'itchyny/lightline.vim'
Plugin 'shime/vim-livedown' " also npm install -g livedown
Plugin 'leafgarland/typescript-vim'
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plugin 'OrangeT/vim-csharp'
Plugin 'ElmCast/elm-vim'
Plugin 'Valloric/YouCompleteMe'

let g:syntastic_always_populate_loc_list = 1
let g:typescript_indent_disable = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:haskell_conceal_wide = 1

" disable all conceals, including the simple ones like
" lambda and composition
let g:haskell_conceal              = 0

" disable concealing of "enumerations": commatized lists like
" deriving clauses and LANGUAGE pragmas,
" otherwise collapsed into a single ellipsis
let g:haskell_conceal_enumerations = 0

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

call vundle#end()            " required
filetype plugin indent on    " required

" == Visuals ==
if has('patch-7.4.1778')
  " set guicolors
endif
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

colorscheme jellybeans

set cursorline      " Highlught current line
set colorcolumn=80  " Show line at the 80 character mark

set autochdir       " Change directory to current file

" == NETRW ==
let g:netrw_banner    = 0
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 30

" == Editing ==
set clipboard+=unnamedplus " Use clipboard directly

set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a         " Enable mouse in all modes

" == Other ==
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox

