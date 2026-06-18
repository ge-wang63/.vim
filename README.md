# Vim 配置

个人 Vim 配置仓库（Vim 8+ / Neovim 兼容），基于原生 `packpath` + **Git Submodule** 管理插件，使用 Solarized Dark 主题，面向日常编码与文档编写场景。

## 设计理念

- **原生优先**：只依赖 Vim 8 内置的 `packpath` 机制加载插件，不引入第三方插件管理器
- **轻量可维护**：插件通过 Git Submodule 锁定版本，配置文件按职责拆分为 `vimrc`（通用设置）和 `plugin/plugins.vim`（插件配置）
- **键盘效率**：以 `<Space>` 为 Leader 键、`jj` 替代 Escape、完全禁用方向键强制 `hjkl` 导航
- **无冗余**：关闭 swap/backup/undo 文件，依赖 Git 做版本管理
- **一致体验**：`vimrc` 统一编辑行为——2 空格缩进、Solarized Dark 主题、`<C-hjkl>` 窗格导航、rg 全文搜索、保存时清理行尾空格

## 目录结构

```
~/.vim/
├── vimrc                          # 主配置文件（通用设置、UI、缩进、映射、自动命令）
├── plugin/
│   └── plugins.vim                # 各插件配置（键盘映射、选项）
├── pack/
│   └── all/
│       └── start/                 # 插件目录（Vim 8 原生包路径，启动时自动加载）
│           ├── nerdtree/          #   文件树浏览器
│           ├── rainbow/           #   彩虹括号
│           ├── tabular/           #   文本对齐
│           ├── vim-airline/       #   状态栏
│           ├── vim-airline-themes/#   状态栏主题
│           ├── vim-colors-solarized/# Solarized 配色
│           ├── vim-css-color/     #   CSS 颜色预览
│           ├── vim-markdown/      #   Markdown 增强
│           ├── vim-peekaboo/      #   寄存器预览
│           ├── vim-polyglot/      #   多语言语法包
│           ├── vim-surround/      #   环绕字符操作
│           └── vim-yoink/         #   粘贴历史管理
├── .gitignore                     # Git 忽略规则
├── .gitmodules                    # Git Submodule 定义（插件上游仓库与版本）
├── README.md                      # 本文档
```

## 安装

### 前置要求

- **Vim 8+ / Neovim**（需支持 `packpath`）
- **Git**（用于克隆仓库和 Submodule）
- **fzf** — 模糊查找器，fzf.vim 插件依赖
  - macOS: `brew install fzf`
  - Debian/Ubuntu: `sudo apt install fzf`
  - Fedora: `sudo dnf install fzf`
  - Arch: `sudo pacman -S fzf`
- **ripgrep (rg)** — 全文搜索，fzf `:Rg` 命令后端
  - macOS: `brew install ripgrep`
  - Debian/Ubuntu: `sudo apt install ripgrep`
  - Fedora: `sudo dnf install ripgrep`
  - Arch: `sudo pacman -S ripgrep`
- **Powerline 字体** — vim-airline 图标显示，推荐安装 [Nerd Font](https://www.nerdfonts.com/) 系列

### 首次安装

```bash
# 1. 备份已有配置（如有）
mv ~/.vim ~/.vim.bak  2>/dev/null
mv ~/.vimrc ~/.vimrc.bak 2>/dev/null

# 2. 克隆仓库
git clone --recurse-submodules https://github.com/ge-wang63/.vim.git ~/.vim

# 3. 链接 vimrc
ln -s ~/.vim/vimrc ~/.vimrc

# 4. 启动 Vim
vim
```


## 插件管理

### 插件机制

所有插件位于 `pack/all/start/`，Vim 8 会自动搜索该路径并加载。每个插件通过 Git Submodule 锁定到上游仓库的特定提交版本，确保可复现性。

```
Vim 启动 → 扫描 pack/*/start/ → 加载所有插件 → 加载 plugin/*.vim
```

### 查看插件状态

```bash
cd ~/.vim
git submodule status        # 查看所有插件当前版本
```

### 更新插件

```bash
cd ~/.vim
git submodule update --remote --recursive   # 更新所有插件到上游最新版
git add pack/all/start/ && git commit -m "plugins: update all submodules"
```

### 添加新插件

```bash
cd ~/.vim
git submodule add <plugin-url> pack/all/start/<plugin-name>
```

### 移除插件

```bash
cd ~/.vim
git submodule deinit pack/all/start/<plugin-name>
git rm pack/all/start/<plugin-name>
```

## 插件

### luochen1990/rainbow

彩虹括号增强版，为不同嵌套层级的括号显示不同颜色。

#### 配置

```vim
let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle
```

完整配置（含各语言适配、NERDTree 兼容等）见 `plugin/plugins.vim`。

配置项说明：
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

基于 [fzf](https://github.com/junegunn/fzf) 命令行模糊查找器的 Vim 集成。

#### 键盘映射

```vim
nnoremap <silent> <Leader>b :Buffers<CR>   " 缓冲区列表
nnoremap <silent> <C-f> :Files<CR>         " 文件搜索
nnoremap <silent> <Leader>f :Rg<CR>        " ripgrep 全文搜索
```

#### 配置

```vim
let g:fzf_layout = { 'down': '40%' }          " 在下半部分 40% 区域打开 fzf
```

常用命令：`:Files` 搜文件、`:Rg` 搜内容、`:Buffers` 搜缓冲区。更多命令见 `:help fzf-vim-commands`。

---

### preservim/nerdtree

文件系统树形浏览器，在侧边栏浏览和操作文件。

#### 键盘映射

```vim
nnoremap <leader>n :NERDTreeFocus<CR>   " 聚焦到 NERDTree 窗口
nnoremap <leader>t :NERDTreeToggle<CR>  " 切换 NERDTree 显示/隐藏
```

常用操作：`o` 打开文件、`i`/`s` 分割打开、`m` 文件菜单、`r` 刷新、`I` 切换隐藏文件、`q` 关闭。在 NERDTree 内按 `?` 查看完整帮助。

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
autocmd FileType markdown setlocal conceallevel=2   " 仅对 Markdown 启用语法隐藏
let g:vim_markdown_folding_style_pythonic = 1       " 使用 Python 风格折叠
let g:vim_markdown_override_foldtext = 0            " 不覆盖折叠文本显示
let g:vim_markdown_no_default_key_mappings = 1      " 禁用默认键盘映射
let g:vim_markdown_math = 1                         " 启用 LaTeX 数学公式支持
let g:vim_markdown_frontmatter = 1                  " YAML 前置元数据高亮
let g:vim_markdown_toml_frontmatter = 1             " TOML 前置元数据高亮
let g:vim_markdown_json_frontmatter = 1             " JSON 前置元数据高亮
let g:vim_markdown_strikethrough = 1                " 删除线支持
let g:vim_markdown_borderless_table = 1             " 无边框表格支持
" let g:vim_markdown_new_list_item_indent = 2       " 列表新条目自动缩进宽度
```

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

#### 常用命令

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
