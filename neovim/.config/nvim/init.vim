" Change the cursor shape to a pipe in insert-mode, and a block in normal-mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let mapleader = ','


"
" Plugins
"
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

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
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
    Plug 'airblade/vim-gitgutter'
    Plug 'w0rp/ale'
    Plug 'godlygeek/tabular'
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'Yggdroot/indentLine'
    " Syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'Firef0x/PKGBUILD.vim'
    Plug 'zainin/vim-mikrotik'
    Plug 'moll/vim-node'
    Plug 'eiginn/iptables-vim'
    " Colors
    Plug 'morhetz/gruvbox'
call plug#end()



"
" Plugin settings
"

""" plug
let g:plug_window = 'new'


""" deoplete
let g:deoplete#enable_at_startup = 1
" Automatically close the scratch window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


""" airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'


""" indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1


""" nerdtree
map <C-n> :NERDTreeToggle<CR>


""" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""" fzf
if has('nvim')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader><cr> :Buffers<CR>
nnoremap <silent> <Leader>ag   :Ag <C-R><C-W><cr>
nnoremap <silent> <Leader>AG   :Ag <C-R><C-A><cr>
nnoremap <silent> <Leader>`    :Marks<cr>


""" polyglot
let g:polyglot_disabled = ['yaml']



"
" General settings
"

" Colorscheme
syntax on
filetype indent plugin on
set termguicolors
set background=dark
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
let g:airline_theme = 'gruvbox'

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml

" Limit the width of text to 72 characters when editing email
autocmd BufRead /tmp/mutt-* set textwidth=72



"
" Functions
"

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

" gi / gI | go to next/previous indentation level
function! s:indent_len(str)
    return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction
function! s:go_indent(times, dir)
    for _ in range(a:times)
        let l = line('.')
        let x = line('$')
        let i = s:indent_len(getline(l))
        let e = empty(getline(l))

        while l >= 1 && l <= x
            let line = getline(l + a:dir)
            let l += a:dir
            if s:indent_len(line) != i || empty(line) != e
                break
            endif
        endwhile
        let l = min([max([1, l]), x])
        execute 'normal! '. l .'G^'
    endfor
endfunction
nnoremap <silent> gi :<c-u>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> gI :<c-u>call <SID>go_indent(v:count1, -1)<cr>



"
" Mappings
"

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

""" Buffers
" Create new buffer
nnoremap <Leader>T :enew<cr>
" Switch to the next/previous buffer
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
" Open last buffer
" nnoremap <Leader><Leader> <c-^>
" Close active buffer
nnoremap <Leader>b :bd<cr>
" Force close active buffer
nnoremap <Leader>B :bd!<cr>
" Close all buffers
nnoremap <Leader>O :bufdo bd!<cr>

" Save file with sudo
command W execute 'silent w !sudo tee % > /dev/null' | edit!

