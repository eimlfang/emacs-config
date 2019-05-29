;; org

(with-eval-after-load 'org
  (setq org-src-fontify-natively t)

  (setq org-agenda-files '("~/.emacs.d/org"))
  
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/org/gtd.org" "工作安排")
	   "* TODO [#8] %?\n %i\n"
	   :empty-lines 1)))
  )



(defun org-remember ()
  "Todo org file at ~/.emacs.d/org/gtd.org"
  (interactive)
  'org-capture)

(provide 'init-org)
