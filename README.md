# vim设定
## 插件

安装插件开启的配置、键盘映射，方便查阅

1. [rainbow](#luochen1990rainbow)
2. [fzf.vim](#junegunnfzfvim)
3. [nerdtree](#preservimnerdtree)
4. [vim-markdown](#preservimvim-markdown)
5. [vim-markdown-toc](#mzloginvim-markdown-toc)

### luochen1990/rainbow

彩虹括号增强版

#### 配置

```
 let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
```

```
let g:rainbow_conf = {
	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	'guis': [''],
	'cterms': [''],
	'operators': '_,_',
	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	'separately': {
		'*': {},
		'markdown': {
			'parentheses_options': 'containedin=markdownCode contained', "enable rainbow for code blocks only
		},
		'lisp': {
			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], "lisp needs more colors for parentheses :)
		},
		'haskell': {
			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], "the haskell lang pragmas should be excluded
		},
		'vim': {
			'parentheses_options': 'containedin=vimFuncBody', "enable rainbow inside vim function body
		},
		'perl': {
			'syn_name_prefix': 'perlBlockFoldRainbow', "solve the [perl indent-depending-on-syntax problem](https://github.com/luochen1990/rainbow/issues/20)
		},
		'stylus': {
			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], "[vim css color](https://github.com/ap/vim-css-color) compatibility
		},
		'css': 0, "disable this plugin for css files
		'nerdtree': 0, "rainbow is conflicting with NERDTree, creating extra parentheses
	}
}
```

- 'guifgs': 一个guifg的列表 (:h highlight-guifg), 即GUI界面的括号颜色, 将按顺序循环使用
- 'guis': 一个gui的列表 (:h highlight-gui), 将按顺序循环使用
- 'ctermfgs': 一个ctermfg的列表 (:h highlight-ctermfg), 即终端下的括号颜色
- 'cterms': 一个cterm的列表 (:h highlight-cterm)
- 'operators': 描述你希望哪些运算符跟着与它同级的括号一起高亮
- 'parentheses': 一个关于括号定义的列表, 每一个括号的定义包含形如以下的部分:  start=/(/, step=/,/, stop=/)/, fold, contained, containedin=someSynNames, contains=@Spell. 各个部分具体含义可参考 :h syntax, 其中 step 为本插件的扩展定义, 表示括号中间需要高亮的运算符
- 'separately': 针对文件类型(由&ft决定)作不同的配置,未被单独设置的文件类型使用*下的配置,值为0表示仅对该类型禁用插件,值为"default"表示使用针对该类型的默认兼容配置 (注意, 默认兼容配置可能随着该插件版本的更新而改变, 如果你不希望它改变, 那么你应该将它拷贝一份放到你的vimrc文件里)

### junegunn/fzf.vim

#### 语法

- ^ 表示前缀精确匹配。要搜索一个以"welcome"开头的短语：^welcom
- \$ 表示后缀精确匹配。要搜索一个以"friends"结尾的短语：friends\$
- ' 表示精确匹配。要搜索短语"welcom my friends"：'welcom my friends
- . 表示后缀精确匹配。要搜索map3文件：'.mp3'
- | 表示"或者"匹配。要搜索"friends"或"foes"：friends | foes
- ! 表示反向匹配。要搜索一个包含"welcome"但不包含"friends"的短语：welcome !friends

#### 用法

| Command                | List                                                                                   |
| ---------------------- | -------------------------------------------------------------------------------------- |
| `:Files [PATH]`        | Files (runs `$FZF_DEFAULT_COMMAND` if defined)                                         |
| `:GFiles [OPTS]`       | Git files (`git ls-files`)                                                             |
| `:GFiles?`             | Git files (`git status`)                                                               |
| `:Buffers`             | Open buffers                                                                           |
| `:Colors`              | Color schemes                                                                          |
| `:Ag [PATTERN]`        | [ag][ag] search result (`ALT-A` to select all, `ALT-D` to deselect all)                |
| `:Rg [PATTERN]`        | [rg][rg] search result (`ALT-A` to select all, `ALT-D` to deselect all)                |
| `:RG [PATTERN]`        | [rg][rg] search result; relaunch ripgrep on every keystroke                            |
| `:Lines [QUERY]`       | Lines in loaded buffers                                                                |
| `:BLines [QUERY]`      | Lines in the current buffer                                                            |
| `:Tags [QUERY]`        | Tags in the project (`ctags -R`)                                                       |
| `:BTags [QUERY]`       | Tags in the current buffer                                                             |
| `:Marks`               | Marks                                                                                  |
| `:Jumps`               | Jumps                                                                                  |
| `:Windows`             | Windows                                                                                |
| `:Locate PATTERN`      | `locate` command output                                                                |
| `:History`             | `v:oldfiles` and open buffers                                                          |
| `:History:`            | Command history                                                                        |
| `:History/`            | Search history                                                                         |
| `:Snippets`            | Snippets ([UltiSnips][us])                                                             |
| `:Commits [LOG_OPTS]`  | Git commits (requires [fugitive.vim][f])                                               |
| `:BCommits [LOG_OPTS]` | Git commits for the current buffer; visual-select lines to track changes in the range  |
| `:Commands`            | Commands                                                                               |
| `:Maps`                | Normal mode mappings                                                                   |
| `:Helptags`            | Help tags <sup id="a1">[1](#helptags)</sup>                                            |
| `:Filetypes`           | File types                                                                             |

#### 键盘映射

```vim
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" nnoremap <silent> <Leader>/ :BLines<CR>
" nnoremap <silent> <Leader>' :Marks<CR>
" nnoremap <silent> <Leader>g :Commits<CR>
" nnoremap <silent> <Leader>H :Helptags<CR>
" nnoremap <silent> <Leader>hh :History<CR>
" nnoremap <silent> <Leader>h: :History:<CR>
" nnoremap <silent> <Leader>h/ :History/<CR>
```

#### 配置

```vim
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
```

### preservim/nerdtree

#### 用法

```
ctrl + w + h    光标 focus 左侧树形目录
ctrl + w + l    光标 focus 右侧文件显示窗口
ctrl + w + w    光标自动在左右侧窗口切换
ctrl + w + r    移动当前窗口的布局位置
o       在已有窗口中打开文件、目录或书签，并跳到该窗口
go      在已有窗口 中打开文件、目录或书签，但不跳到该窗口
t       在新 Tab 中打开选中文件/书签，并跳到新 Tab
T       在新 Tab 中打开选中文件/书签，但不跳到新 Tab
i       split 一个新窗口打开选中文件，并跳到该窗口
gi      split 一个新窗口打开选中文件，但不跳到该窗口
s       vsplit 一个新窗口打开选中文件，并跳到该窗口
gs      vsplit 一个新 窗口打开选中文件，但不跳到该窗口
!       执行当前文件
O       递归打开选中 结点下的所有目录
x       合拢选中结点的父目录
X       递归 合拢选中结点下的所有目录
e       Edit the current dif
双击    相当于 NERDTree-o
中键    对文件相当于 NERDTree-i，对目录相当于 NERDTree-e
D       删除当前书签
P       跳到根结点
p       跳到父结点
K       跳到当前目录下同级的第一个结点
J       跳到当前目录下同级的最后一个结点
k       跳到当前目录下同级的前一个结点
j       跳到当前目录下同级的后一个结点
C       将选中目录或选中文件的父目录设为根结点
u       将当前根结点的父目录设为根目录，并变成合拢原根结点
U       将当前根结点的父目录设为根目录，但保持展开原根结点
r       递归刷新选中目录
R       递归刷新根结点
m       显示文件系统菜单
cd      将 CWD 设为选中目录
I       切换是否显示隐藏文件
f       切换是否使用文件过滤器
F       切换是否显示文件
B       切换是否显示书签
q       关闭 NerdTree 窗口
?       切换是否显示 Quick Help
```

#### 键盘映射

```vim
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
```

### preservim/vim-markdown

#### 标题折叠用法

- `zr`: reduces fold level throughout the buffer
- `zR`: opens all folds
- `zm`: increases fold level throughout the buffer
- `zM`: folds everything all the way
- `za`: open a fold your cursor is on
- `zA`: open a fold your cursor is on recursively
- `zc`: close a fold your cursor is on
- `zC`: close a fold your cursor is on recursively

#### 配置

-   Folding level

        let g:vim_markdown_folding_level = 2

-    语法隐藏

     使用vim标准隐藏标准开启语法隐藏

         set conceallevel=2

-    修改折叠样式

        let g:vim_markdown_folding_style_pythonic = 1

-   foldtext 设置

        let g:vim_markdown_override_foldtext = 0

-   禁用默认键盘映射

        let g:vim_markdown_no_default_key_mappings = 1

-   Latex math

        let g:vim_markdown_math = 1

-   YAML 格式高亮

        let g:vim_markdown_frontmatter = 1

-   TOML 格式高亮

        let g:vim_markdown_toml_frontmatter = 1

-   JSON 格式高亮

        let g:vim_markdown_json_frontmatter = 1

-   删除线

        let g:vim_markdown_strikethrough = 1

-   列表新增条目自动缩进

        let g:vim_markdown_new_list_item_indent = 2

-   无边框表格

        let g:vim_markdown_borderless_table = 1

### mzlogin/vim-markdown-toc

#### 用法

-   生成 GFM 链接风格的 Table of Contents

        :GenTocGFM

-   生成 Redcarpet 链接风格的 Table of Contents

        :GenTocRedcarpet

-   更新已存在的 Table of Contents

        :UpdateToc

-   删除 Table of Contents

        :RemoveToc
