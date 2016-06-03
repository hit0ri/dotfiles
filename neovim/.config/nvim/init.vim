" Change the cursor shape to a pipe in insert-mode, and a block in normal-mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let mapleader = ','

" Plugins ---------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-eunuch'
    Plug 'jiangmiao/auto-pairs'
    Plug 'christoomey/vim-sort-motion'
    Plug 'junegunn/vim-easy-align'
    Plug 'tommcdo/vim-exchange'
    Plug 'Shougo/deoplete.nvim', { 'do': 'vim +UpdateRemotePlugins +qall' }
    Plug 'airblade/vim-gitgutter'
    Plug 'benekastah/neomake'
    Plug 'godlygeek/tabular'
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'sheerun/vim-polyglot'
    Plug 'Firef0x/PKGBUILD.vim'
    Plug 'zainin/vim-mikrotik'
    Plug 'moll/vim-node'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'chriskempson/base16-vim'
call plug#end()


" Plugin settings -------------------------------------------------------------
" Disable highlighting matched parenthesis
let g:loaded_matchparen = 1

" ### plug
let g:plug_window = 'new'

" ### deoplete
let g:deoplete#enable_at_startup = 1
" Automatically close the scratch window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ### neomake
autocmd! BufWritePost * Neomake

" ### airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = '|'
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = '|'
let g:airline_theme = 'base16_ocean'

" ### indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" ### ctrlp
" Set the default opening command
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1
" Set layout
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
nnoremap <Leader>p :CtrlP ~<cr>
nnoremap <c-b> :CtrlPBuffer<cr>

" ### base16-vim
let base16colorspace = 256

" ### vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" General settings ------------------------------------------------------------
syntax on
filetype indent plugin on
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
colorscheme base16-ocean
set background=dark

set title
set number
set relativenumber
set hidden
set linebreak
set colorcolumn=80
set scrolloff=5
set sidescrolloff=5
set sidescroll=1
set nowrap
set smartcase
set ignorecase
set mouse=h

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 et
autocmd FileType yaml   setlocal ts=2 sts=2 sw=2 et noai nosr
autocmd FileType html   setlocal ts=2 sts=2 sw=2 et

" Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml

" Limit the width of text to 72 characters when editing email
autocmd BufRead /tmp/mutt-* set textwidth=72


" Functions -------------------------------------------------------------------
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

" Reload config on save
" augroup VimReload
"     autocmd!
"     autocmd BufWritePost $MYVIMRC source $MYVIMRC
" augroup END


" Mappings --------------------------------------------------------------------
" Search vim help for subject under cursor (K)
set keywordprg=:help

" Seach selected text
vnorem // y/<c-r>"<cr>"

" Replace selected text
vnoremap <c-r> "hy:%s/<c-r>h//gc<Left><Left><Left>

" Press Space to turn off search highlighting and clear any message
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<cr>

" Move between windows by pressing Ctrl-[h,j,k,l]
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Open last buffer
nnoremap <Leader><Leader> <c-^>
" Close active buffer
nnoremap <Leader>b :bw<cr>
nnoremap <Leader>o :only<cr>

