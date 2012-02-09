set nocompatible

" Init Vundle
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    
    " Manage Vundle with Vundle
    Bundle 'gmarik/vundle'


" Leaders – as they may affect almost any plugin, they should be first
    let mapleader=","
    let maplocalleader="-"
    " showcmd displays the active leader in the bottom line and thus provides
    " visual feedback
    set showcmd


" Pathogen for local bundles
    Bundle 'tpope/vim-pathogen'
    call pathogen#runtime_append_all_bundles('local_bundle')
    call pathogen#cycle_filetype()


" Search
    set incsearch
    set ignorecase
    noremap // :set invhlsearch<cr>

    " Search for selection
    vnoremap g/ y/<C-R>"<CR>

    Bundle 'alexbepple/ack.vim'
    let g:ack_list_height=40


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
    let g:fuf_keySwitchMatching = '<d-7>'

    nnoremap 77 :FufFile **/<cr>


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


" Git
    Bundle 'tpope/vim-fugitive'
    Bundle 'gregsexton/gitv'


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

    "set ofu=syntaxcomplete#Complete
    "syntax on


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
    " <a-l>
    nnoremap @ >>
    vnoremap @ >gv
    " <a-h>
    nnoremap ª <<
    vnoremap ª <gv

" Put and yank more conveniently
    nnoremap p p`[v`] 
    nnoremap P P`[v`] 
    vnoremap y ygv

" Surround with
    Bundle 'tpope/vim-surround'

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


" Quickly edit .vimrc
    nnoremap <leader>ev :edit ~/computing/vim/vimrc<cr>
    nnoremap <leader>sv :up<cr>:source %<cr>


" Automatically save everything when losing focus
    autocmd FocusLost * :wa
    set autowrite


" Close current buffer – or window when there are no buffers left
    function! NumberOfBuffers()
        let buffers = range(1, bufnr('$'))
        call filter(buffers, 'buflisted(v:val)')
        return len(buffers)
    endfunction

    function! CloseCurrent()
        let bufcount = NumberOfBuffers()
        if (bufcount == 1)
            execute ":q"
        else
            execute ":bd"
        endif
    endfunction

    nnoremap <d-w> :call CloseCurrent()<cr>


" Misc
    set hidden " Hide buffers, instead of closing. Enables unwritten changes, preserves undo.
    set noswapfile " The most annoying thing ever.

    " Allow folder-specific vimrc files
    set exrc

    " I have blocked the normal way of playing macros. This is the new one.
    nnoremap t @

    Bundle 'msanders/snipmate.vim.git'
    Bundle 'sjl/gundo.vim'


" Ruby
    " Select Ruby blocks
    Bundle 'nelstrom/vim-textobj-rubyblock'
    Bundle 'kana/vim-textobj-user'
    runtime macros/matchit.vim

    Bundle 'tpope/vim-cucumber'

    Bundle 'tpope/vim-rails'


" Clojure
    Bundle 'VimClojure'
    let g:vimclojure#ParenRainbow = 1
    let g:vimclojure#DynamicHighlighting = 1

    let vimclojure#WantNailgun = 1


" VSpec
    Bundle 'kana/vim-vspec'


" The plugin managers need to toggle the filetype plugin off and back on
    filetype off
    filetype plugin indent on


" Prevent dangerous commands in external vimrc files. Last setting in vimrc
    set secure 

