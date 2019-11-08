(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

;; company quick help requires diminish
(require-package 'diminish)

(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (after-load 'company
    (dolist (backend '(company-eclim company-semantic))
      (delq backend company-backends))
    (diminish 'company-mode)
    (define-key company-mode-map (kbd "M-/") 'company-complete)
    (define-key company-active-map (kbd "M-/") 'company-other-backend)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (setq-default company-dabbrev-other-buffers 'all
                  company-tooltip-align-annotations t))
  (global-set-key (kbd "M-C-/") 'company-complete)
  (when (maybe-require-package 'company-quickhelp)
    (add-hook 'after-init-hook 'company-quickhelp-mode)))

;; Suspend page-break-lines-mode while company menu is active
;; (see https://github.com/company-mode/company-mode/issues/416)
(after-load 'company
  (after-load 'page-break-lines
    (defvar-local sanityinc/page-break-lines-on-p nil)

    (defun sanityinc/page-break-lines-disable (&rest ignore)
      (when (setq sanityinc/page-break-lines-on-p (bound-and-true-p page-break-lines-mode))
        (page-break-lines-mode -1)))

    (defun sanityinc/page-break-lines-maybe-reenable (&rest ignore)
      (when sanityinc/page-break-lines-on-p
        (page-break-lines-mode 1)))

    (add-hook 'company-completion-started-hook 'sanityinc/page-break-lines-disable)
    (add-hook 'company-after-completion-hook 'sanityinc/page-break-lines-maybe-reenable)
    (add-hook 'prog-mode-hook (company-mode))
    (add-hook 'prog-mode-hook (company-quickhelp-mode))))

(provide 'init-company)
