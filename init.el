(add-to-list 'load-path "~/.emacs.d/lisp")

;; 快速打开init.el
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-keymap()
  (interactive)
  (find-file "~/.emacs.d/doc/keymap.md"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)



(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
 
