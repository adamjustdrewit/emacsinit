(defun vue-web-mode-hook ()
  "Hooks for Web mode."
  (interactive)
  (setq-local web-mode-markup-indent-offset 2)
  (setq-local web-mode-css-indent-offset 2)
  (setq-local web-mode-code-indent-offset 2)
  (setq-local web-mode-style-padding 0)
  (setq-local web-mode-script-padding 0)
  (setq-local web-mode-block-padding 0))


  
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-hook 'web-mode-hook  (lambda ()
                            (vue-web-mode-hook)
                            (flycheck-mode)))

(with-eval-after-load 'flycheck
  (flycheck-add-mode 'javascript-eslint 'web-mode))



(provide 'init-vue)
