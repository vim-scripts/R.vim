" [Rnw.vim] ftplugin for R
" Maintainer: Johannes Ranke <jranke@uni-bremen.de>
" Last Change: 28 Jul 2004 
"
"
" Sweave code is processed by calling the R function Sweave() through a perl
" pipe [funnel.pl, by Larry Clapp <vim@theclapp.org>]. See README.R_with_vim
"
" Usage:
"
" Start R with:
"       xterm -T 'R' -e perl ~/.vim/ftplugin/funnel-r.pl ~/.r-pipe R&
"
" Add to filetypes.vim:
"   au BufNewFile,BufRead *.Rnw   setf Rnw
"   au BufNewFile,BufRead *.Rnw   set syntax=tex
"
" Maps:
"       W        	Process current Sweave input file
"       r	        Run visual selected block to R
"       <F9>        Run line under cursor

" Only do this when not yet done for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

"disable backup for .r-pipe
setl backupskip=.*pipe
"
"set r-friendly tabbing
set expandtab
set tabstop=4
set shiftwidth=4

"send visual selected block to R
vnoremap r :w >> ~/.r-pipe<CR>
"
"send line under cursor to R
noremap <buffer> <F9> :execute line(".") 'w >> ~/.r-pipe'<CR>
inoremap <buffer> <F9> <Esc> :execute line(".") 'w >> ~/.r-pipe'<CR>

"process current Sweave input file
noremap W :!echo 'Sweave("%")' > ~/.r-pipe<CR>
