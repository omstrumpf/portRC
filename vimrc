set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required


" Color Settings
syntax enable
let g:solarized_termtrans = 1
set background=light
colorscheme solarized

" Airline Settings
set t_Co=256
set laststatus=2
set ttimeoutlen=0
set noshowmode
let g:airline_powerline_fonts = 0
let g:airline_theme='solarized'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#syntastic#enabled = 1

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
set expandtab
set tabstop=4
set number
set relativenumber
set shiftwidth=4
:set list listchars=tab:\ \ "
:command Q q

" Tab navigation
nnoremap <C-Up> :tabr<CR>
nnoremap <C-Down> :tabl<CR>
nnoremap <C-Right> :tabn<CR>
nnoremap <C-Left> :tabp<CR>

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
