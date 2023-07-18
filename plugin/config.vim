" >> appearance config start >>
" 设置/取消 行号
set nu
" set nonu
" 相对行号
set relativenumber
" 显示--INSERT--等字眼在左下角的状态栏
set showmode
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
" ----- appearance end -----
set ruler 

set hidden
" << appearance config end <<
"
"
" >> color config start >>
" 设置/取消语法高亮显示
syntax on
" 设置背景颜色色调
set background=dark
set t_Co=256
" 配色方案
colorscheme solarized 
" << color config end <<
"
"
" >> search config start >>
" 搜索高亮
set hlsearch
"  set nohlsearch
" 搜索增量高亮
set incsearch
" 搜寻忽略大小写
set ignorecase
" 当搜寻的单词有大写就会忽略ignorecase
set smartcase
" << search config end <<
