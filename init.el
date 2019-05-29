(add-to-list 'load-path "~/.emacs.d/lisp")

;; 快速打开init.el
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)

(delete-selection-mode t)

(setq enable-recursive-minibuffers t)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
