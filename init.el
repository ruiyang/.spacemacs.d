;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/private/")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(html
     typescript
     python
     csv
     yaml
     sql
     ruby
     shell
;;     lsp
     java
     (osx :variables   osx-command-as       'meta
                       osx-option-as        'hyper
                       osx-control-as       'control
                       osx-function-as       nil
                       osx-right-command-as 'left
                       osx-right-option-as  'left
                       osx-right-control-as 'left
                       osx-swap-option-and-command nil)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     auto-completion
     emacs-lisp
     git
     markdown
     (org :variables
          org-roam-v2-ack t
          org-enable-roam-support t
          org-enable-org-journal-support t)
     spell-checking
     syntax-checking
     version-control
     javascript
     react
     clojure
     terraform
     ryang-custom
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(browse-kill-ring elfeed add-node-modules-path restclient company-restclient groovy-mode markdown-preview-mode exec-path-from-shell desktop+)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; QUICKLY Tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 30
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq org-agenda-files `("~/Dropbox/Org/current"))
  (setq org-roam-directory "~/Dropbox/org-roam")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; visual line mode globally to automatically wrap long text
;;  (global-visual-line-mode nil)
  ; START TABS CONFIG
  ;; Create a variable for our preferred tab width
  (setq custom-tab-width 2)

  ;; Two callable functions for enabling/disabling tabs in Emacs
  (defun disable-tabs () (setq indent-tabs-mode nil))
  (defun enable-tabs  ()
    (local-set-key (kbd "TAB") 'tab-to-tab-stop)
    (setq indent-tabs-mode t)
    (setq tab-width custom-tab-width))

  ;; Hooks to Enable Tabs
  (add-hook 'prog-mode-hook 'disable-tabs)
  ;; Hooks to Disable Tabs
  (add-hook 'lisp-mode-hook 'disable-tabs)
  (add-hook 'emacs-lisp-mode-hook 'disable-tabs)

  ;; Language-Specific Tweaks
  (setq js-indent-level custom-tab-width)      ;; Javascript

  ;; Making electric-indent behave sanely
  (setq-default electric-indent-inhibit t)

  ;; Make the backspace properly erase the tab instead of
  ;; removing 1 space at a time.
  (setq backward-delete-char-untabify-method 'hungry)

  ;; (OPTIONAL) Shift width for evil-mode users
  ;; For the vim-like motions of ">>" and "<<".
  (setq-default evil-shift-width custom-tab-width)

  ;; WARNING: This will change your life
  ;; (OPTIONAL) Visualize tabs as a pipe character - "|"
  ;; This will also show trailing characters as they are useful to spot.
  ;; (setq whitespace-style '(face tabs tab-mark trailing))
  ;; (custom-set-faces
  ;;  '(whitespace-tab ((t (:foreground "#636363")))))
  ;;                                       ; 124 is the ascii ID for '\|'
  ;; (setq whitespace-display-mappings
  ;;       '((tab-mark 9 [124 9] [92 9])))
  ;; (global-whitespace-mode)
  ;;                                       ; Enable whitespace mode everywhere
  ;;                                       ; END TABS CONFIG
  (setq epa-pinentry-mode 'loopback)
;;  (setq shell-file-name "/usr/local/bin/zsh")
  (require 'shell)
  (define-key shell-mode-map (kbd "C-j") 'ryang/switch-shell-dir)
  (setq standard-indent 2)

  (setq desktop+-base-dir "~/.spacemacs.d")
  
  (if (file-exists-p (concat desktop+-base-dir "/desktops"))
     (progn
       (desktop+-load "desktops")))

 (set-face-attribute 'default nil
                     :family "Source Code Pro"
                     :height 220
                     :weight 'normal
                     :width 'normal)

 (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  (if (string-equal system-type "windows-nt")
      (progn
        (setq projectile-enable-caching t)
        (setq projectile-indexing-method 'alien)))
  (require 'projectile)
  (projectile-register-project-type 'npm '("package.json")
                                    :compile "yarn install --pure-lockfile"
                                    :test "yarn run test"
                                    :run "yarn run start"
                                    :test-suffix "Test")
  (eval-after-load 'js-mode
    '(add-hook 'js-mode-hook #'add-node-modules-path))

  (add-hook 'java-mode-hook (lambda ()
                              (setq c-basic-offset 2)))
  
  (setq explicit-shell-file-name "/bin/zsh")
  (setq markdown-command "pandoc")
  (setq markdown-preview-stylesheets (list "http://thomasf.github.io/solarized-css/solarized-light.min.css"))
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "p" 'markdown-outline-previous-same-level)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "n" 'markdown-outline-next-same-level)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "P" 'markdown-outline-previous)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "N" 'markdown-outline-next)
  (spacemacs/set-leader-keys "aordc" 'org-roam-dailies-capture-today)
  (spacemacs/set-leader-keys "nf" 'org-roam-node-find)
  (spacemacs/set-leader-keys "ni" 'org-roam-node-insert)
  (spacemacs/set-leader-keys "ndc" 'org-id-copy)
  (spacemacs/set-leader-keys "ndu" 'org-id-update-id-locations)

  (with-eval-after-load 'org
    ;; here goes your Org config :)
    (setq org-roam-completion-everywhere t)
    (set (make-local-variable 'company-backends)
         '((company-capf)))
    (setq org-todo-keywords
          (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)"))))
    (setq org-todo-keyword-faces
          (quote (("TODO" :foreground "red" :weight bold)
                  ("NEXT" :foreground "blue" :weight bold)
                  ("DONE" :foreground "forest green" :weight bold)
                  ("WAITING" :foreground "orange" :weight bold)
                  ("HOLD" :foreground "magenta" :weight bold)
                  ("CANCELLED" :foreground "forest green" :weight bold)
                  ("MEETING" :foreground "forest green" :weight bold)
                  ("PHONE" :foreground "forest green" :weight bold))))
    (setq org-use-fast-todo-selection t)
    (setq org-roam-dailies-capture-templates
          '(("d" "default" entry "* %?   %<%H:%M>"
             :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
    (setq org-capture-templates
          (quote (("t" "todo" entry (file  "~/Dropbox/Org/current/refile.org")
                   "* TODO %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a>>\")\n")
                  ("n" "note" entry (file "~/Dropbox/Org/current/refile.org")
                   "* %? :NOTE:\n")
                  ("j" "Journal" entry (file "~/Dropbox/Org/current/refile.org")
                   "* %?\n")
                  ("w" "org-protocol" entry (file "~/Dropbox/Org/current/refile.org")
                   "* TODO Review %c\n" :immediate-finish t)
                  ("m" "Meeting" entry (file "~/Dropbox/Org/current/refile.org")
                   "* MEETING with %? :MEETING:\n")
                  ("p" "Phone call" entry (file "~/Dropbox/Org/current/refile.org")
                   "* PHONE %? :PHONE:\n")
                  ("h" "Habit" entry (file "~/Dropbox/Org/current/refile.org")
                   "* NEXT %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

    ;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
    ;; (setq org-refile-targets (quote ((nil :maxlevel . 9)
    ;;                                  (org-agenda-files :maxlevel . 9)
    ;;                                  ("~/Dropbox/Org/technical_note.org" :maxlevel . 9)
    ;;                                  ("~/Dropbox/Org/notes.org" :maxlevel . 9))))

    ;; Use full outline paths for refile targets - we file directly with IDO
;;    (setq org-refile-use-outline-path 'file)

    ;; Targets complete directly with IDO
;;    (setq org-outline-path-complete-in-steps nil)

    ;; Allow refile to create parent tasks with confirmation
;;    (setq org-refile-allow-creating-parent-nodes (quote confirm))

;;    (setq org-indirect-buffer-display 'current-window)
;;    (setq org-agenda-skip-scheduled-if-done t)
    ;; Refile settings
    ;; Exclude DONE state tasks from refile targets
    ;; (defun bh/verify-refile-target ()
    ;;   "Exclude todo keywords with a done state from refile targets"
    ;;   (not (member (nth 2 (org-heading-components)) org-done-keywords)))

    ;; (setq org-refile-target-verify-function 'bh/verify-refile-target)
    ;; (setq org-agenda-dim-blocked-tasks nil)
    ;; (setq org-agenda-compact-blocks nil)
    )
  (add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))
  (require 'company-restclient) 
  (add-hook 'restclient-mode-hook (lambda () (company-mode t)
                                    (add-to-list 'company-backends 'company-restclient)))
  (setq-default typescript-indent-level 2)
  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(desktop-save-mode nil)
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(tern company-terraform terraform-mode hcl-mode fasd yapfify yaml-mode ws-butler winum which-key wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tide tagedit sql-indent spaceline smex smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs request rbenv rake rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements phpunit phpcbf php-extras php-auto-yasnippets persp-mode paradox orgit org-projectile org-present org-pomodoro org-mime org-download open-junk-file neotree move-text mmm-mode minitest markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc ivy-hydra indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-make groovy-mode google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy flyspell-correct-ivy flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu emmet-mode elisp-slime-nav elfeed dumb-jump drupal-mode diminish diff-hl define-word cython-mode csv-mode counsel-projectile company-web company-tern company-statistics company-restclient company-anaconda column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby bundler browse-kill-ring auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent add-node-modules-path adaptive-wrap ace-window ace-link ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:foreground "#636363")))))
)
