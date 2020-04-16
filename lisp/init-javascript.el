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
  (tide-hl-identifier-mode +1))

(defun drewit/indent-js (n)
  (interactive)
  (setq-local coffee-tab-width n) ; coffeescript
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n)
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level))
  )

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
			   (drewit/indent-js 2)
			   (local-set-key (kbd "C-c t") drewit/javascript-test-prefix-map)
			   (local-set-key (kbd "C-c r") drewit/javascript-refactor-prefix-map))))


;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)


(provide 'init-javascript)


