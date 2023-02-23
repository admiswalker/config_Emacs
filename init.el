;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ツールバーを非表示

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpa" .     "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)


(tool-bar-mode -1)
;; メニューバーを非表示
(menu-bar-mode -1)
;; スクロールバーを非表示
(scroll-bar-mode -1)
;; フォント
;(fixed-width-set-fontset "msgothic" 12)

(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 150))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ファイル名を指定して起動した場合でも，分割 2 画面にしない．
(setq inhibit-startup-message t)

; バックアップファイルを作成しない
(setq make-backup-files nil)
; 自動保存を無効
(setq auto-save-default nil)

(keyboard-translate ?\C-h ?\C-?);   \C-h: Delete

(keyboard-translate ?\216 ?\C-\S-n);\C-\S-n: [\C-\S-n]でも選択しながら下へ移動できるようにする
(keyboard-translate ?\220 ?\C-\S-p);\C-\S-p: [\C-\S-p]でも選択しながら下へ移動できるようにする

(keyboard-translate ?\206 ?\C-\S-f);\C-\S-f: 前方向に選択
(keyboard-translate ?\202 ?\C-\S-b);\C-\S-b: 後ろ方向に選択
(keyboard-translate ?\227 ?\S-\M-f);\C-\S-w: 単語単位で前方向に選択．[\M-\S-f]に同じ
(keyboard-translate ?\221 ?\S-\M-b);\C-\S-q: 単語単位で後ろ方向に選択．[\M-\S-b]に同じ

(keyboard-translate ?\201 ?\C-\S-a);\C-\S-a: カーソルから先頭まで選択
(keyboard-translate ?\205 ?\C-\S-e);\C-\S-e: カーソルから末尾まで選択
(keyboard-translate ?\203 ?\M-w);\C-\S-c: コピー
(keyboard-translate ?\226 ?\C-y);\C-\S-v: 貼り付け
(keyboard-translate ?\230 ?\C-w);\C-\S-x: 切り取り

(keyboard-translate ?\232 'undo);\C-\S-z: undo
;(global-set-key "\C-z" 'undo);UndoをCtr+z でもできるようにする


;; init.el だけに設定されてしまう
(setq c-basic-offset 4)
;; ホックを使った設定
;(defun my-c-c++-mode-init ()
;  (setq c-basic-offset 4)
;  )
;(add-hook 'c-mode-hook 'my-c-c++-mode-init)
;(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

;(setq-default tab-width 2 indent-tabs-mode nil); タブにスペースを使用する
(setq default-tab-width 4);タブの表示幅の設定
(setq indent-tabs-mode nil)
;(keyboard-translate ?\t ?\M-i);\C-q \t: タブキーを何が何でも tab キーとして入力するための設定．[タブの入力方法: Ctrl-i/ESC-i/Alt-iのいずれか，または，Ctrl-qでエスケープしてTABキーで入力];これだと 1 タブ = 8 スペースにしないと，1 タブで 1 タブ 4 スペースが 2 つ挿入される
;(setq c-tab-always-indent t); タブ (よくあるタブの設定，上記設定と競合するため注意)

(add-hook 'c-mode-common-hook
	  '(lambda()
	     (setq default-tab-width 4);タブの表示幅の設定
	     (setq indent-tabs-mode nil)
	     ))

;; 改行コードを表示する
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

(global-linum-mode t);行番号の表示
(setq linum-format "%4d ");行番号との間に1スペース挿入する
(delete-selection-mode t);リージョンを削除できるようにする

(setq scroll-conservatively 1); スクロールを1行ごとにする

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(defun scroll-half-page-down ()
;  "scroll down half the page"
;  (interactive)
;  (scroll-down (/ (window-body-height) 2)))
;
;(defun scroll-half-page-up ()
;  "scroll up half the page"
;  (interactive)
;  (scroll-up (/ (window-body-height) 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; http://yohshiy.blog.fc2.com/blog-entry-320.html
; scroll-preserve-screen-position の変数に t を設定すると ページスクロール時に画面上におけるカーソルの位置をなるべく変えないようにします。
(setq scroll-preserve-screen-position t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; その場でスクロール ; https://qiita.com/garaemon/items/48ddb52dc0ae53db02fc
(global-unset-key "\M-p")
(global-unset-key "\M-n")
(defun scroll-up-in-place (n)
  (interactive "p")
  (previous-line n)
  (scroll-down n))
(defun scroll-down-in-place (n)
  (interactive "p")
  (next-line n)
  (scroll-up n))
(global-set-key "\M-p" 'scroll-up-in-place)
(global-set-key "\M-n" 'scroll-down-in-place)
;(global-set-key [M-up] 'scroll-up-in-place)
;(global-set-key [M-down] 'scroll-down-in-place)

;カーソルを残したままスクロール
;(global-set-key "\M-n" (lambda () (interactive) (scroll-up 1)));スクロール
;(global-set-key "\M-p" (lambda () (interactive) (scroll-down 1)));スクロール

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://myemacs.readthedocs.io/ja/latest/basic-customize.html
;; xterm のマウスイベントを取得する
(xterm-mouse-mode t)
;; マウスホイールを取得する
;(mouse-wheel-mode t); Ububtu 16.04 でエラー発生 (emacs24-nox)

;; ホイールでポインタを移動できるようにする
;(global-set-key [mouse-4] (kbd "C-p"))
;(global-set-key [mouse-5] (kbd "C-n"))

;; ポインタの移動ではなくて画面をスクロールさせたい場合はこっち
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 6)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   6)))

;;;; カーソルのある行のハイライトを有効にする
;(global-hl-line-mode t)
;; ハイライトの色を設定します
;(custom-set-faces '(hl-line ((t (:background "dark gray")))));; これが上手く動かない
(setq hl-line-face '(background "dark gray"))
;; ハイライトのスタイルをアンダーラインにします
;; ただしアンダーバーが見えづらくなる問題があります
;(setq hl-line-face 'underline)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://d.hatena.ne.jp/khiker/20070409/emacs_hl_line
;; 現在行をハイライト
;(global-hl-line-mode t)
;(defface my-hl-line-face
;  '((((class color) (background dark))  ; カラーかつ, 背景が dark ならば,
;     (:background "DarkSlateBlue" t))  ; 背景を黒に.									; ここ，動作はするが，#FFFFFF で任意の色を指定できないのでダメ．
;    (((class color) (background light)) ; カラーかつ, 背景が light ならば,
;     (:background "ForestGreen" t))     ; 背景を ForestGreen に.
;    (t (:bold t)))
;  "hl-line's my face")
;(setq hl-line-face 'my-hl-line-face)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://keisanbutsuriya.hateblo.jp/entry/2015/02/01/162035
(show-paren-mode t)                       ;; 対応する括弧をハイライト

;(setq show-paren-style 'parenthesis)	;対応する括弧だけをハイライト
;(setq show-paren-style 'expression)		;括弧で囲まれた部分をハイライト
;(setq show-paren-style 'mixed)			;画面内に対応する括弧がある場合は括弧だけを，ない場合は括弧で囲まれた部分をハイライト
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(keyboard-translate ?\C-\S-b ?\S-\M-b)
;(global-set-key "\C-h" 'delete-backward-char)

;;; 画面右端で折り返さない
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)

;(setq x-select-enable-clipboard t);OSとクリップボードを共有(これだと上手く動作していない. Cygwin だから?)

; for clipborad
;(setq sysname system-type)
;(if (eq sysname 'darwin)
;	(progn
;	  (defun copy-from-osx ()
;		(shell-command-to-string "pbpaste"))
;	  (defun paste-to-osx (text &optional push)
;		(let ((process-connection-type nil))
;		  (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;			(process-send-string proc text)
;			(process-send-eof proc))))
;	  (setq interprogram-cut-function 'paste-to-osx)
;	  (setq interprogram-paste-function 'copy-from-osx)
;	  )
;  (message "This platform is not mac")
;  )
;(if (eq sysname 'cygwin)
;	(progn
;	  (defun paste-from-cygwin ()
;		(with-temp-buffer
;		  (insert-file-contents "/dev/clipboard")
;		  (buffer-string)))
;	  (defun cut-to-cygwin (text &optional push)
;		(with-temp-file "/dev/clipboard"
;		  (insert text)))
;	  (setq interprogram-cut-function 'cut-to-cygwin)
;	  (setq interprogram-paste-function 'paste-from-cygwin)
;	  )
;  (message "This platform is not cygwin")
;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-hook 'c-mode-hook
;		  '(lambda ()
;			 (c-toggle-electric-state -1)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; https://yono05.wordpress.com/2011/11/20/emacs-%E3%81%A8-mac-%E3%81%AE%E3%82%AF%E3%83%AA%E3%83%83%E3%83%97%E3%83%9C%E3%83%BC%E3%83%89%E3%82%92%E5%85%B1%E6%9C%89%E3%81%99%E3%82%8B/

; pbpaste を別途インストールする必要あり．

; $ sudo apt-get install xsel
; .bashrc に 下記を追加
;alias pbcopy='xsel --clipboard --input'
;alias pbpaste='xsel --clipboard --output'

;; system-type predicates
;; from http://d.hatena.ne.jp/tomoya/20090807/1249601308
;(setq darwin-p   (eq system-type 'darwin)
;      linux-p    (eq system-type 'gnu/linux)
;      carbon-p   (eq system-type 'mac)
;      meadow-p   (featurep 'meadow))

; Emacs と Mac のクリップボード共有
; from http://hakurei-shain.blogspot.com/2010/05/mac.html
;(defun copy-from-osx ()
;  (shell-command-to-string "pbpaste"))

;(defun paste-to-osx (text &optional push)
;  (let ((process-connection-type nil))
;    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;      (process-send-string proc text)
;      (process-send-eof proc))))

;(if (or darwin-p carbon-p)
;  (setq interprogram-cut-function 'paste-to-osx)
;  (setq interprogram-paste-function 'copy-from-osx))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://d.hatena.ne.jp/h1mesuke/20070630/p1

(defvar rotate-buffer-ignored-buffers
  '()
  "*List of file-visiting buffer names ignored by `rotate-buffer'.")

(defvar rotate-buffer-not-ignored-*-buffers
  '("*Abbrevs*" "*Ibuffer*" "*info*" "*shell*")
  "*List of not-file-visiting buffer names not ignored by `rotate-buffer'.")

(defun rotate-buffer (&optional to-previous-p rotate-*-buffer-p)
  "Switch to the next file-visiting buffer in cyclic order.
If TO-PREVIOUS-P is non-nil, rotate in reversed order.
If ROTATE-*-BUFFER-P is non-nil, switch to the next not-file-visiting
buffer in cyclic order."
  (let ((rotate-buffer-function (if to-previous-p 'previous-buffer 'next-buffer))
        (old-buffer (current-buffer))
        (found nil))
    (catch 'not-found
      (while (not found)
        (funcall rotate-buffer-function)
	(if (rotate-buffer-found-p rotate-*-buffer-p)
	    (setq found t))
        (if (eq (current-buffer) old-buffer)
            (progn (message "No buffer")
                   (throw 'not-found nil)))
        ))
    ))

;; PRIVATE
(defun rotate-buffer-found-p (rotate-*-buffer-p)
  (let ((found (if buffer-file-name
		   (not (member (buffer-name) rotate-buffer-ignored-buffers))
		 (member (buffer-name) rotate-buffer-not-ignored-*-buffers))))
    (if rotate-*-buffer-p
	(setq found (not found)))
    found))

(defun my-next-buffer ()
  "Switch to the next file-visiting buffer in cyclic order."
  (interactive)
  (rotate-buffer nil nil))

(defun my-previous-buffer ()
  "Switch to the previous file-visiting buffer in cyclic order."
  (interactive)
  (rotate-buffer t nil))

(defun my-next-*-buffer ()
  "Switch to the next not-file-visiting buffer in cyclic order."
  (interactive)
  (rotate-buffer nil t))

(defun my-previous-*-buffer ()
  "Switch to the previous not-file-visiting buffer in cyclic order."
  (interactive)
  (rotate-buffer t t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "M-]") 'my-next-buffer)
(global-set-key (kbd "M-:") 'my-previous-buffer)
(global-set-key (kbd "C-M-]") 'my-next-*-buffer)
(global-set-key (kbd "C-M-:") 'my-previous-*-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; emacs の色を変更

;(custom-set-faces
; '(default ((t
;             (:background "black" :foreground "#55FF55")
;             ))))
; '(cursor ((((class color)
;             (background dark))
;            (:background "#00AA00"))
;           (((class color)
;             (background light))
;            (:background "#999999"))
;           (t ())
;           )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;








(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (manoj-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
 

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)







;; Qiita: Emacs環境をアップデートする（straight.el） for typescript
;; ref: https://qiita.com/yuze/items/a145b1e3edb6d0c24cbf
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Qiita: Emacsにtypescript環境を設定する
;; ref: https://qiita.com/yuze/items/76df309992534d75bd25
;; typescript
(straight-use-package 'typescript-mode)
(straight-use-package 'tide)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-hook 'typescript-mode-hook
          '(lambda ()
             (interactive)
             (tide-setup)
             (flycheck-mode +1)
             (tide-hl-identifier-mode +1)
             (company-mode +1)
             (eldoc-mode +1)
             ))

(setq js-indent-level 2)
(setq typescript-indent-level 2)


;;;;;;;;;;;;;;;;;;;;;;;;;
;; for *.yml file

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; for *.sh file

;(setq sh-basic-offset 4)
;(setq sh-indentation 4)
;(defun turn-off-indent-tabs-mode () ;; https://emacs.stackexchange.com/questions/52047/how-to-change-shell-script-mode-indentation-not-to-use-tabs
;  (setq indent-tabs-mode nil))
;(add-hook 'sh-mode-hook #'turn-off-indent-tabs-mode)

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

