" The following lines are required by vundle vim plugin manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" All plugins should be placed here
Plugin 'The-NERD-tree'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'vim-syntastic/syntastic'

call vundle#end()

" Autoreload vimrc
" autocmd bufwritepost .vimrc source $MYVIMRC

" No swap file
set noswapfile

" change the mapleader from \ to ,
let mapleader = ","

" Syntax coloring and filetype detection
syntax on
filetype plugin indent on

" utf-8 encoding
set encoding=utf-8

" Show line numbers
set number

" Use mouse
" set mouse=a

" Better saving
"noremap <Leader>s :update<CR>
"noremap <Leader>e :quit<CR>

" Working with tabs
noremap <Leader>t :tabnew<CR>
noremap <Leader>n :tabnext<CR>
noremap <Leader>p :tabprevious<CR>

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
let python_highlight_all = 1

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap f za
nnoremap F zM
set nofoldenable

" Open the filesystem tree with Ctrl+X
map <C-x> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree

" Default golang formater
let g:go_fmt_command = "goimports"

" Remove all trailing spaces on save
" http://vimcasts.org/episodes/tidying-whitespace
function! Preserve(command)
    let _s=@/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" enable js files vim-jsx
let g:jsx_ext_required = 0

"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']

" Testing
command Test :!mamba -f documentation %
command FindTests :!grep -lr  "\.<cword>" * | grep spec | xargs mambo
noremap <F2> :Test<CR>
noremap <F3> :FindTests<CR>
