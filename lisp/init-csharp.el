(defvar drewit/csharp-refactor-prefix-map (make-sparse-keymap)
  "A kepmap for refactorings")
(define-key drewit/csharp-refactor-prefix-map (kbd "r") 'omnisharp-rename)
(define-key drewit/csharp-refactor-prefix-map (kbd "f") 'omnisharp-code-format-entire-file)
(define-key drewit/csharp-refactor-prefix-map (kbd ".") 'omnisharp-run-code-action-refactoring)
(define-key drewit/csharp-refactor-prefix-map (kbd "i") 'omnisharp-find-implementations)
(define-key drewit/csharp-refactor-prefix-map (kbd "u") 'omnisharp-find-usages)

(defvar my-goto-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map goto-map)
    map))

(defun drewit/csharp-mode-setup ()
  (lambda ()
    (omnisharp-mode)
    (company-mode)
    (company-quickhelp-mode)
    (origami-mode)
    (flycheck-mode)
    (add-to-list 'company-backends #'company-omnisharp)
    (setq company-frontends
	  (quote (company-pseudo-tooltip-frontend company-echo-metadata-frontend)))
    (setq omnisharp-auto-complete-want-documentation nil)
    (local-set-key (kbd "C-c r") drewit/csharp-refactor-prefix-map)
    (local-set-key (kbd "M-.") 'omnisharp-go-to-definition)
    (local-set-key (kbd "C-c C-c") 'recompile)))


(when (maybe-require-package 'omnisharp)
  (add-hook 'csharp-mode-hook (drewit/csharp-mode-setup)))

(provide 'init-csharp)
  
