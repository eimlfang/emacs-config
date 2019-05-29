(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-packages)

;; 关闭提示音
(setq ring-bell-function 'ignore)
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭滚动条
(scroll-bar-mode -1)
;; 显示行号
(global-linum-mode t)
;; 关闭启动页面
(setq inhibit-splash-screen t)

;; 快速打开init.el
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 绑定F2到快速打开init.el
(global-set-key (kbd "<f2>") 'open-my-init-file)


;; org文档添加语法高亮
(require 'org)
(setq org-src-fontify-natively t)

(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 设置光标样式
(setq-default cursor-type 'bar)

;; 禁止备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)


(delete-selection-mode t)

;; 默认开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 显示当前行
(global-hl-line-mode t)

;; 从磁盘重新加载文件
(global-auto-revert-mode t)


(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
