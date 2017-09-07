set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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

nnoremap <C-t> :SyntasticToggleMode<CR>

" Terminal Mappings
map <ESC>[A <C-Up>
map <ESC>[B <C-Down>
map <ESC>[C <C-Right>
map <ESC>[D <C-Left>

" Vim Settings
set tabstop=4
set softtabstop=4
set number
set mouse=a
set relativenumber
set shiftwidth=4
:command Q q
:command W w

" Tab navigation
nnoremap <C-Up> :tabr<CR>
nnoremap <C-Down> :tabl<CR>
nnoremap <C-Right> :tabn<CR>
nnoremap <C-Left> :tabp<CR>

" Open new Tab
nnoremap <C-F> :tabnew<SPACE>

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
nnoremap <C-E> :call ExpandTabToggle()<cr>

" Toggle paste mode
function! PasteModeToggle()
    if(&paste == 1)
        set nopaste
    else
        set paste
    endif
endfunc
nnoremap <C-P> :call PasteModeToggle()<cr>

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
nnoremap <C-n> :call NumberToggle()<cr>
:au FocusLost * :set norelativenumber
:au FocusGained * :set relativenumber
