# vim设定

本项目使用 Vim 8 原生包管理机制（`pack/all/start/`），所有插件通过 git submodule 管理。

## 插件目录

1. [rainbow](#luochen1990rainbow) — 彩虹括号
2. [fzf / fzf.vim](#junegunnfzfvim) — 模糊查找器
3. [nerdtree](#preservimnerdtree) — 文件树浏览器
4. [vim-airline](#vim-airline--vim-airline-themes) — 状态栏/标签栏
5. [vim-colors-solarized](#altercationvim-colors-solarized) — Solarized 配色主题
6. [vim-css-color](#apvim-css-color) — CSS 颜色预览
7. [vim-polyglot](#sheerunvim-polyglot) — 多语言语法包
8. [vim-markdown](#preservimvim-markdown) — Markdown 语法支持
9. [vim-markdown-toc](#mzloginvim-markdown-toc) — Markdown 目录生成
10. [vim-yoink](#svermeulenvim-yoink) — 粘贴历史管理
11. [vim-peekaboo](#junegunnvim-peekaboo) — 寄存器预览
12. [vim-surround](#tpopevim-surround) — 环绕字符操作
13. [tabular](#godlygeektabular) — 文本对齐

---

### luochen1990/rainbow

彩虹括号增强版，为不同嵌套层级的括号显示不同颜色。

#### 配置

```vim
let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle
```

```vim
let g:rainbow_conf = {
    \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \ 'guis': [''],
    \ 'cterms': [''],
    \ 'operators': '_,_',
    \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \ 'separately': {
    \     '*': {},
    \     'markdown': {
    \         'parentheses_options': 'containedin=markdownCode contained', " enable rainbow for code blocks only
    \     },
    \     'lisp': {
    \         'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], " lisp needs more colors
    \     },
    \     'haskell': {
    \         'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
    \     },
    \     'vim': {
    \         'parentheses_options': 'containedin=vimFuncBody', " enable rainbow inside vim function body
    \     },
    \     'perl': {
    \         'syn_name_prefix': 'perlBlockFoldRainbow',
    \     },
    \     'stylus': {
    \         'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], " vim-css-color compatibility
    \     },
    \     'css': 0, " disable for css files
    \     'nerdtree': 0, " rainbow conflicts with NERDTree
    \ }
\}
```

- **guifgs**: GUI 界面括号颜色列表，按顺序循环使用
- **guis**: GUI 样式列表 (:h highlight-gui)
- **ctermfgs**: 终端下括号颜色列表
- **cterms**: 终端样式列表 (:h highlight-cterm)
- **operators**: 跟随同级括号一起高亮的运算符
- **parentheses**: 括号定义列表，包含 `start/end/step/fold/contained/containedin/contains` 等 syntax 属性
- **separately**: 按文件类型（`&ft`）分别配置，`*` 为默认，值为 `0` 表示禁用，值为 `"default"` 使用插件默认兼容配置

#### 用法

| 命令 | 说明 |
|------|------|
| `:RainbowToggle` | 开关彩虹括号 |

---

### junegunn/fzf.vim

基于 [fzf](https://github.com/junegunn/fzf) 命令行模糊查找器的 Vim 集成，提供快速搜索文件、缓冲区、代码等能力。

#### 语法

fzf 搜索支持以下高级语法：

| 语法 | 说明 | 示例 |
|------|------|------|
| `^` | 前缀精确匹配 | `^welcom` |
| `$` | 后缀精确匹配 | `friends$` |
| `'` | 精确匹配 | `'welcom my friends` |
| `.` | 后缀精确匹配（简写） | `.mp3` |
| `\|` | "或者"匹配 | `friends \| foes` |
| `!` | 反向匹配 | `welcome !friends` |

#### 键盘映射

```vim
nnoremap <silent> <Leader>b :Buffers<CR>   " 列出缓冲区
nnoremap <silent> <C-f> :Files<CR>         " 搜索文件
nnoremap <silent> <Leader>f :Rg<CR>        " ripgrep 全文搜索
```

#### 常用命令

| Command | 说明 |
|---------|------|
| `:Files [PATH]` | 文件搜索（使用 `$FZF_DEFAULT_COMMAND` 或默认查找） |
| `:Rg [PATTERN]` | ripgrep 全文搜索（多选：`ALT-A` 全选、`ALT-D` 取消全选） |
| `:Buffers` | 已打开缓冲区列表 |
| `:BLines [QUERY]` | 当前缓冲区行搜索 |
| `:Lines [QUERY]` | 所有已加载缓冲区行搜索 |
| `:GFiles [OPTS]` | Git 跟踪文件 (`git ls-files`) |
| `:Marks` | 标记列表 |
| `:Jumps` | 跳转列表 |
| `:History` | 最近打开文件历史 |
| `:History:` | 命令历史 |
| `:History/` | 搜索历史 |
| `:Commits` | Git 提交历史（需 fugitive.vim） |
| `:BCommits` | 当前缓冲区 Git 提交历史 |
| `:Commands` | 可用命令列表 |
| `:Maps` | Normal 模式键盘映射列表 |
| `:Helptags` | 帮助标签 |
| `:Windows` | 窗口列表 |
| `:Colors` | 配色方案列表 |
| `:Filetypes` | 文件类型列表 |

#### 配置

```vim
let g:fzf_layout = { 'down': '40%' }          " 在下半部分 40% 区域打开 fzf

" 默认快捷键（在 fzf 窗口中）
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',   " 新标签页打开
  \ 'ctrl-x': 'split',       " 水平分割打开
  \ 'ctrl-v': 'vsplit' }     " 垂直分割打开
```

---

### preservim/nerdtree

文件系统树形浏览器，在侧边栏浏览和操作文件。

#### 键盘映射

```vim
nnoremap <leader>n :NERDTreeFocus<CR>   " 聚焦到 NERDTree 窗口
nnoremap <Leader>t :NERDTreeToggle<CR>      " 切换 NERDTree 显示/隐藏
```

#### 窗口操作

```
ctrl + w + h    光标聚焦左侧树形目录
ctrl + w + l    光标聚焦右侧文件显示窗口
ctrl + w + w    光标自动在左右侧窗口切换
ctrl + w + r    移动当前窗口的布局位置
```

#### 文件/目录操作

| 快捷键 | 说明 |
|--------|------|
| `o` | 打开文件、目录或书签，并跳转到该窗口 |
| `go` | 打开文件、目录或书签，但不跳转 |
| `t` | 在新 Tab 中打开，并跳转 |
| `T` | 在新 Tab 中打开，但不跳转 |
| `i` | 水平分割打开，并跳转 |
| `gi` | 水平分割打开，但不跳转 |
| `s` | 垂直分割打开，并跳转 |
| `gs` | 垂直分割打开，但不跳转 |
| `!` | 执行当前文件 |
| `O` | 递归打开选中目录 |
| `x` | 合拢选中结点的父目录 |
| `X` | 递归合拢选中结点的所有子目录 |
| `e` | Edit the current dir |
| `双击` | 相当于 `o` |
| `中键` | 对文件相当于 `i`，对目录相当于 `e` |

#### 导航操作

| 快捷键 | 说明 |
|--------|------|
| `P` | 跳到根结点 |
| `p` | 跳到父结点 |
| `K` | 跳到同级第一个结点 |
| `J` | 跳到同级最后一个结点 |
| `k` | 跳到同级前一个结点 |
| `j` | 跳到同级后一个结点 |
| `C` | 将选中目录或文件的父目录设为根结点 |
| `u` | 将当前根结点的父目录设为根目录（合拢原根结点） |
| `U` | 将当前根结点的父目录设为根目录（保持展开原根结点） |

#### 其他

| 快捷键 | 说明 |
|--------|------|
| `r` | 递归刷新选中目录 |
| `R` | 递归刷新根结点 |
| `m` | 显示文件系统菜单（增删改移等） |
| `cd` | 将 CWD 设为选中目录 |
| `I` | 切换是否显示隐藏文件 |
| `f` | 切换是否使用文件过滤器 |
| `F` | 切换是否显示文件 |
| `B` | 切换是否显示书签 |
| `q` | 关闭 NerdTree 窗口 |
| `?` | 切换 Quick Help |

---

### vim-airline / vim-airline-themes

轻量级状态栏/标签栏插件，显示当前模式、文件路径、Git 分支、编码等信息。

#### 配置

```vim
let g:airline_powerline_fonts = 1             " 启用 Powerline 字体符号
let g:airline_theme = 'luna'                  " 使用 luna 主题
let g:airline#extensions#tabline#enabled = 1  " 启用顶部标签栏
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
```

#### 用法

| 命令 | 说明 |
|------|------|
| `:AirlineTheme <name>` | 切换主题（共 232 个主题可用） |
| `:AirlineToggle` | 开关状态栏 |

#### 依赖

- 需要安装 Powerline 字体以获得最佳显示效果（箭头、分支图标等）
- 主题包 [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) 提供额外的主题选择

---

### altercation/vim-colors-solarized

Ethan Schoonover 设计的 Solarized 配色方案，精确调色的深色/浅色双模式主题。

#### 配置（vimrc）

```vim
syntax enable
set background=dark
try
    colorscheme solarized
catch
endtry
```

- 启用 256 色终端支持 (`set t_Co=256`)
- 使用 `try/catch` 包裹，配色方案缺失时不影响 Vim 正常启动
- 支持 GUI 和终端两种模式

#### 用法

| 设置 | 说明 |
|------|------|
| `set background=dark` | 深色模式（推荐） |
| `set background=light` | 浅色模式 |

---

### ap/vim-css-color

在 CSS / HTML / 配置文件中，将颜色值（`#hex`、`rgb()`、`hsl()`、颜色名等）以实际色彩高亮显示。

#### 支持的文件类型

CSS、SCSS、LESS、Stylus、HTML、SVG、JavaScript、Lua、Gitconfig 等。

#### 用法

无需配置，打开支持的文件类型即可自动预览颜色。该插件与 rainbow 的 `stylus` 模式配合使用时需注意兼容性配置（已在 rainbow 配置中处理）。

| 命令 | 说明 |
|------|------|
| `:CSSColorToggle` | 开关颜色预览 |

---

### sheerun/vim-polyglot

全语言语法高亮合集包，包含 **648 个语法文件**，覆盖 598+ 种语言/文件格式。按需加载，保持启动速度（约 10ms）。

该项目用它替代了多个独立的语言语法插件（如 vim-javascript、vim-ruby、vim-go 等）。

#### 功能特性

- 自动检测文件类型并加载对应语法高亮
- 内置优化版 [vim-sleuth](https://github.com/tpope/vim-sleuth) 自动检测缩进设置
- 无额外配置，安装即用

#### 用法

无需配置，打开任意支持的文件类型即可享受语法高亮。

---

### preservim/vim-markdown

增强 Markdown 语法的语法高亮、匹配规则和扩展功能。

#### 标题折叠

| 快捷键 | 说明 |
|--------|------|
| `zr` | 减少一级折叠 |
| `zR` | 打开全部折叠 |
| `zm` | 增加一级折叠 |
| `zM` | 全部折叠 |
| `za` | 切换当前光标处折叠 |
| `zA` | 递归切换当前光标处折叠 |
| `zc` | 关闭当前光标处折叠 |
| `zC` | 递归关闭当前光标处折叠 |

#### 配置

```vim
set conceallevel=2                          " 语法隐藏级别（隐藏 Markdown 格式标记）
let g:vim_markdown_folding_style_pythonic = 1  " 使用 Python 风格折叠
let g:vim_markdown_override_foldtext = 0       " 不覆盖折叠文本显示
let g:vim_markdown_no_default_key_mappings = 1 " 禁用默认键盘映射
let g:vim_markdown_math = 1                    " 启用 LaTeX 数学公式支持
let g:vim_markdown_frontmatter = 1             " YAML 前置元数据高亮
let g:vim_markdown_toml_frontmatter = 1        " TOML 前置元数据高亮
let g:vim_markdown_json_frontmatter = 1        " JSON 前置元数据高亮
let g:vim_markdown_strikethrough = 1           " 删除线支持
let g:vim_markdown_borderless_table = 1        " 无边框表格支持
" let g:vim_markdown_new_list_item_indent = 2  " 列表新条目自动缩进宽度
```

---

### mzlogin/vim-markdown-toc

自动生成和更新 Markdown 文件目录（Table of Contents）。

#### 用法

| 命令 | 说明 |
|------|------|
| `:GenTocGFM` | 生成 GFM（GitHub Flavored Markdown）链接风格的 TOC |
| `:GenTocRedcarpet` | 生成 Redcarpet 链接风格的 TOC |
| `:UpdateToc` | 更新已存在的 TOC |
| `:RemoveToc` | 删除 TOC |
| `:TocGoto` | 跳转到光标所在标题在 TOC 中的位置 |

---

### svermeulen/vim-yoink

粘贴历史管理插件，粘贴后可以轮换粘贴历史中的不同内容。

#### 键盘映射

```vim
nmap <c-n> <plug>(YoinkPostPasteSwapBack)     " 粘贴后轮换到更早的历史
nmap <c-p> <plug>(YoinkPostPasteSwapForward)   " 粘贴后轮换到更新的历史
nmap p <plug>(YoinkPaste_p)                    " 粘贴（带历史记录）
nmap P <plug>(YoinkPaste_P)                    " 行前粘贴（带历史记录）
nmap gp <plug>(YoinkPaste_gp)                  " 粘贴并移动光标到末尾
nmap gP <plug>(YoinkPaste_gP)                  " 行前粘贴并移动光标到末尾
```

#### 用法

- 粘贴后按 `<C-n>` / `<C-p>` 在历史记录中轮换
- 映射 `p`、`P`、`gp`、`gP` 均通过 yoink 处理，保持统一的粘贴历史

#### 命令

| 命令 | 说明 |
|------|------|
| `:Yanks` | 显示当前粘贴历史 |
| `:ClearYanks` | 清空历史（保留默认寄存器中的最后一条） |

---

### junegunn/vim-peekaboo

寄存器预览插件，在按 `"`、`@` 或 `<C-r>` 时弹窗显示寄存器内容。

#### 用法

| 快捷键 | 场景 | 说明 |
|--------|------|------|
| `"` | Normal 模式 | 按 `"` 时弹窗显示所有寄存器内容，按对应字母选择 |
| `@` | Normal 模式 | 按 `@` 时弹窗显示宏寄存器，方便选择执行 |
| `<C-r>` | Insert 模式 | 弹窗显示寄存器内容，选择后插入 |

#### 功能

- 显示所有命名寄存器（`a-z`）、编号寄存器（`0-9`）以及特殊寄存器（`"`, `+`, `*`, `/` 等）
- 支持自定义显示窗口位置
- 无需额外配置，安装即用

---

### tpope/vim-surround

快速操作成对括号、引号、XML 标签等"环绕"字符。

#### 用法示例

按 `cs"'` 在：
```
"Hello world!"
```
上操作，会变成：
```
'Hello world!'
```

按 `cs'<q>` 变为：
```
<q>Hello world!</q>
```

按 `cst"` 变回：
```
"Hello world!"
```

按 `ds"` 移除分隔符：
```
Hello world!
```

光标在 "Hello" 上按 `ysiw]`（`iw` 是文本对象）：
```
[Hello] world!
```

改成大括号并加空格：按 `cs]{`
```
{ Hello } world!
```

用 `yssb` 或 `yss)` 包裹整行：
```
({ Hello } world!)
```

还原：`ds{ds)`
```
Hello world!
```

强调：`ysiw<em>`
```
<em>Hello</em> world!
```

可视模式：按大写 `V` 进入行选择模式，再 `S<p class="important">`：
```
<p class="important">
  <em>Hello</em> world!
</p>
```

#### 常用命令速查

| 命令 | 说明 |
|------|------|
| `cs<old><new>` | 将环绕字符 `<old>` 替换为 `<new>` |
| `ds<char>` | 删除环绕字符 |
| `ys<textobj><char>` | 为文本对象添加环绕字符 |
| `yss<char>` | 为整行添加环绕字符 |
| `S<char>` | 在可视模式下为选中文本添加环绕字符 |

---

### godlygeek/tabular

文本对齐工具，按指定分隔符对齐代码和表格，提升可读性。

#### 用法示例

对齐赋值语句：
```vim
" 对齐前
var one = 1
var two = 2
var three = 3

" 选中后执行 :Tabularize /=
var one   = 1
var two   = 2
var three = 3
```

对齐表格：
```vim
" 对齐前
|姓名|年龄|城市|
|张三|28|北京|
|李四|30|上海|

" 选中后执行 :Tabularize /|
| 姓名 | 年龄 | 城市 |
| 张三 | 28   | 北京 |
| 李四 | 30   | 上海 |
```

#### 常用命令

| 命令 | 说明 |
|------|------|
| `:Tabularize /<分隔符>` | 按指定分隔符对齐当前行/选中区域 |
| `:Tab /<分隔符>` | `Tabularize` 的简写形式 |

常用场景：
- `:Tab /=` — 对齐等号
- `:Tab /:` — 对齐冒号（JSON、YAML、CSS 等）
- `:Tab /|` — 对齐 Markdown 表格
- `:Tab /,` — 对齐逗号分隔的内容
- `:Tab /#` — 对齐行尾注释

---

## 通用配置

以下配置位于 `vimrc` 中，对所有插件生效。

### 键盘映射总览

| 映射 | 功能 |
|------|------|
| `<Space>` | Leader 键 |
| `jj` | 退出插入/可视模式 |
| `<C-j/k/h/l>` | 窗口间移动 |
| `<C-f>` | fzf 文件搜索 |
| `<Leader>t` | NERDTree 切换 |
| `<Leader>f` | ripgrep 全文搜索 |
| `<Leader>b` | 缓冲区列表 |
| `<Leader>n` | NERDTree 聚焦 |
| `<C-n>` | 粘贴后轮换到更早记录 |
| `<C-p>` | 粘贴后轮换到更新记录 |
| `<Esc><Esc>` | 清除搜索高亮 |
| `<Up/Down/Left/Right>` | 已禁用（强制 hjkl） |

### 其他设置

- **缩进**：2 空格，expandtab
- **配色**：Solarized Dark，256 色
- **搜索**：使用 ripgrep (`rg`)，智能大小写
- **备份**：关闭 swap/backup/undo 文件（依赖 Git）
- **保存时**：自动清除 `.txt`、`.js`、`.py`、`.wiki`、`.sh`、`.coffee`、`.md` 文件的行尾空格