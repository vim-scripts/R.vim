" Vim syntax file
" Language:    R Help File
" Maintainer:  Johannes Ranke <jranke@uni-bremen.de>
" Last Change: Feb 20, 2004
" Version:     0.1
"
" Notes: First try. I don't really understand the HiLink commands too well
"
syntax clear

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
 
" Type Styles
syn match rdType		"\\bold\>"
syn match rdType		"\\emph\>"
syn match rdType		"\\code\>"
syn match rdType		"\\file\>"
syn match rdType		"\\email\>"
syn match rdType		"\\url\>"
syn match rdType		"\\link\>"

" Special
syn match rdDelimiter		"\\cr\>"

" Rd sections
syn match rdSection		"\\name\>"
syn match rdSection		"\\alias\>"
syn match rdSection		"\\title\>"
syn match rdSection		"\\description\>"
syn match rdSection		"\\usage\>"
syn match rdSection		"\\arguments\>"
syn match rdSection		"\\details\>"
syn match rdSection		"\\value\>"
syn match rdSection		"\\references\>"
syn match rdSection		"\\note\>"
syn match rdSection		"\\author\>"
syn match rdSection		"\\seealso\>"
syn match rdSection		"\\examples\>"
syn match rdSection		"\\keyword\>"
syn match rdSection		"\\docType\>"
syn match rdSection		"\\format\>"
syn match rdSection		"\\source\>"
syn match rdSection	        "\\item\>"
syn match rdSection	        "\\section\>"
syn match rdSection		"\\tabular\>"
syn match rdSection		"\\dontrun\>"

" Error
syn region rdRegion matchgroup=Delimiter start=/(/ matchgroup=Delimiter end=/)/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError
syn region rdRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent contains=ALLBUT,rError,rBraceError,rParenError
syn region rdRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/]/ transparent contains=ALLBUT,rError,rCurlyError,rParenError
syn match rdError      /[)\]}]/
syn match rdBraceError /[)}]/ contained
syn match rdCurlyError /[)\]]/ contained
syn match rdParenError /[\]}]/ contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tex_syntax_inits")
  if version < 508
    let did_tex_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink rdType	      Type
  HiLink rdSection    PreCondit
  HiLink rdError       Error
  HiLink rdBraceError  Error
  HiLink rdCurlyError  Error
  HiLink rdParenError  Error
  HiLink rdDelimiter   Delimiter
  delcommand HiLink
endif

let   b:current_syntax = "rd"
" vim: ts=8
