set nocompatible
filetype off

let mapleader = ","

" Install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'mihaifm/bufstop'
Plug 'chrisbra/csv.vim'
Plug 'itchyny/lightline.vim'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/neocomplete.vim'
" Plug 'hynek/vim-python-pep8-indent'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'bling/vim-airline'
" Plug 'tejr/vim-nagios'

" Colorschemes
Plug 'w0ng/vim-hybrid'
" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'whatyouhide/vim-gotham'

call plug#end()
filetype plugin indent on


let g:plug_window = 'new'


let g:lightline = {
    \ 'colorscheme': '16color',
    \ }
set noshowmode


" let g:airline_powerline_fonts = 0


" let g:jedi#force_py_version = 3


let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_camel_case = 1
" For smart TAB completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" Use neocomplete with jedi-vim
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python =
            \ '\h\w*\|[^. \t]\.\w*'
            " \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'


let b:csv_arrange_align = 'lll'


" let g:indent_guides_start_level = 2

map <leader>a :BufstopModeFast<CR>


syntax on
set number
set colorcolumn=80
set t_Co=256
colorscheme hybrid
" set background=dark
set scrolloff=5
set sidescrolloff=5
set sidescroll=1
set wrap
set linebreak

" Default indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" set shiftround
" set autoindent

" Indentation
autocmd FileType python setlocal ts=4 sts=4 sw=4 et
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et noai nosr
autocmd FileType html setlocal ts=2 sts=2 sw=2 et

" Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml


" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Reload vimrc on save
augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

" set timeoutlen=100

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

" set pastetoggle=<leader>p
set pastetoggle=<F2>

" Seach selected text
vnorem // y/<c-r>"<cr>"

" Ignore case-sensitive search
set ic

" Highlight search matches
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
