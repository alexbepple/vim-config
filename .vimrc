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
nnoremap ff :FufFile<cr>
nnoremap fr :FufRenewCache<cr>
nnoremap fj :FufJumpList<cr>

" Comments
nnoremap m :call CommentLine()<cr>
vnoremap m :call CommentLine()<cr>gv
nnoremap <s-m> :call UnCommentLine()<cr>
vnoremap <s-m> :call UnCommentLine()<cr>gv

" Faster paging
nnoremap <space> <pagedown>
nnoremap <s-space> <pageup>

" Pensieve
command! -range=% RemoveSlashes :<line1>,<line2>s/\/\///gc


"""""""
" Misc
"""""""
colorscheme corporation "Color scheme
set cursorline "Highlight the line the cursor is on
set scrolloff=2 "Always keep a distance of two lines when scrolling

set wildmode=longest,list "Completes the longest common string, shows list on second press
set wildignore+=*.pyc,*.class

set showbreak=>\ 

set hidden " Hide buffers, instead of closing. Enables unwritten changes, preserves undo.

set noswapfile " The most annoying thing ever.

" Save lots of Shift presses
nnoremap ö :

map <C-w> :bd<Enter>

:set exrc
:set secure

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
nnoremap <bs> <<
vnoremap <bs> <gv

" Mate-like surround-with
vnoremap ' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap " <Esc>`>a"<Esc>`<i"<Esc>

" Quickly edit vimrc
let mapleader=","
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Workaround for Kupfer not copying the current selection properly
function! Update_clipboard ()
    call system("xclip -i ", getreg("\*"))
endfunction
nnoremap <s-v> <s-v><esc>:call Update_clipboard()<cr>gv
vnoremap <space> <esc>:call Update_clipboard()<cr>gv

" Easily copy selection to clipboard
vnoremap <cr> "+ygv

" Automatically save everything when losing focus
autocmd FocusLost * :wa
set autowrite

