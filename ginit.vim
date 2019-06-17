filetype off
filetype plugin indent off

set expandtab
set relativenumber
set tabstop=4
set shiftwidth=4
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
set tags=./tags

if has('win64')
    GuiFont! Ricty\ Diminished:h12
endif


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
nmap <Esc><Esc> :nohlsearch<CR><Esc>

if has('unix')
   let s:dein_dir = expand('~/.cache/dein')
   let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
   let s:toml = '~/.config/dein/.dein.toml'
   let s:lazy_toml = '~/.config/dein/.dein_lazy.toml'
elseif has('win64')
   set shellslash
   let s:dein_dir = expand('C:/Users/taku/.cache/dein')
   let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
   let s:toml = 'C:/Users/taku/.config/dein/.dein.toml'
   let s:lazy_toml = 'C:/Users/taku/.config/dein/.dein_lazy.toml'
endif
if !isdirectory(s:dein_repo_dir)
   execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
   call dein#begin(s:dein_dir)
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

" colorscheme
colorscheme badwolf

filetype plugin indent on
syntax enable
syntax on

" set completeopt+=noinsert,noselect
set completeopt+=noinsert
set completeopt-=preview

set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

