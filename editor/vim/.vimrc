" The following lines are required by vundle vim plugin manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" All plugins should be placed here
Plugin 'The-NERD-tree'
Plugin 'davidhalter/jedi-vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'ryanoasis/vim-devicons'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mileszs/ack.vim'
Plugin 'dense-analysis/ale'
Plugin 'dbeniamine/cheat.sh-vim'
Plugin 'tpope/vim-commentary' " block comment with gc shortcut
Bundle 'ruanyl/vim-gh-line'
Plugin 'morhetz/gruvbox'
Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'junegunn/fzf.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'mgedmin/coverage-highlight.vim'
Plugin 'python-rope/ropevim'
" Async completetion
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'wellle/tmux-complete.vim'
Plugin 'tpope/vim-fugitive'


call vundle#end()

" Autoreload vimrc
" autocmd bufwritepost .vimrc source $MYVIMRC

" change the mapleader from \ to ,
let mapleader = ","

" Colorscheme
colo gruvbox
:set background=dark

" Syntax coloring and filetype detection
syntax on
filetype plugin indent on

" utf-8 encoding
set encoding=utf-8
set guifont=Fira\ Code:h12

" Show line numbers
set number

filetype plugin indent on " filetype detection
set ttyfast " Improves scroll performance

" Better saving
"noremap <Leader>s :update<CR>
"noremap <Leader>e :quit<CR>

" Working with tabs
noremap <Leader>t :tabnew<CR>
noremap <Leader>n :tabnext<CR>
noremap <Leader>p :tabprevious<CR>

" search
set hlsearch " Highlight search matches
set incsearch " Incremental search
nnoremap <silent> <C-l> :nohl<CR><C-l> " <Ctrl-l> redraws the screen and removes any search highlighting.


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
nnoremap <space> za

" Open the filesystem tree with Ctrl+X
map <C-x> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" show hidden files
let NERDTreeShowHidden=1
"autocmd VimEnter * NERDTree

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

let g:multi_cursor_select_all_word_key="<C-a>"

" Key maps for surrounding words
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>q( ciw()<Esc>P
nnoremap <Leader>q{ ciw{}<Esc>P

" Jumping commands
command Class Ack! "class "<cword>
command Def Ack! "def "<cword>
command Spec Ack! <cword>"\(" | grep "spec.py"

" Replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Ignore line too long error
let g:ale_python_flake8_options="--ignore=E501"

" Testing
command Test :!clear && mamba -f documentation --enable-coverage %
command FindTests :!grep -lr  "\.<cword>" * | grep spec | xargs mambo
command FocusTest :s/with /with f/ | w
command ExecuteTest :!clear && mamba -f documentation --enable-coverage % && read -n1
command UnFocusTest :s/with f/with / | w
noremap <F2> :Test<CR>
noremap <F3> :FocusTest<CR> :ExecuteTest <CR> :UnFocusTest<CR>
noremap <F4> :FindTests<CR>

" Move up/down line
nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+<CR>
inoremap <A-Up> <Esc>:m-2<CR>
inoremap <A-Down> <Esc>:m+<CR>

" ------ Ack / ag
" silver searcher wit ack.vim plugin
let g:ackprg = 'ag --vimgrep --ignore=composer*'
" bind leader + / to find full word under cursor
nnoremap <leader>s :Ack! '\b<cword>\b'<cr>

" Redifine goto stub to avoid collision with another binding
let g:jedi#goto_stubs_command = ""
" Jedi - do not show popup in signatures autocompletetion
let g:jedi#show_call_signatures = "2"
set noshowmode

" ctrp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>uu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

" coverage
noremap <leader>c :HighlightCoverage<CR>

" asyncomplete: user Ctrl+p to auto popup suggestions
let g:asyncomplete_auto_popup = 0
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <C-o>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-o>" : "\<C-h>"

" Key maps for git
noremap <silent>gb :Git blame<CR>
