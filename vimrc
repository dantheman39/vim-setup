unlet! skip_defaults_vim
"https://stackoverflow.com/questions/68727274/problems-with-vim-go-and-vimrc
source $VIMRUNTIME/defaults.vim

set tabstop=4
set shiftwidth=4
set expandtab

set number
set splitbelow
set splitright
" call :set list, or :set nolist to show and hide whitespace
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

syntax on

packloadall

autocmd Filetype javascript setlocal ts=2 sw=2
autocmd Filetype json setlocal ts=2 sw=2
autocmd FileType go setlocal ts=8 sw=8 noexpandtab

"Golang, show signature of symbol when cursor is on it
"let g:go_auto_type_info = 1

"Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1

" for coc, use <tab> to trigger completion and navigate to the next complete item
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"inoremap <silent><expr> <Tab>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

colorscheme elflord
"colorscheme industry
"colorscheme iceberg
"colorscheme default

