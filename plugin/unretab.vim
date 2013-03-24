" vim:foldmethod=marker:fen:
scriptencoding utf-8

" Change Log: {{{
" }}}
" Document {{{
"
" Name: unretab
" Version: 0.0.0
" Author:  tyru <tyru.exe@gmail.com>
" Last Change: 24-Mar-2013.
" License: Distributable under the same terms as Vim itself (see :help license)
"
" Description:
"   :Unretab command
"
" Usage: {{{
"   Commands: {{{
"   }}}
"   Mappings: {{{
"   }}}
"   Global Variables: {{{
"   }}}
" }}}
" }}}

" Load Once {{{
if exists('g:loaded_unretab') && g:loaded_unretab
    finish
endif
let g:loaded_unretab = 1
" }}}
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}


function! s:warn(msg) "{{{
    echohl WarningMsg
    try
        echomsg a:msg
    finally
        echohl None
    endtry
endfunction "}}}

function! s:cmd_unretab(begin, end, tabstop) "{{{
    if type(a:tabstop) isnot type(0)
        call s:warn('Unretab: invalid tabstop was given.')
        return
    endif

    let pattern = '^\(\%( \{' . a:tabstop . '}\)\+\)\( *\)'
    let replacement = '\=repeat("\t", strlen(submatch(1)) / ' . a:tabstop . ') . submatch(2)'
    execute
    \   a:begin . ',' . a:end
    \   's:' . pattern . ':' . replacement . ':'
endfunction "}}}


command!
\   -bar -range=% -nargs=?
\   Unretab
\   call s:cmd_unretab(<line1>, <line2>, <q-args> !=# '' ? str2nr(<q-args>) : &tabstop)


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
