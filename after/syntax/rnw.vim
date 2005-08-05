" Syntax file for files containing both LaTeX and R code
" that are commonly used with Sweave
"
" Author: Fernando Henrique Ferraz Pereira da Rosa <feferraz@ime.usp.br>
" Maintainer: Johannes Ranke <jranke@uni-bremen.de>
" Last Change: 2005 Aug 05
" SVN: $Id$
"
" http://www.ime.usp.br/~feferraz/en/sweavevim.html

runtime! syntax/tex.vim
unlet b:current_syntax

syntax include @nowebR syntax/r.vim
syntax region nowebChunk start="^<<.*>>=" end="^@" contains=@nowebR
syntax region Sexpr  start="\\Sexpr{"  end="}" keepend
hi Sexpr gui=bold guifg=chocolate2

let b:current_syntax="noweb"
