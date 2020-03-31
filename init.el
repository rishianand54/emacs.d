;;; init.el --- Initialization file for Emacs

;;; Commentary:

;;; Code:
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
						 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; use-package
(eval-when-compile (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

;; icons
(use-package all-the-icons)
(use-package all-the-icons-ivy
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))

;; theme
(use-package one-themes
  :init
  (load-theme 'one-dark t))

;; autosave configuarations
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/autosave/")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)

;; editor configurations
(setq-default tab-width 4)								;; indentation
(column-number-mode t)									;; column number
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)	;; word wrap
(electric-pair-mode t)									;; auto bracket completion

;; whitspace configuration
(setq whitespace-style (quote (space-mark tab-mark newline-mark)))

;; ibuffer
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

;; ivy
(use-package ivy
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  ("C-s" . swiper-isearch)
  ("C-c C-r" . ivy-resume))

;; counsel
(use-package counsel
  :init (counsel-mode t))

;; highlight indent guides
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; projectile
(use-package projectile
  :bind ("C-c p" . projectile-command-map)
  :config
  (setq projectile-project-search-path '("~/Projects/"))
  (projectile-mode t))

;; neotree
(use-package neotree
  :bind ([f8] . neotree-toggle))

;; company
(use-package company
  :config
  (global-company-mode t)
  (setq company-show-numbers t))

(use-package company-quickhelp
  :after company
  :config (company-quickhelp-mode t))

(use-package company-auctex
  :after (company auctex)
  :config (company-auctex-init))

(use-package company-math
  :after company
  :config (add-to-list 'company-backends 'company-math-symbols-unicode))

(use-package company-web
  :after company
  :bind ("C-'" . company-web-html))

;; langtool
(use-package langtool
  :init (setq langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*"))

;; magit
(use-package magit
  :bind ("C-x g" . magit-status))

;; org mode
(use-package org
  :bind
  ("\C-cl" . org-store-link)
  ("\C-ca" . org-agenda)
  ("\C-cc" . org-capture)
  ("\C-cb" . org-switchb)
  :config
  (setq org-todo-keywords '((sequence "doing" "todo" "|" "done")))
  (setq org-todo-keyword-faces '(("doing" . "yellow") ("todo" . "cyan") ("done" . "magenta"))))

;; markdown mode
(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode
  ("README\\.md\\'" . gfm-mode)
  ("\\.md\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode)
  :init (setq markdown-command "multimarkdown"))

;; auctex
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex))

;; elfeed
(use-package elfeed
  :bind ("C-x w" . elfeed))

;;; init.el ends here
