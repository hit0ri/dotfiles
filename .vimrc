set nocompatible
filetype off

let mapleader = ","

" Install vundle:
"git clone --depth=1 https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'godlygeek/tabular'
Plugin 'Shougo/neocomplete.vim'
Plugin 'bling/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'tejr/vim-nagios'
Plugin 'kien/ctrlp.vim'
Plugin 'mihaifm/bufstop'

call vundle#end()
filetype plugin indent on


let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

map <leader>a :BufstopModeFast<CR>


syntax on
set number
set colorcolumn=80
set t_Co=256
colorscheme Tomorrow-Night
"set background=dark


set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

"set timeoutlen=100

" Fix indentation gg=G (Alternative: :retab)

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Restore cursor to file position in previous editing session
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"set pastetoggle=<leader>p
set pastetoggle=<F2>

" Seach selected text
vnorem // y/<c-r>"<cr>"

" Ignore case-sensitive search
set ic

" Highlight search matches
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
