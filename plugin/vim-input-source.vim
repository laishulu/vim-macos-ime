" This file is part of vim-osx-ime.
"
" vim-osx-ime is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.

" vim-osx-ime is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License
" along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

if exists('g:loaded_osxime')
    finish
endif
let g:loaded_osxime = 1

if !exists('g:osxime_auto_detect')
    let g:osxime_auto_detect = 1
endif

if !exists('g:osxime_insert_leave')
    let g:osxime_insert_leave = 1
endif

if !exists('g:osxime_issw_path')
    let g:osxime_issw_path = 'issw'
endif

if !exists('g:osxime_normal_ime')
    let g:osxime_normal_ime = 'com.apple.keylayout.US'
endif

if !exists('g:osxime_cjk_ime')
    let g:osxime_cjk_ime= 'com.sogou.inputmethod.sogou.pinyin'
endif

function s:switch_normal_ime()
    call s:switch_ime(g:osxime_normal_ime)
endfunction

function s:switch_cjk_ime(cjk_mode)
  if a:cjk_mode
    call s:switch_ime(g:osxime_cjk_ime)
  else
    call s:switch_ime(g:osxime_normal_ime)
  endif
endfunction

function s:switch_ime(ime)
  execute "silent !" . g:osxime_issw_path . " '" . a:ime . "' > /dev/null"
endfunction

function s:insert_entered()
    if g:osxime_auto_detect
        let l:char = getline('.')[col('.') - 2]
        let l:cjk_mode = l:char >= "\x80"
    else
        let l:cjk_mode = 1
    endif
    call s:switch_cjk_ime(l:cjk_mode)
endfunction

function s:insert_leave()
  call s:switch_normal_ime()
endfunction

autocmd InsertEnter * :call s:insert_entered()

if g:osxime_insert_leave
  autocmd InsertLeave * :call s:insert_leave()
endif
