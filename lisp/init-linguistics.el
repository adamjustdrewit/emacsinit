(when (maybe-require-package 'define-word)
  (add-hook 'after-init-hook (global-set-key (kbd "C-c d") 'define-word-at-point)))

(provide 'init-linguistics)
