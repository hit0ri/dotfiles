let mapleader = ','

" vim-plug: bootstrap --------------------------------------------------
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -sfLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" vim-plug: ------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wellle/tmux-complete.vim'
Plug 'w0rp/ale'
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-sort-motion'
Plug 'tommcdo/vim-exchange'
Plug 'ntpeters/vim-better-whitespace'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
" Plug 'cocopon/iceberg.vim'
" Plug 'junegunn/seoul256.vim'
" Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'
" Plug 'atelierbram/Base2Tone-vim'
" Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-eunuch'
Plug 'sheerun/vim-polyglot'
Plug 'Firef0x/PKGBUILD.vim'
Plug 'zainin/vim-mikrotik'
Plug 'eiginn/iptables-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'vivien/vim-linux-coding-style'
Plug 'vim-scripts/BufOnly.vim'

call plug#end()


" basic settings: ------------------------------------------------------
set termguicolors
set background=dark
let g:seoul256_srgb = 1
let base16colorspace=256
let g:gruvbox_italic = 0
let g:onedark_terminal_italics = 1
let g:nord_italic = 1
let g:nord_comment_brightness = 15
try
    colorscheme gruvbox
catch
    colorscheme desert
endtry

set title
set number
set hidden
set linebreak
set colorcolumn=81
set scrolloff=5
set sidescrolloff=5
set sidescroll=1
set nowrap
set ignorecase
set smartcase
set mouse=h
set path+=**
set inccommand=split
set updatetime=500
set completeopt+=menuone,longest,noinsert,noselect
set shortmess+=c
set noshowmode
set guicursor=
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab


" plugins: -------------------------------------------------------------
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \ 'left': [[ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ]]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }

" --- ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'

" --- deoplete.nvim
let g:deoplete#enable_at_startup = 1

" --- tmux-complete.vim
let g:tmuxcomplete#trigger = ''

" --- fzf.vim
nnoremap <c-p> :Files<cr>
nnoremap <leader>p :Files ~<cr>
nnoremap <leader><cr> :Buffers<cr>

" --- vim-easy-align
" Exclude comments from the ignore groups
let g:easy_align_ignore_groups = ['String']
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
map ga <plug>(EasyAlign)

" --- vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1

" --- vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.js'
let g:closetag_emptyTags_caseSensitive = 1

" --- vim-better-whitespace
let g:better_whitespace_operator = ''

" --- vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_add = '+'
let g:signify_sign_delete = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change = '!'

" --- vim-go
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = 'quickfix'
let g:go_gocode_unimported_packages = 1
let g:go_fmt_fail_silently = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

augroup GoMappings
    autocmd!
    autocmd FileType go nmap <leader>m :<c-u>call <sid>build_go_files()<cr>
    autocmd FileType go nmap <leader>r <plug>(go-run)
    autocmd FileType go nmap <leader>c <plug>(go-coverage-toggle)
    autocmd FileType go nmap <leader>i <plug>(go-info)
augroup END


" functions: -----------------------------------------------------------
au InsertLeave * silent! set nopaste

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

" Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml

" Limit the width of text to 72 characters when editing email
autocmd BufRead /tmp/mutt-* set textwidth=72

" 2 spaces
autocmd FileType javascript setl ts=2 sw=2 sts=2 et
autocmd FileType json       setl ts=2 sw=2 sts=2 et
autocmd FileType vue        setl ts=2 sw=2 sts=2 et

" tabs
autocmd FileType go         setl ts=4 sw=4 sts=0 noet aw

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
nnoremap <silent> gi :<c-u>call <sid>go_indent(v:count1, 1)<cr>
nnoremap <silent> gI :<c-u>call <sid>go_indent(v:count1, -1)<cr>


" mappings: ------------------------------------------------------------
" Seach selected text
vnorem // y/<c-r>"<cr>"

" Replace selected text
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" Reselect visual block after indentation
vnoremap < <gv
vnoremap > >gv

" Press Space to turn off search highlighting and clear any message
nnoremap <silent> <space> :nohlsearch<bar>:echo<cr>

" Move between windows by pressing Ctrl-[h,j,k,l]
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Close all but current buffer
nnoremap <leader>o :BufOnly<cr>
" Close all buffers
nnoremap <leader>O :bufdo bd<cr>

" Don't jump to next match when searching for word under the cursor
nnoremap * *``
