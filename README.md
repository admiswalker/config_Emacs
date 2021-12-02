# config_Emacs
config file of my emacs

## 設定
- インストール先: `.emacs.d/init.el`

## Emacs の設定
- インストール
  - Emacs のインストール
    ```
    $ sudo apt install emacs
    ```
  - Zenburn のインストール
    ```
    $ cd ~
    $ mkdir tmp
    $ cd tmp
    $ git clone https://github.com/bbatsov/zenburn-emacs.git zenburn-directory
    $ mkdir -p ~/.emacs.d/themes
    $ mv ./zenburn-directory/zenburn-theme.el ~/.emacs.d/themes
    ```
  - `~/.emacs.d/init.el` に下記の設定を追記
    ```
    (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
    (load-theme 'zenburn t)
    ```

## 追加ライブラリの設定とインストール
### yaml-mode のインストールと設定
1. yaml-mode のインストール
   ```
   $ git clone git@github.com:yoshiki/yaml-mode.git
   $ cd yaml-mode
   $ make
   $ sudo make install
   ```
2. `~/.emacs.d/init.el` に下記を追記
   ```
   (require 'yaml-mode)
   (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
   (require 'yaml-mode)
   (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
   ```

