(defun fullscreen (&optional f)
  (interactive)
  (toggle-frame-maximized))
(fullscreen)

(toggle-transparency)
(toggle-transparency)

;; Dashboard me holmes
(require-package 'dashboard)
(setq dashboard-startup-banner "~/.emacs.d/home.gif")
(setq dashboard-show-shortcuts nil)
(setq dashboard-banner-logo-title "Minty is just the opposite of Chilli - Danylo Pavlov (2019)")
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-center-content t)

(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)))

(sleep-for 0.5)

(dashboard-setup-startup-hook)

(provide 'init-startup)
