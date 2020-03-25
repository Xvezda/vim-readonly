" Copyright (C) 2020 Xvezda <xvezda@naver.com>
"
" MIT License
"
" Use of this source code is governed by an MIT-style
" license that can be found in the LICENSE file or at
" https://opensource.org/licenses/MIT.
"
" Location: plugin/readonly.vim
" Author:   Xvezda <xvezda@naver.com>


" Check readonly option exists
if !exists('&readonly')
  finish
endif


let s:save_cpo = &cpo
set cpo&vim

" Source guard
if exists('g:loaded_readonly')
  let &cpo = s:save_cpo
  unlet s:save_cpo

  finish
endif
let g:loaded_readonly = 1


function! s:init() abort
  call s:check_path()
endfunction


function! s:set_option(flag) abort
  let &l:readonly = a:flag
endfunction


function! s:check_path() abort
  for path in g:readonly_paths
    if expand("%:p") =~# path
      call s:set_option(1)
      return 1
    endif
  endfor
  return 0
endfunction


" Option variables
if !exists('g:readonly_paths')
  let g:readonly_paths = [
        \   '/usr/bin/lib',
        \   '/usr/local/lib/',
        \   '/usr/local/include/',
        \   '/node_modules/'
        \ ]
  " Add python path
  if !empty($PYTHONPATH)
    call extend(g:readonly_paths, split($PYTHONPATH, ':'))
  endif
endif

if !exists('g:readonly_automatic')
  let g:readonly_automatic = 1
endif


command! -bar -bang Readonly execute s:set_option(<bang>1)

if g:readonly_automatic
  augroup readonly_init
    autocmd!
    autocmd BufEnter * call s:check_path()
  augroup END
endif


" Restore
let &cpo = s:save_cpo
unlet s:save_cpo


" vim:set sts=2:
