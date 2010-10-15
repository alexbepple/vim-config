" Licensed under the WTFPL
" http://sam.zoy.org/wtfpl/

" http://kuler.adobe.com/#themeID/1073356
" Basic color: 30/5 (hue/saturation), valued varied with Fibonacci sequence
" Other colors: Shiki wise, Shiki dust, color from 

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ristretto"


" Shadow89 on Shadow8
hi Normal guifg=#e3ddd8 guibg=#141413
" Shadow13
hi CursorLine guibg=#21201f
" Shadow8 on Shadow89
hi Cursor guifg=#141413	guibg=#e3ddd8

" Peter65
hi Type guifg=#6f91a6
hi! link Directory	Type
hi! link Function	Type
hi! link StorageClass	Type
hi! link Typedef	Type
hi! link Structure	Type
hi! link Identifier Type

" Wise75
hi Statement guifg=#97bf60
hi! link Conditional	Statement
hi! link Exception	Statement
hi! link Keyword	Statement
hi! link Label		Statement
hi! link MatchParen	Statement
hi! link MoreMsg	Statement
hi! link Operator	Statement
hi! link Repeat		Statement

hi! link PreProc Statement
hi! link Define		PreProc
hi! link Include	PreProc
hi! link Macro		PreProc
hi! link PreCondit	PreProc
hi! link Special	PreProc

" Shadow8 on Dust61 
hi Search guifg=#141413 guibg=#9c7f62
hi! link IncSearch	Search
hi! link Visual Search

" Shadow55
hi Comment	gui=italic	guifg=#8c8985
hi! link NonText	Comment
hi! link SpecialKey	Comment


" Dust89
hi Constant			guifg=#e3b98f
hi! link Boolean	Constant
hi! link Character	Constant
hi! link Float		Constant
hi! link Number		Constant
hi! link String		Constant

