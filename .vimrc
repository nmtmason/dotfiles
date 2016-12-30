" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
call vundle#end()
filetype plugin indent on

" Plugin behaviour
let g:ctrlp_map = '<C-p>'

" General
set autoread
set autowrite
set nobackup
set directory=/tmp
set wildmenu
set wildmode=list:longest,full
set wildignore=*~,*.log,*.jpg,*.png,*.gif,.git,vendor,tmp
set hidden

" Mappings
let mapleader=","
set pastetoggle=<leader>p
nnoremap <leader><space> :noh<cr>
nnoremap <leader>= gg=G``
nnoremap <cr> mlo<esc>`l
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Searching
set gdefault
set hlsearch
set ignorecase
set incsearch
set smartcase

" Formatting
set backspace=indent,eol,start
set expandtab
set shiftwidth=2
set tabstop=2
autocmd BufNewFile,BufRead *.json set ft=javascript

" Appearance
set list
set listchars=eol:¬,trail:·
set laststatus=2
set matchtime=4
set report=0
set nofoldenable
set relativenumber
set showcmd
set showmatch
set statusline=%F\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P
set cursorline
set colorcolumn=80
set scrolloff=5
set showtabline=2

" Syntax - rely on the terminal controlling colors, but override some defaults
hi StatusLine guifg=White guibg=Black gui=None
hi StatusLine ctermfg=White ctermbg=Black cterm=None
hi ColorColumn guifg=White guibg=Black gui=None
hi ColorColumn ctermfg=White ctermbg=Black cterm=None
hi LineNr guifg=White guibg=Black gui=None
hi LineNr ctermfg=White ctermbg=Black cterm=None
