# AGENTS.md

这是 Hermes Agent 的 Vim 配置仓库工作副本。

## 项目结构

```
~/.vim/
├── vimrc                    # 核心 Vim 配置
├── plugin/
│   └── plugins.vim          # 插件配置
├── pack/all/start/          # Vim 8 原生插件（Git Submodules）
└── ...
```

## 插件管理

- **加载方式**: Vim 8 native packages (`pack/all/start/`)
- **版本控制**: Git Submodules
- **添加插件**: `git submodule add <url> pack/all/start/<name>`
- **移除插件**: `git submodule deinit pack/all/start/<name> && git rm pack/all/start/<name>`
- **更新插件**: `git submodule update --remote --recursive`

## 关键约定

- Leader key: `<Space>`
- 缩进: 2 spaces, expandtab
- 配色: Solarized Dark, 256-color
- 无 swap/backup 文件（`noswapfile`, `nobackup`）
