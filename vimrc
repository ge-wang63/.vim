" >>> 杂项start >>>

" tab缩进距离
set softtabstop=2
" 一般模式下移动距离
set shiftwidth=2
" 使用空格做缩进
set expandtab

" 显示标签打开文件名
set showtabline=2 
" 水平视窗设置在底部
set splitbelow 
" 垂直视窗设置在右边
set splitright 

filetype plugin indent on

" 禁用自动生成备份文件
set nobackup
set nowritebackup
set noswapfile

" 关闭兼容模式
set nocp
" 距离顶部/底部5行就开始滚动
set scrolloff=5
" 设定默认编码
set fenc=utf-8
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
" 共享剪贴板
set clipboard+=unnamed

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" <<< 杂项end <<<
"
"
source ~/.vim/plugin/plugins.vim
