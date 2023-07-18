call plug#begin('~/.vim/plugged')
  Plug 'luochen1990/rainbow'
  Plug 'ap/vim-css-color'
  Plug 'altercation/vim-colors-solarized'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers.
  Plug 'junegunn/vim-peekaboo'
  Plug 'sheerun/vim-polyglot'
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

" >> vim-markdown start >>
" 禁用折叠
let g:vim_markdown_folding_disabled = 1
" << vim-markdown end <<
