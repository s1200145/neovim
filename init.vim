filetype off
filetype plugin indent off

set tabstop=3
set shiftwidth=3
set expandtab
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
set wildmenu
set showcmd
set paste
set whichwrap=b,s,h,l,<,>,[,]
set clipboard=unnamed,unnamedplus
set imdisable
if &compatible
   set nocompatible
endif

" config for clipboard
nnoremap <Space>d "*dd
vnoremap <Space>d "*dd
nnoremap <Space>y "*yy
vnoremap <Space>y "*yy
nnoremap <Space>p "*p
vnoremap <Space>p "*p

inoremap { {}<LefT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESCi
inoremap (<Enter> ()<Left><CR><ESC><S-o>

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

if dein#check_install(['vimproc'])
   call dein#install(['vimproc'])
endif

if dein#check_install()
   call dein#install()
endif

" config
let g:python3_host_prog = '/usr/bin/python3'

" " deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
   \ neosnippet#expandable_or_jumpable() ?
   \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

" jedi-vim
let g:deoplete#sources#jedi#stament_length = 50
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#jedi#show_docstring = 0

" caw.vim
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

" vim-easymotion
let g:EasyMotion_do_mapping = 0
nmap s   <Plug>(easymotion-s2)
xmap s   <Plug>(easymotion-s2)
omap z   <Plug>(easymotion-s2)
nmap g/  <Plug>(easymotion-sn)
xmap g/  <Plug>(easymotion-sn)
omap g/  <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-j)
let g:Easyotion_keys = 'QZASDFGHJKL;'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
hi EasyMotionTarget guifg=#ffff00 ctermfg=81

" endline
colorscheme badwolf
highlight Normal ctermbg=none

filetype plugin indent on
syntax enable
syntax on

set completeopt+=noinsert,noselect
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

