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

" >> fzf start >>
" Configuration
let g:fzf_layout = { 'down': '40%' }
" mappings
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" nnoremap <silent> <Leader>/ :BLines<CR>
" nnoremap <silent> <Leader>' :Marks<CR>
" nnoremap <silent> <Leader>g :Commits<CR>
" nnoremap <silent> <Leader>H :Helptags<CR>
" nnoremap <silent> <Leader>hh :History<CR>
" nnoremap <silent> <Leader>h: :History:<CR>
" nnoremap <silent> <Leader>h/ :History/<CR>
" << fzf end <<
"
" >> NERDTree start >>
" mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" << NERDTree end <<

" >> vim-markdown start >>
set conceallevel=2
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
"let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_borderless_table = 1
" << vim-markdown end <<

">> Yoink start start >>
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)
"<< Yoink end end <<
