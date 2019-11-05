(defun fullscreen (&optional f)
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
             '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
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

(sleep-for 0.5)

(dashboard-setup-startup-hook)

(provide 'init-startup)
