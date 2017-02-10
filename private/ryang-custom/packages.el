(setq ryang-custom-packages
  '(
    browse-kill-ring
    revive
    elfeed
    ))

(defun clojure/init-cider ()
  (use-package cider
    :defer t
    :init
    (progn
      (spacemacs/register-repl 'cider 'cider-jack-in "cider")
      (setq cider-stacktrace-default-filters '(tooling dup)
            cider-repl-pop-to-buffer-on-connect nil
            cider-prompt-save-file-on-load nil
            cider-repl-use-clojure-font-lock t)
      (push "\\*cider-repl\.\+\\*" spacemacs-useful-buffers-regexp)
      (add-hook 'clojure-mode-hook 'cider-mode)
      (dolist (x '(spacemacs-jump-handlers-clojure-mode
                   spacemacs-jump-handlers-clojurec-mode
                   spacemacs-jump-handlers-clojurescript-mode
                   spacemacs-jump-handlers-clojurex-mode
                   spacemacs-jump-handlers-cider-repl-mode))
        (add-to-list x 'cider-find-var)))
    :config
    (progn
      ;; add support for golden-ratio
      (with-eval-after-load 'golden-ratio
        (push 'cider-popup-buffer-quit-function golden-ratio-extra-commands))
      ;; add support for evil
      (evil-set-initial-state 'cider-stacktrace-mode 'motion)
      (evil-set-initial-state 'cider-popup-buffer-mode 'motion)
      (add-hook 'cider--debug-mode-hook 'spacemacs/cider-debug-setup)

      (evilified-state-evilify cider-stacktrace-mode cider-stacktrace-mode-map
        (kbd "C-j") 'cider-stacktrace-next-cause
        (kbd "C-k") 'cider-stacktrace-previous-cause
        (kbd "TAB") 'cider-stacktrace-cycle-current-cause
        (kbd "0")   'cider-stacktrace-cycle-all-causes
        (kbd "1")   'cider-stacktrace-cycle-cause-1
        (kbd "2")   'cider-stacktrace-cycle-cause-2
        (kbd "3")   'cider-stacktrace-cycle-cause-3
        (kbd "4")   'cider-stacktrace-cycle-cause-4
        (kbd "5")   'cider-stacktrace-cycle-cause-5
        (kbd "a")   'cider-stacktrace-toggle-all
        (kbd "c")   'cider-stacktrace-toggle-clj
        (kbd "d")   'cider-stacktrace-toggle-duplicates
        (kbd "J")   'cider-stacktrace-toggle-java
        (kbd "r")   'cider-stacktrace-toggle-repl
        (kbd "T")   'cider-stacktrace-toggle-tooling)

      ;; open cider-doc directly and close it with q
      (setq cider-prompt-for-symbol nil)

      (evilified-state-evilify cider-docview-mode cider-docview-mode-map
        (kbd "q") 'cider-popup-buffer-quit)

      (evilified-state-evilify cider-inspector-mode cider-inspector-mode-map
        (kbd "L") 'cider-inspector-pop
        (kbd "n") 'cider-inspector-next-page
        (kbd "N") 'cider-inspector-previous-page
        (kbd "r") 'cider-inspector-refresh)

      (evilified-state-evilify cider-test-report-mode cider-test-report-mode-map
        (kbd "C-j") 'cider-test-next-result
        (kbd "C-k") 'cider-test-previous-result
        (kbd "RET") 'cider-test-jump
        (kbd "d")   'cider-test-ediff
        (kbd "e")   'cider-test-stacktrace
        (kbd "q")   'cider-popup-buffer-quit
        (kbd "r")   'cider-test-rerun-tests
        (kbd "t")   'cider-test-run-test
        (kbd "T")   'cider-test-run-ns-tests)

      ;; TODO: having this work for cider-macroexpansion-mode would be nice,
      ;;       but the problem is that it uses clojure-mode as its major-mode

      (setq cider--key-binding-prefixes
            '(("md" . "debug")
              ("me" . "evaluation")
              ("mg" . "goto")
              ("mh" . "documentation")
              ("ms" . "repl")
              ("mt" . "test")
              ("mT" . "toggle")
              ("mf" . "format")))
      (dolist (m '(clojure-mode
                   clojurec-mode
                   clojurescript-mode
                   clojurex-mode
                   cider-repl-mode
                   cider-clojure-interaction-mode))
        (mapc (lambda (x) (spacemacs/declare-prefix-for-mode
                           m (car x) (cdr x)))
              cider--key-binding-prefixes)

        (spacemacs/set-leader-keys-for-major-mode m
          "ha" 'cider-apropos
          "hh" 'cider-doc
          "hg" 'cider-grimoire
          "hj" 'cider-javadoc
          "hn" 'cider-browse-ns

          "eb" 'cider-eval-buffer
          "ee" 'cider-eval-last-sexp
          "ef" 'cider-eval-defun-at-point
          "em" 'cider-macroexpand-1
          "eM" 'cider-macroexpand-all
          "er" 'cider-eval-region
          "ew" 'cider-eval-last-sexp-and-replace

          "="  'cider-format-buffer
          "fb" 'cider-format-buffer

          "gb" 'cider-pop-back
          "gC" 'cider-classpath
          "ge" 'cider-jump-to-compilation-error
          "gr" 'cider-jump-to-resource
          "gn" 'cider-browse-ns
          "gN" 'cider-browse-ns-all

          "'"  'cider-jack-in
          "\""  'cider-jack-in-clojurescript
          "sb" 'cider-load-buffer
          "sB" 'spacemacs/cider-send-buffer-in-repl-and-focus
          "sc" (if (eq m 'cider-repl-mode)
                   'cider-repl-clear-buffer
                 'cider-connect)
          "sC" 'cider-find-and-clear-repl-output
          "se" 'spacemacs/cider-send-last-sexp-to-repl
          "sE" 'spacemacs/cider-send-last-sexp-to-repl-focus
          "sf" 'spacemacs/cider-send-function-to-repl
          "sF" 'spacemacs/cider-send-function-to-repl-focus
          "si" 'cider-jack-in
          "sI" 'cider-jack-in-clojurescript
          "sn" 'spacemacs/cider-send-ns-form-to-repl
          "sN" 'spacemacs/cider-send-ns-form-to-repl-focus
          "so" 'cider-repl-switch-to-other
          "sq" 'cider-quit
          "sr" 'spacemacs/cider-send-region-to-repl
          "sR" 'spacemacs/cider-send-region-to-repl-focus
          "ss" (if (eq m 'cider-repl-mode)
                   'cider-switch-to-last-clojure-buffer
                 'cider-switch-to-repl-buffer)
          "sx" 'cider-refresh

          "Te" 'cider-enlighten-mode
          "Tf" 'spacemacs/cider-toggle-repl-font-locking
          "Tp" 'spacemacs/cider-toggle-repl-pretty-printing
          "Tt" 'cider-auto-test-mode

          "ta" 'spacemacs/cider-test-run-all-tests
          "tb" 'cider-test-show-report
          "tl" 'spacemacs/cider-test-run-loaded-tests
          "tp" 'spacemacs/cider-test-run-project-tests
          "tn" 'spacemacs/cider-test-run-ns-tests
          "tr" 'spacemacs/cider-test-rerun-tests
          "tt" 'spacemacs/cider-test-run-focused-test

          "db" 'cider-debug-defun-at-point
          "de" 'spacemacs/cider-display-error-buffer
          "di" 'cider-inspect))

      ;; cider-repl-mode only
      (spacemacs/set-leader-keys-for-major-mode 'cider-repl-mode
        "," 'cider-repl-handle-shortcut)

      (spacemacs/set-leader-keys-for-major-mode 'cider-clojure-interaction-mode
        "ep" 'cider-eval-print-last-sexp)

      (evil-define-key 'normal cider-repl-mode-map
        "C-j" 'cider-repl-next-input
        "C-k" 'cider-repl-previous-input)

      (when clojure-enable-fancify-symbols
        (clojure/fancify-symbols 'cider-repl-mode)
        (clojure/fancify-symbols 'cider-clojure-interaction-mode)))

    (defadvice cider-jump-to-var (before add-evil-jump activate)
      (evil-set-jump))))

(defun clojure/init-cider-eval-sexp-fu ()
  (with-eval-after-load 'eval-sexp-fu
    (require 'cider-eval-sexp-fu)))

