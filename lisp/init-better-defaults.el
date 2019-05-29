;; 关闭提示音
(setq ring-bell-function 'ignore)
;; 从磁盘重新加载文件
(global-auto-revert-mode t)
;; 禁止备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)
;; 显示行号
(global-linum-mode t)

;; 高亮颜色
;; (set-face-attribute 'region nil :background "#666")

;; 匹配括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Heighlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

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

;; 文件锁进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-line
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)

(setq dired-dwim-target t)

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line ending."
  (interactive)
  (setq buffer-display-table (make-display-table)
	(aset buffer-display-table ?\^M [])))

(defun remove-dos-eol()
  "Replace DOS eolns CR LF with unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun occur-dwim ()
  "Call `occur` with a same default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (string sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

(set-language-environment "UTF-8")
(provide 'init-better-defaults)
