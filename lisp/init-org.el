;; org文档添加语法高亮
(require 'org)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
