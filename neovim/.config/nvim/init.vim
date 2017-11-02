let mapleader = ','


"
" Plugins
"
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

" Bootstrap vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-unimpaired'
    Plug 'jiangmiao/auto-pairs'
    Plug 'christoomey/vim-sort-motion'
    Plug 'junegunn/vim-easy-align'
    Plug 'tommcdo/vim-exchange'
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
    Plug 'airblade/vim-gitgutter'
    Plug 'w0rp/ale'
    Plug 'godlygeek/tabular'
    Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'alvan/vim-closetag'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'jremmen/vim-ripgrep'
    " Languages
    Plug 'sheerun/vim-polyglot'
    Plug 'Firef0x/PKGBUILD.vim'
    Plug 'zainin/vim-mikrotik'
    Plug 'eiginn/iptables-vim'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'zchee/deoplete-go',
    Plug 'Shougo/neco-vim',
    " Plug 'sebastianmarkow/deoplete-rust'
    Plug 'AndrewRadev/splitjoin.vim'
    " Colors
    Plug 'chriskempson/base16-vim'
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

""" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1

""" deoplete-rust
let g:deoplete#sources#rust#racer_binary='/home/hitori/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/hitori/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'


""" airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'


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


""" CtrlP
if executable('rg')
    set grepprg=rg\ --vimgrep
    let g:ctrlp_user_command = "rg %s --files  --hidden --color never --smart-case --glob '!.git/*' --glob '!node_modules/*'"
    let g:ctrlp_use_caching = 0
endif


""" vim-closetag
let g:closetag_filenames = "*.html,*.xhtml,*.xml,*.vue,*.js"
let g:closetag_emptyTags_caseSensitive = 1

""" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

autocmd FileType go nmap <leader>m :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)



"
" General settings
"

" Colorscheme
syntax on
filetype indent plugin on
set termguicolors
set background=dark
try
    let base16colorspace = 256
    colorscheme base16-oceanicnext
catch
    colorscheme desert
endtry
let g:airline_theme = 'base16_oceanicnext'

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
set mouse=h
set path+=**
set inccommand=split

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml

" Limit the width of text to 72 characters when editing email
autocmd BufRead /tmp/mutt-* set textwidth=72

" 2 spaces
autocmd FileType javascript setl ts=2 sw=2 sts=2 et
autocmd FileType vue setl ts=2 sw=2 sts=2 et

" tabs
autocmd FileType go setl ts=4 sw=4 sts=0 noet aw



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
" Close active buffer
nnoremap <Leader>b :bd<cr>
" Force close active buffer
nnoremap <Leader>B :bd!<cr>
" Close all buffers
nnoremap <Leader>O :bufdo bd!<cr>

" Save file with sudo
command W execute 'silent w !sudo tee % > /dev/null' | edit!

