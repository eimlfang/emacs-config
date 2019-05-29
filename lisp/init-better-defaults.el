;; 关闭提示音
(setq ring-bell-function 'ignore)
;; 从磁盘重新加载文件
(global-auto-revert-mode t)
;; 禁止备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)
;; 显示行号
(global-linum-mode t)
;; 匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

(setq enable-recursive-minibuffers t)

;; 缩写模式
;;(abbrev-mode t)
;;(define-abbrev-table 'global-abbrev-table '(
;;					    ("8ef" "eimlfang")
;;
;;))



;; 最近打开文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(provide 'init-better-defaults)
