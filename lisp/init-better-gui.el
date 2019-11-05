;; Remove the screen stink
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)


;; no borders please
(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
(add-to-list 'initial-frame-alist no-border))

;; better frame titles
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Non-zero values for `line-spacing' can mess up ansi-term and co,
;; so we zero it explicitly in those cases.
(add-hook 'term-mode-hook
          (lambda ()
	    (setq line-spacing 0)))

;; Change global font size easily
(require-package 'default-text-scale)
(add-hook 'after-init-hook 'default-text-scale-mode)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Keep cursor away from edges when scrolling up/down
(require-package 'smooth-scrolling)

(setq nlinum-highlight-current-line 1)


(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(97 . 80) '(100 . 100)))))
(global-set-key (kbd "C-c C-t") 'toggle-transparency)

(provide 'init-better-gui)
