set nocompatible

" Init Vundle
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#rc()
    
    " Manage Vundle with Vundle
    Plugin 'VundleVim/Vundle.vim'


" Leaders – as they may affect almost any plugin, they should be first
    let mapleader=","
    let maplocalleader="-"
    " showcmd displays the active leader in the bottom line and thus provides
    " visual feedback
    set showcmd


" Pathogen for local bundles
    Plugin 'tpope/vim-pathogen'
    execute pathogen#infect('local_bundle/{}')


" Search
    set incsearch
    set ignorecase
    noremap zz :set invhlsearch<cr>

    " Search for selection
    vnoremap g/ y/<c-r>"<cr>

    Plugin 'rking/ag.vim'
    let g:ag_qhandler='botright copen 30'
    let g:ag_mapping_message=0
    let g:ag_prg='git grep --line-number --ignore-case'
    let g:ag_format='%f:%l:%m'
    nnoremap -f :Ag! 

    Plugin 'vim-scripts/EasyGrep'
    let g:EasyGrepCommand=1
    set grepprg=ag\ --smart-case\ --hidden\ --ignore\ .git
    nnoremap -F :Grep 
    

" Tabbing
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set expandtab " replaces tabs with spaces
    set autoindent


" Navigate from file to file

    Plugin 'kien/ctrlp.vim'
    let g:ctrlp_match_window = 'order:ttb,max:20'
    let g:ctrlp_use_caching = 0

    function! FindMostRelevantFiles()
        if exists("b:ctrlp_user_command")
            unlet b:ctrlp_user_command
        endif
        let b:ctrlp_user_command = {
        \ 'types': {
          \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
          \ },
        \ }
    endfunction
    function! FindAllFiles()
        if exists("b:ctrlp_user_command")
            unlet b:ctrlp_user_command
        endif
        let b:ctrlp_user_command = 'find %s -type f'
    endfunction

    nnoremap 66 :call FindAllFiles()<cr>:CtrlP<cr>
    nnoremap 77 :call FindMostRelevantFiles()<cr>:CtrlP<cr>
    nnoremap <tab> :CtrlPBuffer<cr>


" Comments
    Plugin 'scrooloose/nerdcommenter'


" Moving around
    Plugin 'camelcasemotion'
    map w <Plug>CamelCaseMotion_w
    map b <Plug>CamelCaseMotion_b
    map e <Plug>CamelCaseMotion_e

    Plugin 'Lokaltog/vim-easymotion'

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
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'Lokaltog/vim-distinguished'
    Plugin 'chriskempson/vim-tomorrow-theme'

    set background=dark
    set cursorline "Highlight the line the cursor is on
    syntax on

    colorscheme Tomorrow-Night


" Completion settings
    set wildmenu
    set wildmode=longest,full
    set wildignore+=*.pyc,*.class


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
    Plugin 'tpope/vim-surround'

    let g:surround_8216 = "‘\r’"
    let g:surround_8222 = "„\r“"
    let g:surround_8220 = "“\r”"
    let g:surround_171  = "«\r»"

    nnoremap ' :cs"'<cr>


" Quickly edit .vimrc
    nnoremap <leader>ve :edit ~/computing/vim/vimrc<cr>
    nnoremap <leader>v! :up<cr>:source %<cr>


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


" check syntax
    Plugin 'scrooloose/syntastic'
    let g:syntastic_error_symbol='✗'
    let g:syntastic_style_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_style_warning_symbol='⚠'

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0


" Misc
    nnoremap M :on<cr>

    set hidden " Hide buffers, instead of closing. Enables unwritten changes, preserves undo.
    set noswapfile " The most annoying thing ever.

    set autoread

    " Allow folder-specific vimrc files
    set exrc
    
    " I have blocked the normal way of playing macros. This is the new one.
    nnoremap t @

    Plugin 'Shougo/neocomplcache'
    let g:neocomplcache_enable_at_startup = 1

    Plugin 'Shougo/neosnippet'
    let g:neosnippet#snippets_directory = '$HOME/.vim/snippets'
    let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
    vmap <s-z> <Plug>(neosnippet_expand_target)

    " automatically close pairwise symbols
    Plugin 'Raimondi/delimitMate'

    imap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<c-n>" : "<Plug>delimitMateS-Tab"
    imap <s-tab> <Plug>delimitMateS-Tab

    Plugin 'sjl/gundo.vim'
    Plugin 'godlygeek/tabular'

    Plugin 'majutsushi/tagbar'
    nmap <d-o> :TagbarOpen fj<cr>

    Plugin 'editorconfig/editorconfig-vim'

    Plugin 'michaeljsmith/vim-indent-object'
    
    " For local replace
    nmap gr viwyvai:s/\<<c-r>"\>/<c-r>"/gc<left><left><left>
    " For global replace
    nnoremap gR viwy:%s/\<<c-r>"\>/<c-r>"/gc<left><left><left>

    Plugin 'tpope/vim-repeat'


""""""""""""""
" file types
""""""""""""""

" Ruby
    " Select Ruby blocks
    Plugin 'nelstrom/vim-textobj-rubyblock'
    Plugin 'kana/vim-textobj-user'
    runtime macros/matchit.vim

    Plugin 'tpope/vim-cucumber'

    Plugin 'tpope/vim-rails'


" Clojure
    Plugin 'VimClojure'
    let g:vimclojure#ParenRainbow = 1
    let g:vimclojure#DynamicHighlighting = 1

    let vimclojure#WantNailgun = 1


" JavaScript
    Plugin 'pangloss/vim-javascript'
    autocmd FileType javascript imap <d-cr> <esc>A;

    Plugin 'elzr/vim-json'
    au BufRead,BufNewFile .jshintrc,.bowerrc set filetype=json

    Plugin 'mxw/vim-jsx'
    let g:jsx_ext_required = 0


" CoffeeScript
	Plugin 'kchmck/vim-coffee-script'
    let coffee_linter = '/usr/local/share/npm/bin/coffeelint'
    au BufEnter *.cson set filetype=coffee
    nnoremap <leader>co :CoffeeCompile<cr>
    vnoremap <leader>co :CoffeeCompile<cr>


" LiveScript
	Plugin 'gkz/vim-ls'
    let livescript_compiler = './node_modules/.bin/lsc'	
    nnoremap <leader>co :LiveScriptCompile<cr>
    vnoremap <leader>co :LiveScriptCompile<cr>

" CSS
    Plugin 'JulesWang/css.vim'

" Jade
    Plugin 'digitaltoad/vim-jade'

" Makefiles
    " Makefiles do not like spaces instead of tabs
    autocmd FileType make set noexpandtab
    au BufEnter Makefile set filetype=make

" Fastlane
    au BufEnter Appfile,Fastfile set filetype=ruby

" Markdown
    Plugin 'tpope/vim-markdown'
    autocmd FileType markdown command! -range=% Marked :!open -a marked '%'

" PHP
    Plugin 'StanAngeloff/php.vim'
    autocmd FileType php imap <d-cr> <esc>A;


" misc file types
    Plugin 'kana/vim-vspec'

    au BufRead,BufNewFile Tupfile,*.tup setf tup

    " for .gitignore syntax highlighting
    Plugin 'tpope/vim-fugitive'


" Pensieve
    command! -range=% RemoveSlashes :<line1>,<line2>s/\/\///gc
    command! -range=% FixLinebreaks :<line1>,<line2>s/\r//
    command! -range=% ReplaceAsterisksWithIndents :<line1>,<line2>s/^\* /    /c
    
    " tasks
    nnoremap ++ I☐ <esc>
    nnoremap ## ^vc✓<esc>


""""""""""""""
" last words
""""""""""""""

" The plugin managers need to toggle the filetype plugin off and back on
    filetype off
    filetype plugin indent on


" Prevent dangerous commands in external vimrc files. Last setting in vimrc
    set secure 

