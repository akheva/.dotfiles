"
" ~/.config/nvm/init.vim
" vim: fdm=marker

" Options - Compatibility {{{
" -----------------------------------------------------------------------------

set nocompatible           " Prefer Vim defaults over Vi-compatible defaults.
set encoding=utf-8         " Set the character encoding to UTF-8.
filetype plugin indent on  " Enable file type detection.
syntax on                  " Enable syntax highlighting.

"}}}
" Options - Appearance {{{
" -----------------------------------------------------------------------------

set background=dark        " Use colours that look good on a dark background.
set colorcolumn=80         " Show right column in a highlighted colour.
set completeopt-=preview   " Do not show preview window for ins-completion.
set diffopt+=foldcolumn:0  " Do not show fold indicator column in diff mode.
set fillchars+=vert:│      " Use full height bar char as vertical separator.
set history=10000          " Number of commands and search patterns to remember.
set laststatus=2           " Always show status line.
set noshowmode             " Do not show current mode on the last line.
set number                 " Show the line number.
set relativenumber         " Show the line number relative to the cursorline.
set showcmd                " Show command on last line of screen.
set showmatch              " Show matching brackets.
set termguicolors          " Use gui vim colors in terminal vim.
set title                  " Set window title to 'filename [+=-] (path) - VIM'.

"}}}
" Options - Behaviour {{{
" -----------------------------------------------------------------------------

set backspace=2            " Allow <BS> and <Del> over everything.
set hidden                 " Hide when switching buffers instead of unloading.
set mouse=a                " Enable use of the mouse in all modes.
set nowrap                 " Disable word wrap.
set spelllang=en_au        " Check spelling in Australian English
set textwidth=0            " Do not break lines after a maximum width.
set wildmenu               " Use enhanced command-line completion.
set splitbelow             " Set the new split window bottom
set splitright             " Set the new verticle split window right

"}}}
" Options - Folding {{{
" -----------------------------------------------------------------------------

" Default folding options.
set foldignore=            " Do not ignore any characters for indent folding.
set foldlevelstart=99      " Always start editing with all folds open.
set foldmethod=indent      " Form folds by lines with equal indent.
set foldnestmax=10         " Limit fold levels for indent and syntax folding.

" Folding options for specific file types.
autocmd FileType python setlocal foldnestmax=5
autocmd FileType c,cpp,java setlocal foldmethod=syntax foldnestmax=5
autocmd FileType markdown setlocal foldmethod=marker

"}}}
" Options - GUI {{{
" -----------------------------------------------------------------------------

if has('gui_running')
  set guifont=hack\ Regular:h20        " Set the font to use.
  set guioptions=                      " Remove all GUI components and options.
  set guicursor+=a:block-blinkon0      " Use non-blinking block cursor.
  set linespace=8                      " Increase line height spacing by pixels.

  " Paste from PRIMARY
  inoremap <silent> <S-Insert> <Esc>"*p`]a
  " Paste from CLIPBOARD
  inoremap <silent> <M-v> <Esc>"+p`]a
endif

"}}}
" Options - Indents and Tabs {{{
" -----------------------------------------------------------------------------

" Default indent and tab options.
set autoindent             " Copy indent from previous line.
set expandtab              " Replace tabs with spaces in Insert mode.
set shiftwidth=2           " Spaces for each (auto)indent.
set smarttab               " Insert and delete sw blanks in the front of a line.
set softtabstop=2          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=2              " Spaces that a <Tab> in file counts for.

" Indent and tab options for specific file types.
autocmd FileType c,make setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8
autocmd FileType markdown,php setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
"}}}
" Options - Searching {{{
" -----------------------------------------------------------------------------

set hlsearch               " Highlight search pattern results.
set ignorecase             " Ignore case of normal letters in a pattern.
set incsearch              " Highlight search pattern as it is typed.
set smartcase              " Override ignorecase if pattern contains upper case.

"}}}

" Options - Backup, Swaps, and Undos {{{
" -----------------------------------------------------------------------------

set backup                      " Enable Backups
set undofile                    " Enable Undo
set swapfile                    " Enable Swap
set undodir=~/.vim/.undo//      " Set undo directory.
set backupdir=~/.vim/.backup//  " Set backup directory.
set directory=~/.vim/.swp//     " Set swap directory.

" Mappings - General {{{
" -----------------------------------------------------------------------------

" Define <Leader> key.
let mapleader = ','
let maplocalleader = ','

" Exit insert mode.
inoremap jj <esc>

" Switch colon with semi-colon.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Search command history matching current input.
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" Stop the highlighting for the current search results.
nnoremap <leader><leader><Space> :nohlsearch<CR>

" Navigate split windows.
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Navigate buffers.
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap <leader><Tab> :b#<CR>

" Navigate location list.
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Search for trailing spaces and tabs (mnemonic: 'g/' = go search).
nnoremap g/s /\s\+$<CR>
nnoremap g/t /\t<CR>

" Write current file as superuser.
cnoremap w!! w !sudo tee > /dev/null %

"}}}
" Mappings - Toggle Options {{{
" -----------------------------------------------------------------------------

" (mnemonic: 'co' = change option).
nnoremap com :set mouse=<C-R>=&mouse == 'a' ? '' : 'a'<CR><CR>
nnoremap con :set number!<CR>
nnoremap cop :set paste!<CR>
nnoremap cos :set spell!<CR>
nnoremap cow :set wrap!<CR>

"}}}
" Mappings - Clipboard {{{
" -----------------------------------------------------------------------------

" Cut to clipboard.
vnoremap <Leader>x "*x

" Copy to clipboard.
vnoremap <Leader>c "*y
nnoremap <Leader>c :let @*=expand("%:p")<CR>

" Paste from clipboard.
nnoremap <Leader>v "*p
vnoremap <Leader>v "*p
nnoremap <Leader><S-V> "*P
vnoremap <Leader><S-V> "*P

""}}}
" Plugins - Install {{{
" -----------------------------------------------------------------------------

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "CLI fuzzy finder.
Plug 'junegunn/vim-easy-align'        " Text alignment by characters.
Plug 'morhetz/gruvbox'                " Dark colorscheme.
Plug 'plasticboy/vim-markdown'        " Markdown Vim Mode.
Plug 'scrooloose/nerdtree'            " File explorer window.
Plug 'sjl/gundo.vim'                  " Visual undo tree.
Plug 'tpope/vim-commentary'           " Commenting made simple.
Plug 'tpope/vim-fugitive'             " Git wrapper.
Plug 'tpope/vim-repeat'               " Enable repeat for tpope's plugins.
Plug 'tpope/vim-surround'             " Quoting/parenthesizing made simple.
Plug 'vim-airline/vim-airline'        " Pretty statusline.
Plug 'vim-airline/vim-airline-themes' " Pretty statusline themes.
Plug 'Yggdroot/indentLine'            " Viusal indent guidelines.
Plug 'ryanoasis/vim-devicons'         " Adds icons to plugins.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "Adds syntax for nerdtree file extensions.
Plug 'sheerun/vim-polyglot'           " Syntax highlighting.

call plug#end()

"}}}
" Plugin Settings - airline {{{
" -----------------------------------------------------------------------------

" Enable theme and fonts
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1

" Remove powerline separators.
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"}}}
" Plugin Settings - easy-align {{{
" -----------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"}}}
" Plugin Settings - fugitive {{{
" -----------------------------------------------------------------------------

" Toggle git-blame window
nnoremap <Leader>g :Gblame!<CR>

"}}}
" Plugin Settings - fzf {{{
" -----------------------------------------------------------------------------

let g:fzf_layout = { 'down': '10' }

" Use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>p :Files<CR>

"}}}
" Plugin Settings - gundo {{{
"------------------------------------------------------------------------------

let g:gundo_right = 1

nnoremap <Leader>5 :GundoToggle<CR>

"}}}
" Plugin Settings - gruvbox {{{
" -----------------------------------------------------------------------------

try
  colorscheme gruvbox
  highlight! link SignColumn Normal
catch /:E185:/
  " Silently fail if gruvbox theme is not installed.
endtry

"}}}
" Plugin Settings - nerdtree {{{
" -----------------------------------------------------------------------------

" Toggle NERD tree window.
nnoremap <Leader>4 :NERDTreeToggle<CR>

" Startup settings.
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

"}}}
" Plugin Settings - plug {{{
" -----------------------------------------------------------------------------

let g:plug_window = 'topleft new' " Open plug window in a horizontal split.

"}}}
" Pluin Settings - NeoVIM {{{
" -----------------------------------------------------------------------------

let g:python_host_prog = '/Users/rashiemmims/.pyenv/versions/2.7.18/bin/python'
let g:python3_host_prog = '/Users/rashiemmims/.pyenv/versions/3.10.2/bin/python'
