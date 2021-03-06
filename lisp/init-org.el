
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
  (setq org-todo-keyword-faces
	'(("RSCH" . "purple") ("DONE" . "deep sky blue") ("BUGG" . "red") ("DLGT" . "light sea green") ("InPr" . "green") ("PARK" . "tomato") ("TODO" . "deep pink"))
	)
  (setq org-agenda-files '("E:/dropbox/Dropbox/.org/lf-todo.org" "E:/dropbox/Dropbox/.org/notes/lfbirthdays.org"))
  ;;capture todo items using C-c c t
  (define-key global-map (kbd "C-c c") 'org-capture)
  (setq org-capture-templates
	'(("t" "Task" entry (file+headline "E:/dropbox/Dropbox/.org/lf-todo.org" "Tasks")
	   "* TODO  %?\nSCHEDULED: %t")
          ("s" "Sprint Item" entry (file+headline "E:/dropbox/Dropbox/.org/lf-todo.org" "Sprint")
	   "* TODO  %?\nSCHEDULED: %t")
          ("S" "Support Item" entry (file+headline "E:/dropbox/Dropbox/.org/lf-todo.org" "Support")
	   "* TODO  %?\nSCHEDULED: %t")
	  ("r" "Refactoring" entry (file+headline "E:/dropbox/Dropbox/.org/refactorings.org" "Todo")
	   "* TODO %?")))
  ;;open agenda in current window
  (setq org-agenda-window-setup (quote current-window)))

(drewit/setup-org)

(defun drewit/my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(provide 'init-org)

