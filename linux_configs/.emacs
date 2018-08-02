(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url "http://melpa.org/packages/"))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(custom-set-variables
 '(custom-enabled-themes (quote (gruvbox-dark-medium)))
 '(custom-safe-themes
   (quote
    ("a5956ec25b719bf325e847864e16578c61d8af3e8a3d95f60f9040d02497e408" "ee89863f86247942d9fc404d47b2704475b146c079c1dcd2390d697ddfa9bdf4" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" default)))
 '(package-selected-packages
   (quote
    (neotree php+-mode php-mode ample-theme ensime scala-mode))))

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "#282828" :foreground "#fdf4c1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Source Code Pro"))))
 '(bold ((t (:weight bold)))))

; Configure code styles
(setq c-default-style "stroustrup")

; Configure tabs
(setq tab-width 4)
(setq indent-tabs-mode t)
