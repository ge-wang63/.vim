" ----- appearance start -----
" 设置/取消 行号
set nu
" set nonu
" 显示--INSERT--等字眼在左下角的状态栏
" set showmode
set showcmd
" 禁止显示缩进、换行符等
set nolist
" 设置软换行
set wrap
" 换行保存单词
set linebreak
" 突出显示当前行
set cursorline
" 突出显示当前列
" set cursorcolumn
" 显示标尺（右下角的状态栏）
set ruler 
" ----- appearance end -----

" ----- 搜索设置start -----
" 设置是否将查找的字符串进行反白
set hlsearch
"  set nohlsearch
" 搜寻忽略大小写
set ignorecase
" 当搜寻的单词有大写就会忽略ignorecase
set smartcase
" 设置渐进式搜寻
set incsearch
" ----- 搜索设置end -----

" 缩进设置start -----
" tab缩进距离
set softtabstop=2
" 一般模式下移动距离
set shiftwidth=2
" 使用空格做缩进
set expandtab
" 缩进设置end -----

" 标签页设置start -----
" 显示标签打开文件名
set showtabline=2 
" 水平视窗设置在底部
set splitbelow 
" 垂直视窗设置在右边
set splitright 
" 标签也设置end -----

" color设置start -----
" 设置/取消语法高亮显示
syntax on
" 配色方案
" colorscheme darkblue
" 设置背景颜色色调
" set bg=light
" color设置end -----

" filetype设置start -----
" 检测文件类型
filetype on
filetype indent on
filetype plugin on
" filetype设置end -----

" backup设置start -----
" 禁用自动备份
set nobackup
set nowritebackup
set noswapfile
" backup设置end -----

" ----- map start -----
map <Up> <Nop>
imap <Up> <Nop>
map <Down> <Nop>
imap <Down> <Nop>
map <Left> <Nop>
imap <Left> <Nop>
map <Right> <Nop>
imap <Right> <Nop>
" ----- map end -----

" ----- vim-plugin start -----
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'plasticboy/vim-markdown'
call plug#end()
" ----- vim-plugin end -----

" ----- 杂项start -----
" 距离顶部/底部5行就开始滚动
set scrolloff=5
" 设定默认编码
set fenc=utf-8
" 去掉vi一致性模式
" set nocompatible
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
" 共享剪贴板
set clipboard+=unnamed
" ----- 杂项end -----

