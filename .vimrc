set nocompatible

" Vundle
    filetype off
    set rtp+=~/.vim/vundle.git
    call vundle#rc()

    Bundle 'altercation/vim-colors-solarized'
    Bundle 'tpope/vim-surround'
    Bundle 'msanders/snipmate.vim.git'
    Bundle 'FuzzyFinder'
    " L9 is a dependency of FuzzyFinder
    Bundle 'L9'
    Bundle 'camelcasemotion'
    Bundle 'tpope/vim-fugitive'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'tpope/vim-rails'
    Bundle 'tpope/vim-pathogen'

    filetype plugin indent on

" Pathogen for local bundles
    call pathogen#runtime_append_all_bundles('local_bundles')
    call pathogen#cycle_filetype()

" Search
    set incsearch
    set ignorecase
    noremap // :set invhlsearch<cr>

    " Search for selection
    vnoremap g/ y/<C-R>"<CR>

    set grepprg=ack
    set grepformat=%f:%l:%m

" Tabbing
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab " replaces tabs with spaces
set autoindent

" FuzzyFinder
nnoremap f<space> :FufBuffer<cr>
vnoremap f<space> <esc>:FufBuffer<cr>
nnoremap ff :FufFile<cr>
vnoremap ff <esc>:FufFile<cr>
nnoremap fr :FufRenewCache<cr>
nnoremap fj :FufJumpList<cr>

let g:fuf_abbrevMap = {}
" Begin pensieve queries with a space
let g:fuf_abbrevMap['^ '] = ['~/.pensieve/']


" Comments
nnoremap zm :call CommentLine()<cr>
vnoremap zm :call CommentLine()<cr>gv
nnoremap z<s-m> :call UnCommentLine()<cr>
vnoremap z<s-m> :call UnCommentLine()<cr>gv

" Scrolling and paging

    " Faster paging
    nnoremap <d-k> <pageup>
    nnoremap <d-j> <pagedown>
    
    set scrolloff=2 "Always keep a distance of two lines when scrolling


" Wrap lines

    " Navigate wrapped lines more conveniently
    map j gj
    map k gk
    map 0 g0
    map $ g$

    set linebreak "Only wrap at sensible points
    "How wrapped lines should begin
    set showbreak=.\ \ \ 

" Easily add empty lines
nnoremap <a-o> o<esc>
nnoremap <a-O> O<esc>

" Split lines
nnoremap S i<cr><esc>

" Pensieve
command! -range=% RemoveSlashes :<line1>,<line2>s/\/\///gc
command! -range=% FixLinebreaks :<line1>,<line2>s/\r//
command! -range=% ReplaceAsterisksWithIndents :<line1>,<line2>s/^\* /    /c

" Appearance
set background=dark
colorscheme solarized
set cursorline "Highlight the line the cursor is on

" Completion settings
set wildmode=longest,list "Completes the longest common string, shows list on second press
set wildignore+=*.pyc,*.class


" Change modes more quickly

    inoremap <s-space> <esc>
    cnoremap <s-space> <c-c>
    nnoremap <space> :
    vnoremap <space> <esc>

    " Prevent accidental <F1> presses
    map <f1> <esc>
    imap <f1> <esc>


" Quickly close buffer
nnoremap <a-w> :bd<Enter>

" Moving lines
nnoremap <a-j> :m+<CR>
nnoremap <a-k> :m-2<CR>
inoremap <a-j> <Esc>:m+<CR>
inoremap <a-k> <Esc>:m-2<CR>
vnoremap <a-j> :m'>+<cr>gv
vnoremap <a-k> :m-2<cr>gv

" More convenient (un)indenting
nnoremap <tab> >>
vnoremap <tab> >gv
nnoremap <a-l> >>
vnoremap <a-l> >gv
nnoremap <a-h> <<
vnoremap <a-h> <gv

" Surround with
let mapleader="z"
vnoremap <leader>ed :call EncloseSelectionWith('“', '”')<cr>
vnoremap <leader>gd :call EncloseSelectionWith('„', '“')<cr>
vnoremap <leader>< :call EncloseSelectionWith('«', '»')<cr>

function! ReplaceSelectionWith(replacement)
    exe 'normal gvc'.a:replacement
endfunction
function! EncloseSelectionWith(prefix, ...)
    let suffix = a:0 == 1 ? a:1 : a:prefix
    let enclosedString = a:prefix.GetVisualText().suffix
    call ReplaceSelectionWith(enclosedString)
endfunction
function! GetVisualText()
    exe 'normal gvy'
    return getreg('"')
endfunc

" Quickly edit vimrc
let mapleader=","
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :up<cr>:source %<cr>

" Automatically save everything when losing focus
autocmd FocusLost * :wa
set autowrite

" Misc
set hidden " Hide buffers, instead of closing. Enables unwritten changes, preserves undo.
set noswapfile " The most annoying thing ever.

set macmeta
noremap -- :set invmacmeta<cr>

" Allow folder-specific vimrc files
set exrc
set secure " Prevent dangerous commands in external vimrc files. Last setting in vimrc

