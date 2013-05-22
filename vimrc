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
    call pathogen#infect('local_bundle/{}')


" Search
    set incsearch
    set ignorecase
    noremap zz :set invhlsearch<cr>

    " Search for selection
    vnoremap g/ y/<c-r>"<cr>

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

    nnoremap <d-e> :FufBuffer<cr>
    nnoremap 66 :FufFile<cr>
    nnoremap 77 :FufFile **/<cr>
    nnoremap <d-r> :FufRenewCache<cr>
    let g:fuf_keySwitchMatching = '<d-7>'


    function! s:fuf_exclude(pattern)
        if exists("g:fuf_file_exclude")
            let g:fuf_file_exclude = g:fuf_file_exclude . "|" . a:pattern
        else
            let g:fuf_file_exclude = a:pattern
        endif
    endfunction
    function! s:fuf_exclude_dir(dirname)
        call s:fuf_exclude('(^|[/\\])' . a:dirname . '($|[/\\])')
    endfunction

    " I know of no way to append my exclusions to the defaults. :(
    let s:fuf_defaults = '\v\~$|\.(o|exe|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
    call s:fuf_exclude(s:fuf_defaults)
    call s:fuf_exclude('\.(png|DS_Store|gitkeep)')
    call s:fuf_exclude_dir('vendor')
    call s:fuf_exclude_dir('tmp')


" Comments
    Bundle 'scrooloose/nerdcommenter'


" Moving around
    Bundle 'camelcasemotion'
    Bundle 'Lokaltog/vim-easymotion'

    " Faster paging
    nnoremap <d-k> <pageup>
    nnoremap <d-j> <pagedown>

    set scrolloff=2 "Always keep a distance of two lines when scrolling

    " Quickly switch between windows
    nnoremap <s-tab> <c-w><c-w>

    " Navigate wrapped lines more conveniently
    map j gj
    map k gk
    map 0 g0
    map $ g$


" Git
    Bundle 'tpope/vim-fugitive'


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

    Bundle 'Lokaltog/vim-distinguished'


" Completion settings
    set wildmenu
    set wildmode=longest,full
    set wildignore+=*.pyc,*.class

    inoremap <tab> <c-n>


" Change modes more quickly
    nnoremap <space> :


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

" Surround with
    Bundle 'tpope/vim-surround'

    let g:surround_8216 = "‘\r’"
    let g:surround_8222 = "„\r“"
    let g:surround_8220 = "“\r”"
    let g:surround_171  = "«\r»"


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

    set autoread

    " Allow folder-specific vimrc files
    set exrc

    " I have blocked the normal way of playing macros. This is the new one.
    nnoremap t @

    Bundle 'Shougo/neocomplcache'
    let g:neocomplcache_enable_at_startup = 1

    Bundle 'Shougo/neosnippet'
    let g:neosnippet#snippets_directory = '$HOME/.vim/snippets'
    imap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<c-n>" : "\<tab>"
    vmap <s-z> <Plug>(neosnippet_expand_target)

    Bundle 'Raimondi/delimitMate'
    Bundle 'sjl/gundo.vim'
    Bundle 'godlygeek/tabular'

    Bundle 'scrooloose/syntastic'

    Bundle 'majutsushi/tagbar'
    nmap <d-o> :TagbarOpen fj<cr>

    Bundle 'editorconfig/editorconfig-vim'

    Bundle 'michaeljsmith/vim-indent-object'
    
    Bundle 'vim-scripts/EasyGrep'

    " For local replace
    nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>
    " For global replace
    nnoremap gR gD:%s/<C-R>///gc<left><left><left>


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


" JavaScript
    Bundle 'pangloss/vim-javascript'
    autocmd FileType javascript imap <d-cr> <esc>A;
    au BufRead,BufNewFile .jshintrc set filetype=json


" Makefiles
    " Makefiles do not like spaces instead of tabs
    autocmd FileType make set noexpandtab
    au BufEnter Makefile set filetype=make


" misc file types
    Bundle 'kana/vim-vspec'
    Bundle 'tpope/vim-markdown'
    Bundle 'elzr/vim-json'

    " PHP
    Bundle 'StanAngeloff/php.vim'
    autocmd FileType php imap <d-cr> <esc>A;


" Pensieve
    command! -range=% RemoveSlashes :<line1>,<line2>s/\/\///gc
    command! -range=% FixLinebreaks :<line1>,<line2>s/\r//
    command! -range=% ReplaceAsterisksWithIndents :<line1>,<line2>s/^\* /    /c


" The plugin managers need to toggle the filetype plugin off and back on
    filetype off
    filetype plugin indent on


" Prevent dangerous commands in external vimrc files. Last setting in vimrc
    set secure 

