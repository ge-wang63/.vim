# vim设定

## 插件

### Plug 'luochen1990/rainbow'

彩虹括号增强版

#### 配置

```
 let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
```

```
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained', "enable rainbow for code blocks only
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], "lisp needs more colors for parentheses :)
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], "the haskell lang pragmas should be excluded
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody', "enable rainbow inside vim function body
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow', "solve the [perl indent-depending-on-syntax problem](https://github.com/luochen1990/rainbow/issues/20)
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], "[vim css color](https://github.com/ap/vim-css-color) compatibility
\		},
\		'css': 0, "disable this plugin for css files
\		'nerdtree': 0, "rainbow is conflicting with NERDTree, creating extra parentheses
\	}
\}
```

- 'guifgs': 一个guifg的列表 (:h highlight-guifg), 即GUI界面的括号颜色, 将按顺序循环使用
- 'guis': 一个gui的列表 (:h highlight-gui), 将按顺序循环使用
- 'ctermfgs': 一个ctermfg的列表 (:h highlight-ctermfg), 即终端下的括号颜色
- 'cterms': 一个cterm的列表 (:h highlight-cterm)
- 'operators': 描述你希望哪些运算符跟着与它同级的括号一起高亮
- 'parentheses': 一个关于括号定义的列表, 每一个括号的定义包含形如以下的部分:  start=/(/, step=/,/, stop=/)/, fold, contained, containedin=someSynNames, contains=@Spell. 各个部分具体含义可参考 :h syntax, 其中 step 为本插件的扩展定义, 表示括号中间需要高亮的运算符.
- 'separately': 针对文件类型(由&ft决定)作不同的配置,未被单独设置的文件类型使用*下的配置,值为0表示仅对该类型禁用插件,值为"default"表示使用针对该类型的默认兼容配置 (注意, 默认兼容配置可能随着该插件版本的更新而改变, 如果你不希望它改变, 那么你应该将它拷贝一份放到你的vimrc文件里).


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
```
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
```
