(defconst ryang-custom-packages
  '(
    (revive :location local)
    ))

(defun ryang-custom/init-revive ()
  (use-package revive
    :config
    (progn
      (if (file-exists-p "~/.revive.el")
          (resume)))))

