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
set cursorline
set whichwrap=b,s,h,l,<,>,[,]
set clipboard=unnamed,unnamedplus
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

inoremap { {}<LefT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESCi
inoremap (<Enter> ()<Left><CR><ESC><S-o>

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

"smartchr
" 演算子の間に空白を入れる
inoremap <buffer><expr> < search('^#include\%#', 'bcn')? ' <': smartchr#one_of(' < ', ' << ', '<')
inoremap <buffer><expr> > search('^#include <.*\%#', 'bcn')? '>': smartchr#one_of(' > ', ' >> ', '>')
inoremap <buffer><expr> + smartchr#one_of(' + ', '++', '+')
inoremap <buffer><expr> - smartchr#one_of(' - ', '--', '-')
inoremap <buffer><expr> / smartchr#one_of(' / ', '// ', '/')
" *はポインタで使うので、空白はいれない
inoremap <buffer><expr> & smartchr#one_of(' & ', ' && ', '&')
inoremap <buffer><expr> % smartchr#one_of(' % ', '%')
inoremap <buffer><expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')
inoremap <buffer><expr> , smartchr#one_of(', ', ',')
" 3項演算子の場合は、後ろのみ空白を入れる
inoremap <buffer><expr> ? smartchr#one_of('? ', '?')
inoremap <buffer><expr> : smartchr#one_of(': ', '::', ':')

" =の場合、単純な代入や比較演算子として入力する場合は前後にスペースをいれる。
" 複合演算代入としての入力の場合は、直前のスペースを削除して=を入力
inoremap <buffer><expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= '
         \ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
         \ : smartchr#one_of(' = ', ' == ', '=')

" 下記の文字は連続して現れることがまれなので、二回続けて入力したら改行する
inoremap <buffer><expr> } smartchr#one_of('}', '}<cr>')
inoremap <buffer><expr> ; smartchr#one_of(';', ';<cr>')
" 「->」は入力しづらいので、..で置換え
inoremap <buffer><expr> . smartchr#loop('.', '->', '...')
" 行先頭での@入力で、プリプロセス命令文を入力
inoremap <buffer><expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#one_of('#define', '#include', '#ifdef', '#endif', '@'): '@'

inoremap <buffer><expr> " search('^#include\%#', 'bcn')? ' "': '"'
" if文直後の(は自動で間に空白を入れる
inoremap <buffer><expr> ( search('\<\if\%#', 'bcn')? ' (': '('

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let $RUST_SRC_PATH="/usr/local/src/rust/src"

" go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

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

