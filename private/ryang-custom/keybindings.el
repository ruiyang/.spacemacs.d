(global-set-key [f2] 'find-name-dired)
(global-set-key [f5] 'refresh-file)
(global-set-key [f6] 'find-grep)
(global-set-key [f7] 'replace-string)
(global-set-key [(f12)] 'save-buffers-kill-emacs)

(global-set-key [(control x) (k)] 'kill-this-buffer)
(global-set-key [(control x) (control y)] 'browse-kill-ring)
(global-set-key (kbd "C-f") 'forward-word)
(global-set-key (kbd "C-b") 'backward-word)
(global-set-key (kbd "M-f") 'forward-char)
(global-set-key (kbd "M-b") 'backward-char)
;; copy file name to clipboard
(global-set-key (kbd "C-S-c") 'ryang/copy-file-name-to-clipboard)
;; increase/decrease fonts
(global-set-key (kbd "C-M-=") 'text-scale-increase)
(global-set-key (kbd "C-M--") 'text-scale-decrease)
;; override killing emacs key
(global-unset-key "\C-x\C-c")
(global-unset-key "\C-x\C-z")

(global-set-key (kbd "C-x C-f") 'ido-find-file)

(global-set-key (kbd "C-M-=") 'text-scale-increase)
(global-set-key (kbd "C-M--") 'text-scale-decrease)
