set lines=80 columns=85
set guifont=Consolas\ 9
set guioptions-=T

" More convenient (un)indenting
inoremap <s-tab> <bs>
nnoremap <s-tab> <<
vnoremap <s-tab> <gv

macmenu File.Close key=<nop>
macmenu Buffers.Delete key=<d-w>
macmenu Window.Select\ Next\ Tab key=<d-m-right>
macmenu Window.Select\ Previous\ Tab key=<d-m-left>

