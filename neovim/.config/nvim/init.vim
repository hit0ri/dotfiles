" Use true colors
:let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Change the cursor shape to a pipe in insert-mode, and a block in normal-mode
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let mapleader=","

function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        !cargo build --release
        UpdateRemotePlugins
    endif
endfunction

call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'Shougo/deoplete.nvim'
    Plug 'airblade/vim-gitgutter'
    Plug 'benekastah/neomake'
    Plug 'godlygeek/tabular'
    Plug 'Raimondi/delimitMate'
    Plug 'bling/vim-airline'
    Plug 'easymotion/vim-easymotion'
    Plug 'Firef0x/PKGBUILD.vim'
    Plug 'chase/vim-ansible-yaml'
    Plug 'zainin/vim-mikrotik'
    Plug 'lfilho/cosco.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'moll/vim-node'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
    Plug 'morhetz/gruvbox'
call plug#end()

"------------------------------------------------------------------------------
" ### plug
let g:plug_window='new'

" ### deoplete
let g:deoplete#enable_at_startup=1

" ### neomake
autocmd! BufWritePost * Neomake

" ### airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=0
let g:airline_theme='gruvbox'

" ### easymotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" ### ansible-yaml
let g:ansible_options={'documentation_mapping': '<C-K>'}

" ### cosco
autocmd FileType javascript,css,YOUR_LANG nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,YOUR_LANG inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" ### indent-guides
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1


"------------------------------------------------------------------------------
syntax on
filetype indent plugin on
colorscheme gruvbox
set background=dark

set title
set number
set hidden
set linebreak
set colorcolumn=80
set scrolloff=5
set sidescrolloff=5
set sidescroll=1
set nowrap
set smartcase
set ignorecase

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

" Press Space to turn off search highlighting and clear any message
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

" Seach selected text
vnorem // y/<c-r>"<cr>"

" Search vim help for subject under cursor
set keywordprg=:help

" Resize buffer
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>"
