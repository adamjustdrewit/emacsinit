(require-package 'git-blamed)
(require-package 'gitignore-mode)
(require-package 'gitconfig-mode)
(when (maybe-require-package 'git-timemachine)
  (global-set-key (kbd "C-x v t") 'git-timemachine-toggle))

(when (maybe-require-package 'magit)
  (setq-default magit-diff-refine-hunk t)

  ;; Hint: customize `magit-repository-directories' so that you can use C-u M-F12 to
  ;; quickly open magit on any one of your projects.
  (global-set-key [(meta f12)] 'magit-status)
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch))


(after-load 'magit
  (define-key magit-status-mode-map (kbd "C-M-<up>") 'magit-section-up))

(require-package 'fullframe)
(after-load 'magit
  (fullframe magit-status magit-mode-quit-window))

;; Go to links when in a commit buffer
(when (maybe-require-package 'git-commit)
  (add-hook 'git-commit-mode-hook 'goto-address-mode))

(require 'init-git)

(maybe-require-package 'yagist)
(require-package 'bug-reference-github)
(add-hook 'prog-mode-hook 'bug-reference-prog-mode)

(maybe-require-package 'github-clone)
(maybe-require-package 'forge)
(maybe-require-package 'github-review)

(provide 'init-git)
