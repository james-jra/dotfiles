"!!! If you use Neo-VIM, you're looking for ~/.config/nvim/init.vim !!!"
" ~~ Vundle setup ~~ "
set nocompatible
filetype off

" Init Vim Plug
call plug#begin('~/.local/share/nvim/plugged')

" Plugins - general
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe'

" Plugins - filetypes
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'nathanalderson/yang.vim', { 'for': 'yang' }
Plug 'ambv/black', { 'for': 'python' } "Python formatting
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

call plug#end()
filetype plugin indent on

" ~~ Indentation and line length  ~~ "
set colorcolumn=80,100
set textwidth=79
"show existing tab with 2 spaces width
set tabstop=2
"when indenting with > use 2 spaces width
set shiftwidth=2
"on pressing tab, insert 4 spaces
set expandtab
set softtabstop=2
set shiftround

" ~~ Line numbers  ~~ "
set relativenumber
set number
set numberwidth=3

" ~~ Highlighting ~~ "
syntax on
colorscheme peachpuff
set hlsearch
highlight Search ctermbg=DarkGreen ctermfg=black
" Trailing whitespace
let c_space_errors=1
highlight ExtraWhitespace ctermbg=blue guibg=blue
match ExtraWhitespace /\s\+$/
" F5 trims all trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" better spell checking
hi clear SpellBad
hi clear SpellCap
hi SpellBad cterm=undercurl ctermfg=yellow

" ~~ Remember last position when opening file ~~"
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ~~ Keybindings ~~ "
" Sensible backspace
set backspace=indent,eol,start
" No arrow keys
" noremap <Up>    <NOP>
" noremap <Down>  <NOP>
" noremap <Left>  <NOP>
" noremap <Right> <NOP>
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>
" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>
" Ctrl-j/k inserts blank line below/above.
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
" Ctrl-n opens NERDTree
map <C-n> :NERDTreeToggle<CR>
" Ctrl-\ like # but for tags.
set tags=./tags;/
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Ctrl-p opens FZF
set rtp+=$HOME/.fzf
map <C-p> :Files<CR>
" Ctrl-b executes Black - python reformatter
map <C-b> :Black<CR>

" ~~ Statusline ~~ "
" Always on
:set laststatus=2
" start of default statusline
set statusline=%f\ %h%w%m%r\ 

" Syntastic statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" end of default statusline (with ruler)
set statusline+=%=%(%l,%c%V\ %=\ %P%)

" ~~ Syntastic ~~ "
" Global options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=5
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ~~ Filetype specific ~~ "
" Bash
let g:syntastic_sh_checkers = ['shellcheck']

" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" XML
autocmd BufNewFile,BufRead *.cli set filetype=xml
let g:syntastic_xml_checkers = ['xmllint']

" Python
autocmd BufReadPre *.py setlocal textwidth=90 colorcolumn=88
" autocmd BufWritePost *.py execute ':Black'
let g:black_linelength = 88
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args = '--max-line-length=88'

" Rust
autocmd BufReadPre *.rs setlocal textwidth=102 colorcolumn=100
let g:syntastic_rust_checkers = ['cargo']
let g:rust_cargo_check_examples = 1
let g:rust_cargo_check_tests = 1
"let g:rustfmt_command = 'cargo fmt'
"let g:rustfmt_autosave = 1
let g:rust_use_custom_ctags_defs = 1
