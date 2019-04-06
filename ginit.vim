filetype off
filetype plugin indent off

set expandtab
set relativenumber
set tabstop=3
set shiftwidth=3
set autoindent
set autoread
set virtualedit=block
set smartindent
set noswapfile
set number
set hlsearch
set background=dark
set hidden
set list
set showmatch
set ruler
set laststatus=2
set title
set cursorline
set cursorcolumn
set whichwrap=b,s,h,l,<,>,[,]
set clipboard=unnamed,unnamedplus
set guifont
set tags=./tags

if &compatible
  set nocompatible
endif
" display filepath of current file

" config for clipboard
nnoremap <Space>d "*dd
vnoremap <Space>d "*dd
nnoremap <Space>y "*yy
vnoremap <Space>y "*yy
nnoremap <Space>p "*p
vnoremap <Space>p "*p

inoremap <BS> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
noremap <BS> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

inoremap { {}<LefT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESCi
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<ESCi
inoremap [<Enter> []<Left><CR><ESC><S-o>

nnoremap <space>. :<c-u>tabedit $MYVIMRC<CR>
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml = '~/.config/dein/.dein.toml'
  let s:lazy_toml = '~/.config/dein/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy' : 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

if dein#check_install()
  call dein#install()
endif

" jedi-vim
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" endline

" colorscheme
colorscheme badwolf

" highlight Normal ctermfg=White ctermbg=Black
highlight CursorLine term=underline cterm=underline ctermbg=239
highlight CursorColumn ctermbg=239

" highlight Normal guifg=White guibg=Black
highlight CursorLine gui=underline guibg=239
highlight CursorColumn guibg=239

filetype plugin indent on
syntax enable
syntax on

" set completeopt+=noinsert,noselect
set completeopt+=noinsert
set completeopt-=preview

set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

