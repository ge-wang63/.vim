# CLAUDE.md

This is a personal Vim configuration repository using **Vim 8 native package management** (`:help packages`) with **Git Submodules** for plugin version control.

## Project Structure

```
~/.vim/
├── vimrc                    # Core settings: UI, colors, indentation, key mappings, autocmds
├── plugin/
│   └── plugins.vim          # Plugin-specific configuration (keymaps, options, autocmds)
├── pack/all/start/          # Vim 8 native package directory — all dirs here load at startup
│   ├── fzf/ + fzf.vim/      # Fuzzy finder
│   ├── nerdtree/            # File tree sidebar
│   ├── rainbow/             # Rainbow parentheses
│   ├── tabular/             # Text alignment
│   ├── vim-airline/         # Status bar
│   ├── vim-colors-solarized/# Color scheme
│   ├── vim-css-color/       # CSS color preview
│   ├── vim-markdown/        # Markdown syntax
│   ├── vim-markdown-toc/    # Markdown TOC generator
│   ├── vim-peekaboo/        # Register preview
│   ├── vim-polyglot/        # Multi-language syntax bundle
│   ├── vim-surround/        # Surround operations (cs/ds/ys)
│   └── vim-yoink/           # Yank/paste history
├── .gitmodules               # Submodule upstream URLs and paths
├── .gitignore                # Ignores .DS_Store, .claude/, swap files
├── README.md                 # Full user-facing documentation
└── LICENSE                   # Apache 2.0
```

## Plugin Management

- **Loading**: Vim 8 automatically loads any directory under `pack/*/start/` at startup. No third-party plugin manager is used.
- **Version control**: Each plugin is a Git Submodule pinned to a specific upstream commit.
- **Adding a plugin**: `git submodule add <url> pack/all/start/<name>`
- **Removing a plugin**: `git submodule deinit pack/all/start/<name> && git rm pack/all/start/<name>`
- **Updating plugins**: `git submodule update --remote --recursive`

## Configuration conventions

- **Leader key**: `<Space>`
- **Indentation**: 2 spaces, expandtab
- **Color scheme**: Solarized Dark, 256-color terminal
- **Escape alternative**: `jj` in insert/visual mode
- **Arrow keys**: Disabled (force `hjkl` navigation)
- **Clipboard**: `unnamedplus` (shares with system clipboard)
- **No swap/backup files**: Relies on Git for version history
- **Whitespace**: Trailing whitespace auto-cleaned on save for `.txt`, `.js`, `.py`, `.wiki`, `.sh`, `.coffee`, `.md`

## Key Mappings Quick Reference

| Mapping | Action |
|---------|--------|
| `jj` | Exit insert/visual mode |
| `<C-h/j/k/l>` | Move between windows |
| `<C-f>` | fzf file search |
| `<Leader>t` | Toggle NERDTree |
| `<Leader>f` | ripgrep full-text search |
| `<Leader>b` | Buffer list |
| `<Leader>n` | Focus NERDTree |
| `<C-n>` / `<C-p>` | Cycle paste history (yoink) |
| `<Esc><Esc>` | Clear search highlight |

## Editing this repo

- `vimrc` is the main config file — general Vim settings, maps, autocmds
- `plugin/plugins.vim` is for plugin-specific `g:` variables and mappings — keep it separate from `vimrc`
- Plugins are read-only artifacts; only edit files tracked by the parent repo
- Test changes by reloading Vim: `:source ~/.vimrc` or restarting Vim
- Run `git submodule status` to check plugin versions
