" This file is part of vim-macos-ime.
"
" vim-macos-ime is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.

" vim-macos-ime is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License
" along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

if exists('g:loaded_macosime')
    finish
endif
let g:loaded_macosime = 1

if !exists('g:macosime_auto_detect')
    let g:macosime_auto_detect = 1
endif

if !exists('g:macosime_insert_leave')
    let g:macosime_insert_leave = 1
endif

if !exists('g:macosime_macism_path')
    let g:macosime_macism_path = 'macism'
endif

if !exists('g:macosime_normal_ime')
    let g:macosime_normal_ime = 'com.apple.keylayout.US'
endif

if !exists('g:macosime_cjk_ime')
    let g:macosime_cjk_ime= 'com.sogou.inputmethod.sogou.pinyin'
endif

function s:switch_normal_ime()
    call s:switch_ime(g:macosime_normal_ime)
endfunction

function s:switch_cjk_ime(cjk_mode)
  if a:cjk_mode
    call s:switch_ime(g:macosime_cjk_ime)
  else
    call s:switch_ime(g:macosime_normal_ime)
  endif
endfunction

function s:switch_ime(ime)
  execute "silent !" . g:macosime_macism_path . " '" . a:ime . "' > /dev/null"
endfunction

function s:insert_entered()
    if g:macosime_auto_detect
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

if g:macosime_insert_leave
  autocmd InsertLeave * :call s:insert_leave()
endif
