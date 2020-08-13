;; This file tries to do as little as possible before calling into a
;; literate org-mode file that actually configures my emacs.
;;
;; First thing I do here is configure use-package such that I can
;; update org-mode before loading babel.
;;
;; A lot of this comes from here: https://github.com/hrs/dotfiles/blob/master/emacs/dot-emacs.d/init.e

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("ublt" . "https://elpa.ubolonton.org/packages/") t)
(package-initialize)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; from https://github.com/quelpa/quelpa
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://github.com/quelpa/quelpa/raw/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa
 '(quelpa-use-package
   :fetcher github
   :repo "quelpa/quelpa-use-package"))
(require 'quelpa-use-package)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-compile
  :config (auto-compile-on-load-mode))

(setq load-prefer-newer t)

(use-package org
  :commands org-babel-load-file)

;; load real config
(require 'org)
(org-babel-load-file "~/.emacs.d/README.org")

;;; V.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes '(Greymatters-dark))
 '(custom-safe-themes
   '("160b7ab82951531516af0e66edc43dca2c4d7713e5cf57dd3823e90e81a31421" "93826faafe9e0927b644bb39fa4c20a97feaa38f12f02b8ca966e765e5ac5e38" "4141a890d44a138e910c95de775c914aba245d3137dc6601f660d42970fb7eb5" "370554981c9358ddd09e9c0a50567f51ae1586303f2ea1226a15b934fb2d3bcd" "9b02a4fd5a0fa3d0b5d326057ecbf6e4f46186c16c6c42312b3ac29f6ee35548" "fb5a4e1730c349ca59a6955cb513e00ec6adb545db79fae0dbafc28af82c59ff" "323964cdaee8528eeff0b721974bb033c44a2b73d795a31ceba554f764109a20" "0da70fb7c272d8e87b9343a6f36d7f9eed520ef64beaab03478113968fbed1d9" "0aa971daea004737402f4cd0575cfa6dc2fa00206cd03c77ee2c3b5d3b5f19d6" "9685cefcb4efd32520b899a34925c476e7920725c8d1f660e7336f37d6d95764" "0a8b8aad17f3bd4af1839a49cd97048c90db98a088b1f6f6d0d2187a3c35321d" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "319bf1bab5d05e3a4c4a165efe69d27b3d975759034074f15fe61e92c7304884" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(display-battery-mode t)
 '(electric-pair-mode t)
 '(global-hl-line-mode t)
 '(hscroll-margin 8)
 '(hscroll-step 1)
 '(org-agenda-files
   '("/Users/ricky/notes/20200520182622-org_roam.org" "/Users/ricky/notes/20200520190206-org_mode.org" "/Users/ricky/notes/20200521120244-roam.org" "/Users/ricky/notes/20200521162530-dotfiles.org" "/Users/ricky/notes/20200524111223-marketing.org" "/Users/ricky/notes/20200524145601-voxbox.org" "/Users/ricky/notes/20200524151408-github_com_pion_webrtc.org" "/Users/ricky/notes/20200524161045-distributed_systems.org" "/Users/ricky/notes/20200524183413-engineering_success.org" "/Users/ricky/notes/20200526142341-computer_setup.org" "/Users/ricky/notes/20200526142520-zsh.org" "/Users/ricky/notes/20200526192638-emacs.org" "/Users/ricky/notes/20200527113921-mysql.org" "/Users/ricky/notes/20200527123204-object_storage.org" "/Users/ricky/notes/20200528112512-minio.org" "/Users/ricky/notes/20200528120600-ghes.org" "/Users/ricky/notes/20200528190438-chrome_el.org" "/Users/ricky/notes/20200602122131-anti_racism.org" "/Users/ricky/notes/20200604210440-quotes.org" "/Users/ricky/notes/20200606145854-prom2collectd.org" "/Users/ricky/notes/20200608100500-reviews.org" "/Users/ricky/notes/20200610164517-golang.org" "/Users/ricky/notes/20200716142439-hugo.org" "/Users/ricky/notes/README.org" "/Users/ricky/notes/articles.org" "/Users/ricky/notes/books.org" "/Users/ricky/notes/emacs-config.org" "/Users/ricky/notes/essays.org" "/Users/ricky/notes/github.org" "/Users/ricky/notes/gito.org" "/Users/ricky/notes/inbox.org" "/Users/ricky/notes/me.org" "/Users/ricky/notes/projects.org" "/Users/ricky/notes/quotes.org" "/Users/ricky/notes/resume.org" "/Users/ricky/notes/rules.org" "/Users/ricky/notes/supplements.org" "/Users/ricky/notes/vocab.org"))
 '(org-roam-server-mode t)
 '(package-selected-packages
   '(org-roam-bibtex org-ref ox-pandoc org-reverse-datetree ox-hugo org-variable-pitch org-pomodoro org-beautify-theme pullover atomic-chrome edit-server golint gotest go-test go-rename use-package))
 '(perfect-margin-mode nil)
 '(tramp-syntax 'simplified nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
