set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'             " Syntax Checker
Plugin 'scrooloose/nerdtree'              " Directory Tree
"Plugin 'jistr/vim-nerdtree-tabs'          " Support for Tree with Tabs
Plugin 'Xuyuanp/nerdtree-git-plugin'      " Git statuses for files in tree
Plugin 'vim-airline/vim-airline'          " Statusline
Plugin 'vim-airline/vim-airline-themes'   " Statusline
Plugin 'bling/vim-bufferline'             " Show open buffers in Statusline
Plugin 'tpope/vim-fugitive'               " Git Wrapper
Plugin 'tpope/vim-sensible'               " Sensible Defaults and Utilities
Plugin 'tpope/vim-surround'               " Tools for surrounding things (qoutes, brackets, etc)
Plugin 'tpope/vim-repeat'                 " Allows repeating plugin commands with .
Plugin 'tpope/vim-speeddating'            " Allows incrementing/decrementing dates
Plugin 'tpope/vim-commentary'             " Tools for commenting/uncommenting things
Plugin 'tpope/vim-rails'                  " Tools for rails development
Plugin 'djoshea/vim-autoread'             " Automatically reload files that are changed on disk
Plugin 'ctrlpvim/ctrlp.vim'               " File finder and navigation

call vundle#end()            " required
filetype plugin indent on    " required


" Color Settings
syntax enable

" Airline Settings
set t_Co=256
set laststatus=2
set ttimeoutlen=0
set noshowmode
let g:airline#extensions#syntastic#enabled = 1

" for nice terminals:
"set encoding=utf8
"let g:airline_powerline_fonts = 1
"let g:airline_powerline_symbols='fancy'

" for basic terminals:
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_wa = 1
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of a variable in void context'}

nnoremap <C-t> :SyntasticToggleMode<CR>

" Terminal Mappings
map <ESC>[A <C-Up>
map <ESC>[B <C-Down>
map <ESC>[C <C-Right>
map <ESC>[D <C-Left>

" Vim Settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set mouse=a
set relativenumber
set backspace=2
set colorcolumn=120
set hidden
set incsearch
:command Q q
:command W w

" File Tree
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
noremap <C-T> :NERDTreeToggle<CR>
noremap <C-G> :NERDTreeFind<CR>

" Buffer Navigation
nnoremap <C-F> :edit<SPACE>
nnoremap <C-X> :bd<CR>
nnoremap <C-Up> :bfirst<CR>
nnoremap <C-Down> :blast<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprevious<CR>

" Remove Trailing Whitespace
nnoremap <C-W> :%s/\s\+$//e<CR>

" Toggle expandtab
function! ExpandTabToggle()
  if(&expandtab == 1)
    set noexpandtab
    echo "Using Tabs"
  else
    set expandtab
    echo "Using Spaces"
  endif
endfunc
nnoremap <C-E> :call ExpandTabToggle()<CR>
inoremap <C-E> :call ExpandTabToggle()<CR>

" Toggle paste mode
function! PasteModeToggle()
  if(&paste == 1)
    set nopaste
  else
    set paste
  endif
endfunc
nnoremap <C-L> :call PasteModeToggle()<CR>
inoremap <C-L> :call PasteModeToggle()<CR>

" Line number Settings
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    echo "Disabled Relative Numbering"
  else
    set relativenumber
    echo "Enabled Relative Numbering"
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<CR>
:au FocusLost * :set norelativenumber
:au FocusGained * :set relativenumber

" Hide line numbers
function! HideNumbersToggle()
  if(&number == 1)
    set nonumber
    set norelativenumber
    echo "Hiding Line Numbers"
  else
    set number
    set relativenumber
    echo "Showing Line Numbers"
  endif
endfunc
nnoremap <C-h> :call HideNumbersToggle()<CR>

