;; 绑定F2到快速打开init.el
(global-set-key (kbd "<f2>") 'open-my-init-file)
;; 绑定F3到快速打开keymap.md
(global-set-key (kbd "<f3>") 'open-keymap)

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

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "s-/") 'hippie-expand)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; (global-set-key (kbd "C-c z") 'reveal-in-osx-finder)

;; 显示所有函数
(global-set-key (kbd "M-s i") 'counsel-imenu) 

(global-set-key (kbd "C-=") 'er/expand-region)

;; (global-set-key (kbd "M-s e") 'iedit-mode)

(global-set-key (kbd "M-s m") 'set-mark-command)

;; (global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "C-c a") 'org-agenda)

;; company模式下使用C-n C-p

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-n") #'company-select-previous))





(provide 'init-keybindings)
