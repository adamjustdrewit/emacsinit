
;; Export back ends
(require-package 'ox-html5slide)
(require-package 'ox-twbs)
(require-package 'ox-mediawiki)

(when (maybe-require-package 'org-bullets)
  (add-hook 'org-mode-hook (lambda ()
			     (org-bullets-mode 1)
			     (require 'ox-html5slide)
			     (require 'ox-twbs)
			     (require 'ox-mediawiki)
			     (local-set-key (kbd "C-c a") #'org-agenda-list))))

(defun drewit/setup-org ()
  (setq org-todo-keywords
	'((sequence "TODO(t)" "RSCH(r)" "BUGG(b)" "InPr" "PARK(p)" "|" "DONE(d)" "DLGT(D)"))
	)
  (setq org-agenda-files '("E:/docs/.org/todo.org"))
  ;;capture todo items using C-c c t
  (define-key global-map (kbd "C-c c") 'org-capture)
  (setq org-capture-templates
	'(("t" "todo" entry (file+headline "E:/docs/.org/todo.org" "Tasks")
	   "* TODO  %?\nSCHEDULED: %t")
	  ("r" "refactoring" entry (file+headline "E:/docs/.org/refactorings.org" "Todo")
	   "* TODO %?")))
  ;;open agenda in current window
  (setq org-agenda-window-setup (quote current-window)))

(add-hook 'after-init-hook 'drewit/setup-org)

(provide 'init-org)

