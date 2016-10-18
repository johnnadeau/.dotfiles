
" Vundle stuff
" =============================================================================
set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'thoughtbot/vim-rspec'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()           " required
filetype plugin indent on   " required

syntax on                   " enable syntax highlighting
set number
set numberwidth=5
set backspace=indent,eol,start " allow backspacing over everything insert mode
set history=500             " keep 500 lines of command line history
set ruler
set showcmd
set showmatch
set laststatus=2            " always show status line
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set shiftround
set textwidth=80
set colorcolumn=80

" display extra whitespace
set list listchars=tab:»·,trail:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

let mapleader = ","

" edit and source .vimrc
nmap <Leader>vi :tabe ~/.vimrc<cr>
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>q

" handle common typos
command! Q q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

" vim-rspec/vim-tmux-runner configuration
let g:rspec_command = "VtrSendCommandToRunner! bundle exec rspec {spec}"
" use Vtr mappings seen here:
" https://github.com/christoomey/vim-tmux-runner/blob/master/plugin/vim-tmux-runner.vim#L458
let g:VtrUseVtrMaps = 1

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

au FileType markdown setlocal textwidth=100 colorcolumn=100
