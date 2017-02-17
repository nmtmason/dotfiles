filetype plugin indent on

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
