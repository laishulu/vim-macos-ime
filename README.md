# vim-macos-ime
Switch input source automatically in vim for macos, modified from
[vim-osx-ime](https://github.com/hongqn/vim-osx-ime), but use
[macism](https://github.com/laishulu/macism/) to switch ime.

## Features
* When vim switches to insert mode:

  * If the character before cursor is a Chinese character, switch to Chinese
    IME and put it in Chinese mode.

  * If the character before cursor is an English character, switch to Chinese
    IME and put it in English mode.

* Switch English IME whenever vim switchs to normal mode.

## Install
### Install `macism`
```
brew tap laishulu/macism
brew install macism
```
### Install `vim-macos-ime`
- If you use `NeoBundle`, then add the following codes in your `.vimrc`.
```
NeoBundle 'laishulu/vim-macos-ime'
```
- If you use `Dein`, then add the following codes in you `.toml` file
```
[[plugins]]
repo = 'laishulu/vim-macos-ime'
```

## Usage
change default Input Method of Insert Mode
```vimscript
" Plugin default Input Method: 搜狗拼音输入法
let g:macosime_cjk_ime= 'com.sogou.inputmethod.sogou.pinyin'

" 简体拼音
let g:macosime_cjk_ime= 'com.apple.inputmethod.SCIM.ITABC'
" 简体双拼
let g:macosime_cjk_ime= 'com.apple.inputmethod.SCIM.Shuangpin'
" 简体五笔
let g:macosime_cjk_ime= 'com.apple.inputmethod.SCIM.WBX'
" 鼠须管
let g:macosime_cjk_ime= 'im.rime.inputmethod.Squirrel.Rime'
```


