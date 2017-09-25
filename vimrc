execute pathogen#infect()
filetype plugin indent on
set textwidth=79
"show existing tab with 2 spaces width
set tabstop=2
"when indenting with > use 2 spaces width
set shiftwidth=2
"on pressing tab, insert 4 spaces
set expandtab
set softtabstop=2
set shiftround
"set linenumbers on
set relativenumber
set number
set numberwidth=3

let c_space_errors=1
let python_space_errors=1

set hlsearch
" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Git Gud
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
"
" enable folding
set foldmethod=indent
set foldlevel=99

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" recognize markdown files
autocmd BufNewFile,BufRead *.md set filetype=markdown

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_xml_checkers = ['xmllint']
let g:syntastic_rust_checkers = ['rustc']
let g:rustfmt_autosave = 1


map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'

" Spellcheck underlines instead of highlights
hi clear SpellBad
hi SpellBad cterm=undercurl ctermfg=red
