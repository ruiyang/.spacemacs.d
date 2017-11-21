(defconst ryang-groovy-packages
  '(groovy-mode
    smart-ops
    ggtags
    helm-gtags
    ;;    counsel-gtags
    ))

(defun ryang-groovy/init-groovy-mode ()
  (use-package groovy-mode
    :defer t
    :mode ("\\.groovy$" . groovy-mode)
    :config
    (progn
      (setq groovy-home "/usr/local/")
      (add-hook 'groovy-mode-hook
                (lambda ()
                  (set (make-local-variable 'company-backends)
                       (setq company-backends
                               '((
                                  company-gtags
                                  )))))))))

(defun ryang-groovy/post-init-smart-ops ()
  (use-package smart-ops
    :config
    (progn
      (add-hook 'groovy-mode-hook #'smart-ops-mode)

      (define-smart-ops-for-mode 'groovy-mode
        (smart-ops ":" "," :pad-before nil)
        (smart-ops-default-ops))

      (define-smart-ops-for-mode 'inferior-groovy-mode
        (smart-ops ":" "," :pad-before nil)
        (smart-ops-default-ops)))))

(defun ryang-groovy/init-ggtags ()
  (use-package ggtags
    :config
    (progn
      (add-hook 'groovy-mode-hook
                (lambda ()
                  (ggtags-mode 1)))
      (define-key ggtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
      (define-key ggtags-mode-map (kbd "C-x 4 .") 'helm-gtags-find-tag-other-window)
      (define-key ggtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
      (define-key ggtags-mode-map (kbd "M-*") 'helm-gtags-pop-stack)
      )))

(defun ryang-groovy/init-helm-gtags ()
  (use-package helm-gtags))
