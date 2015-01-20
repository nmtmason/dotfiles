" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
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

" Rename tabs to show tab number
if exists("+showtabline")
  function! IndexedTabLine()
    let s = ''
    let wn = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= ' '
      let wn = tabpagewinnr(i,'$')
      let s .= '%#TabNum#'
      let s .= i
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      let buftype = getbufvar(bufnr, 'buftype')
      if buftype == 'nofile'
        if file =~ '\/.'
          let file = substitute(file, '.*\/\ze.', '', '')
        endif
      else
        let file = fnamemodify(file, ':p:t')
      endif
      if file == ''
        let file = '[No Name]'
      endif
      let s .= ' ' . file . ' '
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!IndexedTabLine()
  set showtabline=1
  highlight link TabNum Special
endif

