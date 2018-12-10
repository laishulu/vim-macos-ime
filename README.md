# vim-osx-auto-ime
Switch input source automatically in vim for macos, modified from [vim-osx-ime](https://github.com/hongqn/vim-osx-ime), but use [issw](https://github.com/vovkasm/input-source-switcher) to switch ime.

## Features
* When vim switches to insert mode:

  * If the character before cursor is a Chinese character, switch to Chinese
    IME and put it in Chinese mode.

  * If the character before cursor is an English character, switch to Chinese
    IME and put it in English mode.

* Switch English IME whenever vim switchs to normal mode.

## How to install
- If you use `NeoBundle`, then add the following codes in your `.vimrc`.
```
  NeoBundle 'laishua/vim-macos-ime', {
   \  'build' : {
   \    'mac' : './install',
   \  },
   \}
```

- If you use `Dein`, then add the following codes in you `.toml` file
```
[[plugins]]
repo = 'laishua/vim-macos-ime'
build = './install'
```

- Or install with any plugin manager, and manually run the following command in the plugin's directory.
```
./install
```
