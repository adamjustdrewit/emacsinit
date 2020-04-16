;; grab some projectile
(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  (after-load 'projectile
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

  (maybe-require-package 'ibuffer-projectile))

(when (maybe-require-package 'counsel-projectile)
  (add-hook 'after-init-hook 'consel-projectile-find-file)
  )

(projectile-mode)
(counsel-projectile-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq projectile-globally-ignored-directories '("-/node_modules")

(provide 'init-projects)
