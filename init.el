;; This is my latest attempt at an end-game init file
;;
;; Aims for this set up are:
;;
;; 1) Easy to add to. It should be obvious where and how and change to this file should go
;; 2) Portable. I should be able to use this on my work computer as easily as my personal computer
;; 3) Small. Nothing in here that I don't need.
;; 4) As good as VSCode. This may be my last hurrah before I switch to VSCode, unless this is so good I don't feel the need to
;; 5) Sexy. I spend most of my life looking at this shit, so it should be pretty

;; Init.el
;; Bootstraps the configuration. Never change this unless something written earlier was wrong.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
;; Set this up at the start so it's nice and fast
(setq gc-cons-threshold 20000000)

(require 'init-utils)
(require 'init-elpa)
(require 'init-typography)
(require 'init-better-ux)
(require 'init-better-gui)
(require 'init-ivy)
(require 'init-projects)
(require 'init-shell)
(require 'init-theme)


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
(server-start))))


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'init-startup)

