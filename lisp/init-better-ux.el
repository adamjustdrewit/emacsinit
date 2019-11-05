;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; set backup directory
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; give me ibuffer over buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(show-paren-mode 1)
(global-linum-mode)

;; Represent undo-history as an actual tree (visualize with C-x u)
(require-package 'undo-tree)
(setq undo-tree-mode-lighter "")
(global-undo-tree-mode)

(require 'hl-line)
(global-hl-line-mode)

;; A decent tree menu should be build in
(require-package 'neotree)

;; Stop neotree from being annoying and refreshing
(setq neo-autorefresh nil)
;; Every time when the neotree window is opened, let it find current file and jump to node.
(setq neo-smart-open t)

(global-set-key [f8] 'neotree-toggle)

;; Folding should just work
(when (maybe-require-package 'origami)
  (after-load 'origami
    (define-key origami-mode-map (kbd "C-c f") 'origami-recursively-toggle-node)
    (define-key origami-mode-map (kbd "C-c F") 'origami-toggle-all-nodes)))

(when (maybe-require-package 'which-key)
  (after-load 'which-key)
  (which-key-mode))

(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Brackets should autocompete
(add-hook 'prog-mode-hook (lambda () (electric-pair-local-mode 1)))

(when (maybe-require-package 'ace-window)
  (after-load 'ace-window)
  (global-set-key (kbd "M-p") 'ace-window))

(provide 'init-better-ux)

