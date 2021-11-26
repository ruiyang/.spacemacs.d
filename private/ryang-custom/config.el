(set-face-attribute 'default nil :height 160)
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

(require 'grep)
(grep-apply-setting 'grep-find-command '("find . -type f -exec grep -i -nH -e  \\{\\} +" . 37))

(setq elfeed-feeds
      '(("http://martinfowler.com/feed.atom" tech)
        ("http://feeds.feedburner.com/SanityInc" tech)
        ("http://blog.guillermowinkler.com/atom.xml" tech)
        ("http://feed.codeofrob.com/RobAshton" tech)
        ("http://blog.8thlight.com/feed/atom.xml" tech bob)
        ("http://feeds2.feedburner.com/StuartSierra" tech bob)
        ("https://www.thekua.com/atwork/" tech)
        ("http://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-only.xml" tech emacs)
        ("http://sachachua.com/blog/category/emacs-news/feed/" tech emacs)
        ("https://scotthelme.co.uk/rss/" tech security)
        ))

;;(setq dired-listing-switches "-alh")

(subword-mode t)
