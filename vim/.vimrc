set nocompatible
filetype off

let mapleader = ","


" Plugin list: "
" ----------------------------------------------------------------------------
" Install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'mihaifm/bufstop'
Plug 'chrisbra/csv.vim'
Plug 'bling/vim-airline'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Firef0x/PKGBUILD.vim'
Plug 'tejr/vim-nagios'
Plug 'chase/vim-ansible-yaml'
" Plug 'hynek/vim-python-pep8-indent'
" Plug 'nathanaelkane/vim-indent-guides'

" Colorschemes
Plug 'w0ng/vim-hybrid'
" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'whatyouhide/vim-gotham'

call plug#end()
filetype plugin indent on


" Plugin settings: "
" ----------------------------------------------------------------------------
" vim-plug
" -------------------------------------
let g:plug_window = 'new'


" syntastic
" -------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_loc_list_height = 2


" vim-easymotion
" -------------------------------------
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)


" vim-airline
" -------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline_theme = 'tomorrow'
let g:airline#extensions#syntastic#enabled = 1


" vim-ansible-yaml
" -------------------------------------
let g:ansible_options = {'documentation_mapping': '<C-K>'}


" jedi-vim
" -------------------------------------
let g:jedi#force_py_version = 3


" neocomplete.vim
" -------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_camel_case = 1

" key-mappings
inoremap <expr><C-g>     neocomplete#undo_completion()

" Use neocomplete with jedi-vim
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'


" csv.vim
" -------------------------------------
let b:csv_arrange_align = 'lll'



" vim-indent-guides
" -------------------------------------
" let g:indent_guides_start_level = 2


" VIM settings: "
" ----------------------------------------------------------------------------
map <leader>a :BufstopModeFast<CR>


syntax on
set number
set colorcolumn=80
set t_Co=256
colorscheme hybrid
set background=dark
set scrolloff=5
set sidescrolloff=5
set sidescroll=1
set wrap
set linebreak
set wildmenu
set showmatch
" Allow switching buffer even if current buffer contains unsaved changes
set hidden

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

" Limit the width of text to 72 characters when editing email
autocmd BufRead /tmp/mutt-* set textwidth=72

" Remove trailing white spaces on save
" autocmd BufWritePre * :%s/\s\+$//e

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

" Search vim help for subject under cursor
set keywordprg=:help

" Resize buffer
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>"
