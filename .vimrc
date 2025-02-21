" $VIMRUNTIME refers to the versioned system directory where Vim stores its
" system runtime files -- /usr/share/vim/vim<version>.
"
" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
"
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1
"
" If you would rather _use_ default.vim's settings, but have the system or
" user vimrc override its settings, then uncomment the line below.
" source $VIMRUNTIME/defaults.vim

" All Debian-specific settings are defined in $VIMRUNTIME/debian.vim and
" sourced by the call to :runtime you can find below.  If you wish to change
" any of those settings, you should do it in this file or
" /etc/vim/vimrc.local, since debian.vim will be overwritten everytime an
" upgrade of the vim packages is performed. It is recommended to make changes
" after sourcing debian.vim so your settings take precedence.

runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes
" numerous options, so any other options should be set AFTER changing
" 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd        " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
set mouse=a     " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set number
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4
setlocal noswapfile     " 不要生成swap文件
set nobackup            " 覆盖文件时不备份
" set autochdir         " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes      " 设置备份时的行为为覆盖
set hlsearch            " 搜索时高亮显示被找到的文本
set noerrorbells        " 关闭错误信息响铃
set novisualbell        " 关闭使用可视响铃代替呼叫
set t_vb=               " 置空错误铃声的终端代码
set magic               " 设置魔术
set smartindent         " 开启新行时使用智能自动缩进
set backspace=indent,eol,start  " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1         " 设定命令行的行数为 1
set complete=.,w,b,u,t
set termguicolors
set expandtab
set t_Co=256

let mapleader=","

nmap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nmap <leader>f :Leaderf file<CR>
nmap <leader>rg :Leaderf rg<CR>
nmap <A-left> :bp<CR>
nmap <A-right> :bn<CR>
nmap <A-up> :bfirst<CR>
nmap <A-down> :blast<CR>
nmap <leader>d :bdelete<CR>
nmap <C-s> :w<CR>
nmap <leader>q :q<CR>
nmap <leader>wq :wq<CR>
nmap <leader>s :/
nmap <leader>ns :nohlsearch<CR>
nmap <leader>ra :Ranger<CR>
nmap <leader>g :Copilot<CR>
nmap <A-up> :m-2<CR>
nmap <A-down> :m+1<CR>
nmap <C-a> ggVG
vmap <C-c> "+y
nmap <C-v> "+p
imap <C-s> <ESC>:w<CR>

let g:plug_url_format = 'git@github.com:%s.git'

call plug#begin('~/.vim/plugged')
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Yggdroot/indentLine'
    Plug 'francoiscabrol/ranger.vim'
call plug#end()

" vim-airline
let g:airline_theme='deus'
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#enabled=1 " 显示窗口tab和buffer
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#formatter='unique_tail_improved'

" Leaderf
let g:Lf_WindowPosition='popup'
let g:Lf_StlSeparator = { 'left': '', 'right': '' }

" indentLine
let g:indentLine_char='¦'
let g:indentLine_first_char='¦'
let g:indentLine_showFirstIndentLevel=1
let g:indentLine_conceallevel=2

" ranger.vim
let g:ranger_map_keys=0
