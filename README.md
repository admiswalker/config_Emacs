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
### multiple-cursors のインストールと設定
1. （パッケージサーバが死んでいたので）[本家の GitHub](https://github.com/magnars/multiple-cursors.el) からソースコードのzipを取得して，`~/.emacs.d/` 下で展開
2. `~/.emacs.d/init.el` に下記を追記
   ```
   ;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; for multiple-cursors
   ;; ref:
   ;; - https://github.com/magnars/multiple-cursors.el
   ;; - http://emacs.rubikitch.com/multiple-cursors/
   
   (add-to-list 'load-path "~/.emacs.d/packages/multiple-cursors.el-master")
   (require 'multiple-cursors)
   ;(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
   ;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
   ;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
   ;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
   
   (defun mc/edit-lines-or-string-rectangle (s e)
     "C-x r tで同じ桁の場合にmc/edit-lines (C-u M-x mc/mark-all-dwim)"
     (interactive "r")
     (if (eq (save-excursion (goto-char s) (current-column))
             (save-excursion (goto-char e) (current-column)))
         (call-interactively 'mc/edit-lines)
       (call-interactively 'string-rectangle)))
   (global-set-key (kbd "C-x r t") 'mc/edit-lines-or-string-rectangle)
   
   (defun mc/mark-all-dwim-or-mark-sexp (arg)
     "C-u C-M-SPCでmc/mark-all-dwim, C-u C-u C-M-SPCでC-u M-x mc/mark-all-dwim"
     (interactive "p")
     (cl-case arg
       (16 (mc/mark-all-dwim t))
       (4 (mc/mark-all-dwim nil))
       (1 (mark-sexp 1))))
   (global-set-key (kbd "C-M-SPC") 'mc/mark-all-dwim-or-mark-sexp)
   ```
3. `C-x r t` の初回実行時に n を入力して Enter
   multiple-cursors の初回実行時に
   > Do mc/edit-lines-or-string-rectangle for all cursors? (y or n)
   と聞かれるので n と答える．
   ※ y と答えると，`Multiple-Cursors mode disabled in current buffer` と表示されて，
   動作しないくなるので，`~/.emacs.d/.mc-lists.el` を削除して，もう一度やり直す．

