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
NeoBundle 'laishua/vim-macos-ime'
```
- If you use `Dein`, then add the following codes in you `.toml` file
```
[[plugins]]
repo = 'laishua/vim-macos-ime'
```
