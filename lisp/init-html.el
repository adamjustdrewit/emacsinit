(require-package 'tagedit)
(require-package 'emmet-mode)
(after-load 'sgml-mode
  (tagedit-add-paredit-like-keybindings)
  (define-key tagedit-mode-map (kbd "M-?") nil)
  (define-key tagedit-mode-map (kbd "M-s") nil)
  (add-hook 'sgml-mode-hook (lambda ()
			      (tagedit-mode 1)
			      (emmet-mode 1))))

(provide 'init-html)
