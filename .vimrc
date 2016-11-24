filetype plugin indent on
"show existing tab with 2 spaces width
set tabstop=2
"when indenting with > use 2 spaces width
set shiftwidth=2
"on pressing tab, insert 4 spaces
set expandtab
"set linenumbers on
set relativenumber
set number
set numberwidth=3
" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
"nnoremap <silent><C-J> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-K> m`:silent -g/\m^\s*$/d<CR>``:noh<CR> 
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
"map <Up>    <NOP>
"map <Down>  <NOP>
"map <Left>  <NOP>
"map <Right> <NOP>
