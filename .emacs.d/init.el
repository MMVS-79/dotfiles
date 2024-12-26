(tool-bar-mode 0)
(menu-bar-mode 1)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)

;; set default size of frame
(setq default-frame-alist '(
(left . 0)
(width . 0)
(fullscreen . maximized)))

;; load packages
(setq package-enable-at-startup nil) (package-initialize)
;; load theme
(load-theme 'gruber-darker  t)

;;disable splash / welcome buffer
(setq inhibit-startup-screen t)

