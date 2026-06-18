# AGENTS.md

这是 Hermes Agent 的 Vim 配置仓库工作副本（`agent/hermes` 分支）。

## 项目概述

个人 Vim 8+ 配置仓库，原生 `packpath` + Git Submodule 管理 13 个插件，面向日常编码与文档编辑。

## 文件布局

```
~/.vim/
├── vimrc                        # 核心配置（编辑入口）
├── plugin/
│   └── plugins.vim              # 插件配置（编辑入口）
├── pack/all/start/              # 13 个插件（Git Submodules，详见 README.md）
├── .gitmodules                  # Submodule 定义
├── .gitignore
├── README.md                    # 用户文档（安装指引、完整插件说明）
└── AGENTS.md                    # 本文件
```

完整插件列表见 `README.md` 或 `git submodule status`。

## 配置分层

| 文件 | 职责 | 内容 |
|------|------|------|
| `vimrc` (219 行) | 通用设置 | Leader 键、缩进、搜索、窗口导航、autocmd、CleanExtraSpaces() |
| `plugin/plugins.vim` (90 行) | 插件配置 | `g:` 变量、`nnoremap` 映射、`autocmd FileType` |

修改原则：
- 通用行为改 `vimrc`
- 插件特定设置改 `plugin/plugins.vim`
- 两个文件都用 `" >> plugin-name start >>` / `" << plugin-name end <<` 注释块标记边界

## 插件管理

### 查看状态
```bash
cd ~/.vim && git submodule status
```

### 添加插件
```bash
git submodule add <url> pack/all/start/<name>
git add .gitmodules pack/all/start/<name>
git commit -m "plugins: add <name>"
```

### 移除插件
```bash
git submodule deinit pack/all/start/<name>
git rm pack/all/start/<name>
git commit -m "plugins: remove <name>"
```
同时在 `plugin/plugins.vim` 中移除对应配置块。

### 更新插件
```bash
git submodule update --remote --recursive
git add pack/all/start/
git commit -m "plugins: update all submodules"
```

## 关键约定

| 设置 | 值 |
|------|-----|
| Leader key | `<Space>` |
| 缩进 | 2 spaces, `expandtab` |
| 配色 | Solarized Dark, 256-color |
| 搜索后端 | `rg --vimgrep --smart-case --follow` |
| 备份/swap | 关闭（依赖 Git） |
| 行号 | `nu` + `rnu`（混合行号） |
| 剪贴板 | `clipboard+=unnamed`（共享系统剪贴板） |

### 键盘映射速查

| 映射 | 功能 |
|------|------|
| `jj` | 退出插入/可视模式 |
| `<Esc><Esc>` | 清除搜索高亮 |
| `<C-h/j/k/l>` | 窗口间移动 |
| `<C-f>` | fzf 文件搜索 |
| `<Leader>f` | ripgrep 全文搜索 |
| `<Leader>b` | 缓冲区列表 |
| `<Leader>t` | NERDTree 开关 |
| `<Leader>n` | NERDTree 聚焦 |
| `<C-n>` / `<C-p>` | 粘贴历史轮换（vim-yoink） |
| `<Up/Down/Left/Right>` | 已禁用（强制 hjkl） |

### 自动命令

- 外部修改文件时自动重读（`FocusGained`, `BufEnter`）
- 保存时清理行尾空格（`.txt .js .py .wiki .sh .coffee .md`）
- Markdown 文件设置 `conceallevel=2`

## 约束

1. **禁止引入第三方插件管理器** — 只用 Vim 8 原生 `packpath`
2. **禁止修改 pack/all/start/ 下插件源码** — 插件通过 submodule 锁定上游版本，不应本地修补
3. **禁止直接 push agent 分支** — `agent/*` 是本地分支，不推送到远程
4. **插件配置必须在 `plugin/plugins.vim`** — 不在 `vimrc` 中混杂插件特定设置
5. **README.md 是用户文档** — 安装指引、插件详细说明放 README；AGENTS.md 是 agent 工作指令，两者不重复
6. **依赖工具需系统安装** — fzf CLI、ripgrep、Powerline 字体不是 submodule，是系统级依赖（README 中有安装说明）
