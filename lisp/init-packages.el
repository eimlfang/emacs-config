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
			    php-mode
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
;; rust-mode
(require 'package)
(setq auto-mode-alist
      (append
       '(("\\.rs\\'" . rust-mode))
       auto-mode-alist))

;; 配置js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

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


(require 'popwin)
(popwin-mode t)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;; 全局打开company-mode
(global-company-mode t)

;; 加载nomokai主题
(load-theme 'monokai t)

(require 'reveal-in-osx-finder)

(provide 'init-packages)
