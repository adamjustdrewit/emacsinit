(require-package 'js2-refactor)
(require-package 'xref-js2)
(require-package 'tide)
(require-package 'mocha)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(defun setup-indenting ()
  (lambda ()
  (setq-local coffee-tab-width n) ; coffeescript
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n)))

(defvar drewit/javascript-test-prefix-map (make-sparse-keymap)
  "A kepmap for running unit tests")

(define-key drewit/javascript-test-prefix-map (kbd "p") 'mocha-test-project)
(define-key drewit/javascript-test-prefix-map (kbd "f") 'mocha-test-file)
(define-key drewit/javascript-test-prefix-map (kbd "t") 'mocha-test-at-point)

(defvar drewit/javascript-refactor-prefix-map (make-sparse-keymap)
  "A kepmap for refactorings")
(define-key drewit/javascript-refactor-prefix-map (kbd "r") 'tide-rename-symbol)
(define-key drewit/javascript-refactor-prefix-map (kbd "f") 'tide-format)
(define-key drewit/javascript-refactor-prefix-map (kbd ".") 'tide-refactor)
(define-key drewit/javascript-refactor-prefix-map (kbd "d") 'tide-jsdoc-template)

(when (maybe-require-package 'js2-mode)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-hook 'js2-mode-hook (lambda ()
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
			   (company-mode)
			   (setup-tide-mode)
			   (setup-indenting)
			   (local-set-key (kbd "C-c t") drewit/javascript-test-prefix-map)
			   (local-set-key (kbd "C-c r") drewit/javascript-refactor-prefix-map)
			   (origami-mode))))




(provide 'init-javascript)


