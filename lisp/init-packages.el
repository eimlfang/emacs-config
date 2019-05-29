 ;; '("melpa" . "https://melpa.org/packages/")
;; http://elpa.emacs-china.org/melpa/ ;; 国内镜像源
(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  )


;; add whatever packages you want here
(defvar eimlfang/packages '(
			    company
			    monokai-theme
			    hungry-delete
			    swiper
			    counsel
			    smartparens
			    js2-mode
			    rust-mode
			    nodejs-repl
			    exec-path-from-shell
			    popwin
			    markdown-mode
			    reveal-in-osx-finder
			    web-mode
			    js2-refactor
			    expand-region
			    iedit
			    helm-ag
			    flycheck
			    php-mode
			    auto-yasnippet
			    ) "Default packages")

(setq package-selected-packages eimlfang/packages)

(defun eimlfang/packages-installed-p()
  (loop for pkg in eimlfang/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (eimlfang/packages-installed-p)
  (message "%s" "Refreshing package datbase...")
  (package-refresh-contents)
  (dolist (pkg eimlfang/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; nodejs-repl
(require 'nodejs-repl)
;; php-mode
(require 'php-mode)
;;(add-hook 'php-mode-hook
;;    '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))
;; rust-mode
(require 'package)

;; markdown-mode
;; (require 'markdown-mode)
;;(setq auto-mode-alist
;;      (append
;;       '(("README\\.md\\'" . gfm-mode)
;;	 ("\\.md\\" . markdown-mode)
;;	 ("\\.markdown\\ . markdown-mode"))
;;       auto-mode-alist))


;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 括号匹配
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;; emacs-lisp模式下不匹配 '
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(require 'popwin)
(popwin-mode t)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;; 全局打开company-mode
(global-company-mode t)

;; 加载nomokai主题
;; (load-theme 'monokai t)

(require 'reveal-in-osx-finder)

(require 'web-mode)

(setq auto-mode-alist
      (append
       '(("\\.rs\\'" . rust-mode)
	 ("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode)
	 ("\\.html?\\'" . web-mode))
       auto-mode-alist))

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent()
  (interactive)
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-coe-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil))

;; config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;;(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; config for web mode
(defun my-web-mode-indent-setup()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(require 'expand-region)

(require 'iedit)

;; (require 'org-pomodoro)

;; (global-flycheck-mode)
(add-hook 'php-mode-hook 'flycheck-mode)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-packages)
