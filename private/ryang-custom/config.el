(set-face-attribute 'default nil :height 200)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-width 2)
(setq javascript-indent-level 2) ; javascript-mode
(setq js-indent-level 2) ; js-mode
(setq js2-basic-offset 2) ; js2-mode
(setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
(setq web-mode-css-indent-offset 2) ; web-mode, css in html file
(setq web-mode-code-indent-offset 2) ; web-mode, js code in html file
(setq css-indent-offset 2) ; css-mode
(setq web-mode-attr-indent-offset 2)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
(setq mac-command-key-is-meta t)
(setq mac-option-key-is-meta nil)
(setq default-input-method "MacOSX")

(setq elfeed-feeds
      '(("http://martinfowler.com/feed.atom" tech)
        ("http://feeds.feedburner.com/SanityInc" tech)
        ("http://blog.guillermowinkler.com/atom.xml" tech)
        ("http://feed.codeofrob.com/RobAshton" tech)
        ("http://blog.8thlight.com/feed/atom.xml" tech bob)
        ("http://feeds2.feedburner.com/StuartSierra" tech bob)
        ("http://www.oursteps.com.au/bbs/forum.php?mod=rss&fid=89&auth=3f702nWzBrApV5bHyKdRBOPcQJqHLck4M5lXD%2F0W%2BG0mOJT7rUWeGhMaCFvIBQ" portal shop)
        ("https://www.thekua.com/atwork/" tech)
        ("https://www.oursteps.com.au/bbs/forum.php?mod=rss&fid=109&auth=bd292ZqcUidYHDNXRLIbL0%2BjQQmv8ELbVh5wVEi8AUeCSvXyBLy5HilZ1m%2FPZ5A" car)
        ))

(setq dired-listing-switches "-alh")

(subword-mode t)
