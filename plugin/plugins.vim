call plug#begin('~/.vim/plugged')
  Plug 'luochen1990/rainbow'
  Plug 'ap/vim-css-color'
  Plug 'altercation/vim-colors-solarized'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers.
  Plug 'junegunn/vim-peekaboo'
  Plug 'sheerun/vim-polyglot'
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'
  Plug 'mzlogin/vim-markdown-toc'
call plug#end()

" >> rainbow config start >>
let g:rainbow_active = 1

let g:rainbow_conf = {
\    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\    'guis': [''],
\    'cterms': [''],
\    'operators': '_,_',
\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\    'separately': {
\        '*': {},
\        'markdown': {
\            'parentheses_options': 'containedin=markdownCode contained', 
\        },
\        'lisp': {
\            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
\        },
\        'haskell': {
\            'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
\        },
\        'vim': {
\            'parentheses_options': 'containedin=vimFuncBody', 
\        },
\        'perl': {
\            'syn_name_prefix': 'perlBlockFoldRainbow', 
\        },
\        'stylus': {
\            'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
\        },
\        'css': 0, 
\        'nerdtree': 0, 
\    }
\}
" << rainbow config end <<

" >> vim-airline start >>
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" << vim-airline end <<

" >> fzf start
" Configuration
let g:fzf_layout = { 'down': '40%' }
" << fzf end

" >> vim-markdown >>
set conceallevel=2
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_borderless_table = 1
" >> vim-markdown >>
