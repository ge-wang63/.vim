个人 Vim 配置仓库（Vim 8+ / Neovim 兼容）。不引入第三方插件管理器，纯靠原生 `packpath` + Git Submodule 管理 13 个插件，面向日常编码与文档编写。

## 架构

Vim 8 原生包机制：`pack/all/start/` 下的目录在 Vim 启动时自动加载。所有插件以 Git Submodule 形式锁定版本，不经过 upstream 仓库同意不直接修改 submodule 内容。

```
~/.vim/
├── vimrc                    # 通用设置、键位映射、自动命令、函数
├── plugin/plugins.vim       # 插件级 g: 变量与键位映射
├── pack/all/start/          # 13 个 Git Submodule 插件
├── .gitignore               # macOS、Agent 产物、Vim 临时文件
├── .gitmodules              # Submodule 定义（upstream URL + commit SHA）
└── README.md                # 面向用户的安装与使用说明
```

两个配置入口不重复定义对方内容：`vimrc` 管通用行为，`plugin/plugins.vim` 管插件。

## 插件清单

| 插件 | 用途 |
|------|------|
| fzf.vim | 模糊查找文件 (`<C-f>`)、Buffer (`<Space>b`)、Rg 搜索 (`<Space>f`) |
| NERDTree | 文件树导航 (`<Space>n` 聚焦，`<Space>t` 切换) |
| vim-airline + airline-themes | 状态栏 + 标签栏（主题 `luna`，Powerline 字体） |
| vim-colors-solarized | Solarized Dark 配色 |
| vim-polyglot | 多语言语法高亮集合 |
| vim-markdown | Markdown 语法增强、折叠 |
| rainbow | 彩虹括号匹配 |
| vim-surround | 环绕字符操作 (ys/ds/cs) |
| vim-yoink | 粘贴历史 (`<C-n>`/`<C-p>` 切换粘贴项) |
| vim-peekaboo | 寄存器内容预览 |
| tabular | 按分隔符对齐文本 |
| vim-css-color | CSS 颜色值预览 |

## 核心约定

- **Leader** `<Space>` — FZF 命令、NERDTree 切换
- **Escape** `jj`（insert 与 visual 模式均可用）
- **方向键禁用** — 全部映射到 `<Nop>`，强制 `hjkl` 导航
- **缩进** 2 空格 expandtab，`shiftwidth=2` `tabstop=2`
- **搜索** `ignorecase` + `smartcase`，高亮结果，`<Esc><Esc>` 清除高亮
- **grep** 外部用 `rg --vimgrep --smart-case --follow`
- **窗口分割** `splitbelow` + `splitright`，`<C-hjkl>` 在窗格间移动
- **剪贴板** `clipboard+=unnamed`（与系统剪贴板共享）
- **无 swap/backup** — `noswapfile` `nobackup` `nowb`，依赖 Git 做历史管理
- **配色** Solarized Dark，256 色终端
- **自动命令组** `vimrc_config` — 文件外部变更检测 (`autoread + checktime`)、保存时清理行尾空格

## Git 模型

- **main 分支** 受保护（禁止直接 push），通过 PR 合并
- **Agent 分支**（`agent/codex`、`agent/hermes`）仅存在于本地 worktree，不推送到远程
- **Worktree 隔离** Agent 各自的配置文件（CODEX.md、AGENTS.md 等）通过 `.gitignore` 排出版本库，避免多 agent 协作时的合并冲突
- **Commit message** 英文，结构化 bullet points，格式如 `vimrc: add xxx setting`

## 对此仓库的操作约束

- 插件修改一律走 upstream，不在 submodule 内直接编辑
- 新增插件走 `git submodule add` 流程，同步更新 `.gitmodules`
- 修改 `vimrc` 时注意 section 注释的结构（每个 section 用双引号框起）
- 修改 `plugin/plugins.vim` 时保持 `>> xxx start >>` / `<< xxx end <<` 的分段格式
- Agent 分支合并 main 时注意：worktree 的 git 元数据在 `~/.vim/.git/worktrees/codex/`，需提权执行 `git merge`
- 不要修改 `README.md` 中面向用户的安装与使用说明（该文件面向 Vim 用户，非 Agent 指令）
