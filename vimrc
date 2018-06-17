" ~~ Vundle setup ~~ "
set nocompatible
filetype off

" Init Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins - general
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'

" Plugins - filetypes
Plugin 'elzr/vim-json'
Plugin 'derekwyatt/vim-scala'
Plugin 'nathanalderson/yang.vim'
Plugin 'ambv/black' "Python formatting
Plugin 'rust-lang/rust.vim'

call vundle#end()
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
set hlsearch
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
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
" Ctrl-j/k inserts blank line below/above.
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
" Ctrl-n opens NERDTree
map <C-n> :NERDTreeToggle<CR>
" Ctrl-\ like # but for tags.
set tags=./tags;/
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Ctrl-p opens FZF
set rtp+=/data/jra/.fzf
map <C-p> :Files<CR>
" Ctrl-b executes Black - python reformatter
map <C-b> :Black<CR>

" ~~ Syntastic ~~ "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Global options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open = 1
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
autocmd BufReadPre *.py setlocal textwidth=99 colorcolumn=88
" autocmd BufWritePost *.py execute ':Black'
let g:black_linelength = 99
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args = '--max-line-length=88'

" Rust
let g:syntastic_rust_checkers = ['rustc']
let g:rustfmt_autosave = 1
