# CODEX.md

这是 Codex CLI 的 Vim 配置仓库工作副本。

## 项目说明

此仓库是个人 Vim 配置，使用 Vim 8 原生 package 管理 + Git Submodules。

## 配置入口

- `vimrc` — 通用 Vim 设置、键位映射、自动命令
- `plugin/plugins.vim` — 各插件的 `g:` 变量和键位映射

## 注意事项

- 插件位于 `pack/all/start/`，为 Git Submodules，修改需通过 upstream
- 无 swap/backup 文件，依赖 Git 做版本管理
- 剪贴板共享：`clipboard+=unnamed`
