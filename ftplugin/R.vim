" [R.vim] ftplugin for R
"
" Author: Iago Mosqueira <i.mosqueira@ic.ac.uk>
" Changes by Johannes Ranke <jranke@uni-bremen.de>
" Last change: 28 Jul 2004 
"
"
" Code written in vim is sent to R through a perl pipe
" [funnel.pl, by Larry Clapp <vim@theclapp.org>], as individual lines,
" blocks, or the whole file.
"
" Usage:
"
" Start R with:
"       xterm -T 'R' -e perl ~/.vim/ftplugin/funnel.pl ~/.r-pipe R&
"
" Add to filetype.vim:
"   au BufNewFile,BufRead *.R     setf r
"   au BufNewFile,BufRead *.R     set syntax=r
"
" In insert mode, <M-Enter> sends the active line to R and moves to the next
" line (write and process mode).
"
" Maps:
"       <F5>        Run current file
"       <F9>        Run line under cursor
"       r	        Run visual block
"       <M-Enter>   Write and process



" Only do this when not yet done for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

"disable backup for .r-pipe
setl backupskip=.*pipe

"set r-friendly tabbing
set expandtab
set tabstop=4
set shiftwidth=4

"send line under cursor to R
noremap <buffer> <F9> :execute line(".") 'w >> ~/.r-pipe'<CR>
inoremap <buffer> <F9> <Esc> :execute line(".") 'w >> ~/.r-pipe'<CR>

"send visual selected block to R
vnoremap <buffer> r :w >> ~/.r-pipe<CR>

"write and process mode (somehow mapping <C-Enter> does not work)
inoremap <M-Enter> <Esc>:execute line(".") 'w >> ~/.r-pipe'<CR>o

"send current file to R
noremap <buffer> <F5> :execute '1 ,' line("$") 'w >> ~/.r-pipe' <CR><CR>
