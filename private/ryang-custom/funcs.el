;; make lines unique recursively.
(require 'cl-lib)

(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun ryang/uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

(defun ryang/bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

;; format json
(defun ryang/json-format ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
                             "python -mjson.tool" (current-buffer) t)))

(defun ryang/sudo-edit (&optional arg)
  (interactive "p")
  (if (not buffer-file-name)
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun ryang/shell-help ()
  (interactive)
  (find-file "~/.spacemacs.d/private/ryang-custom/help/shell.org"))

(defun ryang/org-help ()
  (interactive)
  (find-file "~/.spacemacs.d/private/ryang-custom/help/org.org"))

(defun ryang/copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun ryang/open-buffer-path ()
  "Run explorer on the directory of the current buffer."
  (interactive)
  (shell-command (concat "nautilus " (buffer-file-name))))

(defun ryang/align-repeat (start end regexp)
    "Repeat alignment with respect to
     the given regular expression."
    (interactive "r\nsAlign regexp: ")
    (align-regexp start end
        (concat "\\(\\s-*\\)" regexp) 1 1 t))

(defun ryang/delete-all-blank-lines ()
  "Remove all blank lines in the buffer."
  (interactive)
  (flush-lines "^$"))

(if (and (fboundp 'server-running-p) 
         (not (server-running-p)))
    (server-start))

(defmacro ->> (&rest body)
  (let ((result (pop body)))
    (dolist (form body result)
      (setq result (append form (list result))))))

(defmacro -> (&rest body)
  (let ((result (pop body)))
    (dolist (form body result)
      (setq result (append (list (car form) result)
                           (cdr form))))))

(defun ryang/get-dir-depth (path)
  (let* ((names (split-string path "/"))
         (names-no-empty (cl-remove-if '(lambda (n)
                                          (= (length n)
                                             0))
                                       names))
         (path-length (length names-no-empty)))
    path-length))

(defun ryang/switch-shell-dir ()
  "Switch the shell directory with autocompletion"
  (interactive)
  (let* ((candidates (->> recentf-list
                     (mapcar 'file-name-directory )
                     (cl-remove-if '(lambda (f)
                                      (or (string-match-p (regexp-quote ".") f)
                                          (> (ryang/get-dir-depth f) 6))
                                      ))
                     (delete-dups)))
         (found (ivy-read "matches " candidates :sort t))
         (dir found)
;;         (dir (read-from-minibuffer "" found))
         )
    (funcall comint-input-sender
             (get-buffer-process (current-buffer))
             (concat "cd " dir))
    (cd dir)))
