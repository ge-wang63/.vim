# vim设定

## 插件

### Plug 'junegunn/fzf.vim'

#### 语法
- ^ 表示前缀精确匹配。要搜索一个以"welcome"开头的短语：^welcom。
- $ 表示后缀精确匹配。要搜索一个以"my friends"结尾的短语：friends$。
- ' 表示精确匹配。要搜索短语"welcom my friends"：'welcom my friends。
- | 表示"或者"匹配。要搜索"friends"或"foes"：friends | foes。
- ! 表示反向匹配。要搜索一个包含"welcome"但不包含"friends"的短语：welcome !friends。

#### 用法
| Command                | List                                                                                  |
| ---                    | ---                                                                                   |
| `:Files [PATH]`        | Files (runs `$FZF_DEFAULT_COMMAND` if defined)                                        |
| `:GFiles [OPTS]`       | Git files (`git ls-files`)                                                            |
| `:GFiles?`             | Git files (`git status`)                                                              |
| `:Buffers`             | Open buffers                                                                          |
| `:Colors`              | Color schemes                                                                         |
| `:Ag [PATTERN]`        | [ag][ag] search result (`ALT-A` to select all, `ALT-D` to deselect all)               |
| `:Rg [PATTERN]`        | [rg][rg] search result (`ALT-A` to select all, `ALT-D` to deselect all)               |
| `:RG [PATTERN]`        | [rg][rg] search result; relaunch ripgrep on every keystroke                           |
| `:Lines [QUERY]`       | Lines in loaded buffers                                                               |
| `:BLines [QUERY]`      | Lines in the current buffer                                                           |
| `:Tags [QUERY]`        | Tags in the project (`ctags -R`)                                                      |
| `:BTags [QUERY]`       | Tags in the current buffer                                                            |
| `:Marks`               | Marks                                                                                 |
| `:Jumps`               | Jumps                                                                                 |
| `:Windows`             | Windows                                                                               |
| `:Locate PATTERN`      | `locate` command output                                                               |
| `:History`             | `v:oldfiles` and open buffers                                                         |
| `:History:`            | Command history                                                                       |
| `:History/`            | Search history                                                                        |
| `:Snippets`            | Snippets ([UltiSnips][us])                                                            |
| `:Commits [LOG_OPTS]`  | Git commits (requires [fugitive.vim][f])                                              |
| `:BCommits [LOG_OPTS]` | Git commits for the current buffer; visual-select lines to track changes in the range |
| `:Commands`            | Commands                                                                              |
| `:Maps`                | Normal mode mappings                                                                  |
| `:Helptags`            | Help tags <sup id="a1">[1](#helptags)</sup>                                           |
| `:Filetypes`           | File types

#### 键盘映射
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
