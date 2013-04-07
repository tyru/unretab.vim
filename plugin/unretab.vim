" vim:foldmethod=marker:fen:
scriptencoding utf-8

" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}



augroup unretab
    autocmd!
    autocmd VimEnter *
    \     echohl ErrorMsg
    \   | echomsg '*** unretab.vim is no longer maintained. ***'
    \   | echomsg '*** Please use :CSUnretab in https://github.com/tyru/codingstyle.vim instead. ***'
    \   | echohl None
augroup END



" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
