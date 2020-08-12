syntax on
set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells                " Stop sound effects
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab                   " Convert tab character to spaces
set smartindent                 " Best job to indent for you
set nu                          " Line numbers
set nowrap                      " If a line goes our of screen it will not go line below
set smartcase                   " Case sensitive searching
set noswapfile                  " Dont create vim.swp files
set nobackup                    " Dont make a backup
set undodir=~/.vim/undodir      " Store a backup in undo directory
set undofile                    " Store modified file per file in undo directory
set incsearch                   " By the time start searching it highlight results before press enter
set termguicolors
set scrolloff=8
set noshowmode                  " Dont show Vim mode status => replaced by vim-airline

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Column mark
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Pluggins
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'        " Colorscheme
Plug 'sainnhe/gruvbox-material'
Plug 'vim-utils/vim-man'                " Man pages
Plug 'tpope/vim-fugitive'               " Git blames, logs...
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Completer
Plug 'tweekmonster/gofmt.vim'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'zhou13/vim-easyescape'
Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'preservim/nerdcommenter'          " Comments
Plug 'kshenoy/vim-signature'            " Show marks
Plug 'vuciv/vim-bujo'                   " Minimalist TODO list management
" Vim Airline: botton bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-sneak'               " Vim search word given two letters  TODO pensar si cambiarlo a f
Plug 'jiangmiao/auto-pairs'             " Auto open close pairs, best plug of Augost-2020
call plug#end()

""" Theme customization

" Set up powerline fonts to enable cute, non rectangle interface
let g:airline_powerline_fonts = 1
" Show current open buffers as tabs on the top
let g:airline#extensions#tabline#enabled = 1
" Show only last (tail) name of the file on tabs
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Set theme with gruvbox
let g:airline_theme='gruvbox'
" Some gruvbox configurations
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" Disable invert selection, you are wellcome eyes!
let g:gruvbox_invert_selection='0'

" remove the file encoding with Github account
let g:airline_section_y='@PerseoGI'
" remove separators for empty sections
"let g:airline_skip_empty_sections = 1

" Leave colorcheme config here, after airline config
colorscheme gruvbox
set background=dark


" VimBeGood config
let g:vim_be_good_floating = 0

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1


" Allow RipGrep (FZF) to detect the route, search for git repo and optimize searchs
if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

" Configure leader key to spacebar. Leader key allow enter custom user command mode
let mapleader = " "

" Browser tree configuration
let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0  " Disable help info on browser tree
let g:netrw_winsize = 25

" Remap convenient change between windows commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Move among buffers with CTRL (enable g:airline#extensions#tabline#enabled to
" see open buffers)
map <C-L> :bnext<CR>
map <C-H> :bprev<CR>

" Find current word in the project using rg
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" Find a word on project using rg
nnoremap <Leader>ps :Rg<SPACE>

" Open vim help for current word
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>

" Open Undotree
nnoremap <leader>u :UndotreeShow<CR>

"""" File explorers
" GFiles only works with git repo and will only display added files on .git
nnoremap <C-p> :GFiles<CR>
" Files is the best alternative for GFiles when there is no git initialized
nnoremap <Leader>pf :Files<CR>
" Open classical Ex-plorer on the left
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Buffer resizing
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

" Reload vim.init file
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Make Y as it should be!
nnoremap Y y$
" X as a i<backspace>
vnoremap X "_d

inoremap <C-c> <esc>
vnoremap J :m '>+1<CR>gv=gv
" This does not work (man uses K)
vnoremap K :m '<-2<CR>gv=gv

" Visual selection after shifting
vnoremap < <gv
vnoremap > >gv

" Auto close brackets: Plugin ==> jiangmiao/auto-pairs

" Auto indent all file
nnoremap <Leader>i ggVG=<C-o>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace()

" vim-easyescape.vim: escape to normal mode pressing 'jk' or 'kj' at the same time
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100

" Comments map to <C-/> (vim register for '/' is  '_')
nmap <C-_>   <Plug>NERDCommenterToggle
" gv leave selected lines
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" Clipboard config
set clipboard+=unnamedplus
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Copy all file on clipboard
nnoremap <leader>ya gg"+yG<C-o>

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Remember last position in buffer
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ToDo Bujo config
nmap <C-S> <Plug>BujoAddnormal
imap <C-S> <Plug>BujoAddinsert
nmap <C-Q> <Plug>BujoChecknormal
imap <C-Q> <Plug>BujoCheckinsert
let g:bujo#window_width = 70

" Configure wrap mode only on Markdown files
augroup Markdown
    autocmd!
    autocmd FileType markdown set wrap
augroup END

" Vim-man
"map <C-k> <Plug>(Man)

" Custom shortcuts
nnoremap <leader>cl iconsole.log()<left>
