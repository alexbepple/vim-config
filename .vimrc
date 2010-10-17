set nocompatible

" Search
set incsearch
set ignorecase
noremap // :nohlsearch<cr>
" Search for selection
vnoremap g/ y/<C-R>"<CR>

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

" Comments
nnoremap m :call CommentLine()<cr>
vnoremap m :call CommentLine()<cr>gv
nnoremap <s-m> :call UnCommentLine()<cr>
vnoremap <s-m> :call UnCommentLine()<cr>gv

" Scrolling and paging

    set scrolloff=2 "Always keep a distance of two lines when scrolling


" Wrap lines

    " Navigate wrapped lines more conveniently
    map j gj
    map k gk
    map 0 g0
    map $ g$

    set showbreak=>\ 

" Easily add empty lines
nnoremap <a-o> o<esc>k
nnoremap <a-O> O<esc>j

" Pensieve
command! -range=% RemoveSlashes :<line1>,<line2>s/\/\///gc
command! -range=% FixLinebreaks :<line1>,<line2>s/\r//
command! -range=% ReplaceAsterisksWithIndents :<line1>,<line2>s/^\* /    /c

" Appearance
colorscheme ristretto
set cursorline "Highlight the line the cursor is on

" Completion settings
set wildmode=longest,list "Completes the longest common string, shows list on second press
set wildignore+=*.pyc,*.class


" Change modes more quickly

    inoremap <space><space> <esc>
    nnoremap <space> :

    " Prevent accidental <F1> presses
    map <f1> <esc>
    imap <f1> <esc>


" Quickly close buffer
nnoremap <a-w> :bd<Enter>

" Markdown
augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

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
vnoremap ' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap " <Esc>`>a"<Esc>`<i"<Esc>

" Quickly edit vimrc
let mapleader=","
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :up<cr>:source %<cr>

" Workaround for Kupfer not copying the current selection properly
function! Update_clipboard ()
    call system("xclip -i ", getreg("\*"))
endfunction
nnoremap <s-v> <s-v><esc>:call Update_clipboard()<cr>gv
vnoremap <space> <esc>:call Update_clipboard()<cr>gv

" Easily copy selection to clipboard
vnoremap <cr> "+ygv
" Paste and indent
nnoremap <c-v> "+p==

" Automatically save everything when losing focus
autocmd FocusLost * :wa
set autowrite

" Misc
set winaltkeys=no "Prevent Alt-mappings from interfering with menu mnemonics
set hidden " Hide buffers, instead of closing. Enables unwritten changes, preserves undo.
set noswapfile " The most annoying thing ever.

" Allow folder-specific vimrc files
:set exrc
:set secure " Prevent dangerous commands in external vimrc files. Last setting in vimrc

