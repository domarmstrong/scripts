set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

Plugin 'groenewege/vim-less'
Plugin 'othree/yajs.vim.git'
Plugin 'mxw/vim-jsx'

Plugin 'scrooloose/nerdtree.git'
Plugin 'nathanaelkane/vim-indent-guides.git'
" See :help tabular
Plugin 'godlygeek/tabular.git'

call vundle#end()
filetype plugin indent on     " required!

" ----------------------------------------------------------------------------
" NERDTree

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
" let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[
   \ '\.egg$',
   \ '\.py\$class$',
   \ '\.pyc$',
   \ '\.pyo$',
   \ '\.o$',
   \ '\.obj$',
   \ '\.orig$',
   \ '\.so$',
   \ '\.swp$',
   \ '^\.git$'
   \ ]

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
" See http://vim.wikia.com/wiki/Easier_buffer_switching
nnoremap <silent> <F12> :BufExplorer<CR>

" ----------------------------------------------------------------------------
"  Indent guides colours.
" colorscheme sweet_n_sour
nmap <F5> <Leader>ig
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#000000 ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#CCCCCC ctermbg=236
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
" -----------------------------------------------------------------------------

set mouse=a         " enable mouse!
"set cindent
" set cinkeys=0{,0},:,0#,!,!^F
"set autoindent      " auto indents
"set smartindent
set smarttab        " be smart with tabs
set expandtab       " set soft tabs
set tabstop=4       " set tabs to be 8 spaces
set softtabstop=4	" treat spaces like tabs
set shiftwidth=4	" indentation width
set shiftround		" round indents to shiftwidth
set textwidth=0
set wrapmargin=0    " stop adding line breaks in my code
set wrap            " wrap lines visually
set number          " line numbers
syntax on
set autoread        " auto update a file if it has changed
set hlsearch        " highlight search results - :set noh to disable
set scrolloff=5     " dont scroll to the bottom of the view, keep 5 lines above and below the cursor
set backspace=2     " Allow backspace in insert mode
set backspace=indent,eol,start

" Save folds in .vim/view
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
set viewoptions=folds

set t_Co=256
let javaScript_fold=1
set foldlevel=1
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
" Fold colors
hi Folded ctermfg=10
hi Folded ctermbg=235
" Line number colors
hi LineNr ctermfg=220

hi Search cterm=NONE ctermfg=231 ctermbg=124

au FileType make setlocal noexpandtab
au BufEnter *.html setlocal tabstop=2
au BufEnter *.html setlocal softtabstop=2
au BufEnter *.html setlocal shiftwidth=2
au BufLeave,FocusLost * silent! wa   " save buffeds when focus is lost

" au BufEnter *.jas setfiletype javascript
autocmd BufEnter *.jas setfiletype jasper

if &diff
    "I'm only interested in diff colours
    syntax off
    set nospell
endif

" set the backup folder.
set backupdir=~/tmp/backup-vim/,~/tmp/
" set the swap file folder.
set directory=~/tmp/backup-vim/,~/tmp/

map <C-a> :NERDTreeToggle<CR>
" Log filename in status line
noremap <F6> :echo @%<CR>

nmap <Tab> >>
nmap <S-Tab> <<
vmap <Tab> >>
vmap <S-Tab> <<
nmap <Space> za
vmap <Space> za
nmap <F7> do]c
nmap <F8> dp]c
nmap <F9> :xa<return>
nmap <C-t> :w\|! npm test<return>

let @f = '/functionvf{%"ddi{computed: ^hv0"sy$h"dpjVkf{%k	kf{%ko"spa}'

" arduino syntax highlighting
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

" redundant spaces
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/
