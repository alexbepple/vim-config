set nocompatible

" Init Vundle
    set rtp+=~/.vim/vundle.git
    call vundle#rc()

    Bundle 'msanders/snipmate.vim.git'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-rails'
    Bundle 'tpope/vim-cucumber'


" Pathogen for local bundles
    Bundle 'tpope/vim-pathogen'
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


" Snappily open stuff
    Bundle 'FuzzyFinder'
    " L9 is a dependency of FuzzyFinder
    Bundle 'L9'

    nnoremap f<space> :FufBuffer<cr>
    vnoremap f<space> <esc>:FufBuffer<cr>
    nnoremap ff :FufFile<cr>
    vnoremap ff <esc>:FufFile<cr>
    nnoremap fr :FufRenewCache<cr>
    nnoremap fj :FufJumpList<cr>

    let g:fuf_abbrevMap = {}


" Pensieve
    command! -range=% RemoveSlashes :<line1>,<line2>s/\/\///gc
    command! -range=% FixLinebreaks :<line1>,<line2>s/\r//
    command! -range=% ReplaceAsterisksWithIndents :<line1>,<line2>s/^\* /    /c

    " Begin pensieve queries with a space
    let g:fuf_abbrevMap['^ '] = ['~/.pensieve/']


" Comments
    Bundle 'scrooloose/nerdcommenter'

    nnoremap <silent> zz :call NERDComment(0, "toggle")<cr>
    vnoremap <silent> zz <ESC>:call NERDComment(1, "toggle")<cr>


" Moving around
    Bundle 'camelcasemotion'
    Bundle 'Lokaltog/vim-easymotion'

    " Faster paging
    nnoremap <d-k> <pageup>
    nnoremap <d-j> <pagedown>

    set scrolloff=2 "Always keep a distance of two lines when scrolling

    " Navigate wrapped lines more conveniently
    map j gj
    map k gk
    map 0 g0
    map $ g$


" Wrap lines
    set linebreak "Only wrap at sensible points
    "How wrapped lines should begin
    set showbreak=…\ \ \ \ \ \  


" Easily add empty lines
    " <a-o>
    nnoremap ø o<esc>
    " <a-O>
    nnoremap Ø O<esc>


" Split lines
    nnoremap S i<cr><esc>


" Appearance
    Bundle 'altercation/vim-colors-solarized'
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


" Moving lines
    " <a-j>
    nnoremap º :m+<CR>
    " <a-k>
    nnoremap ∆ :m-2<CR>
    inoremap º <Esc>:m+<CR>
    inoremap ∆ <Esc>:m-2<CR>
    vnoremap º :m'>+<cr>gv
    vnoremap ∆ :m-2<cr>gv


" More convenient (un)indenting
    nnoremap <tab> >>
    vnoremap <tab> >gv
    " <a-l>
    nnoremap @ >>
    vnoremap @ >gv
    " <a-h>
    nnoremap ª <<
    vnoremap ª <gv


" Surround with
    Bundle 'tpope/vim-surround'
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

    noremap -- :set invmacmeta<cr>

    " Allow folder-specific vimrc files
    set exrc


" The plugin managers need to toggle the filetype plugin off and back on
    filetype off
    filetype plugin indent on


" Prevent dangerous commands in external vimrc files. Last setting in vimrc
    set secure 

