(tool-bar-mode 0)
(menu-bar-mode 1)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)

;; making the line numbers relative
;; makes it faster to jump around using M-# + up or down keys
(setq display-line-numbers-type 'relative)

;; set default size of frame
(setq default-frame-alist '(
(left . 0)
(width . 0)
(fullscreen . maximized)))

;; load packages
(setq package-enable-at-startup nil) (package-initialize)
;; load theme
(load-theme 'gruber-darker  t)

;; disable splash / welcome buffer
(setq inhibit-startup-screen t)

;; delete trailing whitespace when I save files
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; disable backup files
(setq make-backup-files nil)
