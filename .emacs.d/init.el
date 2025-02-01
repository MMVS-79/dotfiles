(tool-bar-mode 0) ;; Disable toolbar
(menu-bar-mode 1) ;; enable menu
(scroll-bar-mode 0) ;; Disable scrollbars
(setq use-dialog-box nil) ;; No pop-up dialogs

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
(load-theme 'dracula  t)

;; disable splash / welcome buffer
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil) ;; No message in scratch buffer

;; delete trailing whitespace when I save files
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; disable backup files
(setq make-backup-files nil)

;; Prompt to delete autosaves when killing buffers.
(setf kill-buffer-delete-auto-save-files t)

;; dont create lock files
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Interlocking.html#Interlocking
(setq create-lockfiles nil)

;; wrap longer lines of text so they are visible in window
(setq-default word-wrap t)

(setq gc-cons-threshold (* 50 1000 1000)) ;; Increase garbage collection threshold
(setq read-process-output-max (* 1024 1024)) ;; Speed up LSP and external processes
(setq native-comp-async-report-warnings-errors nil) ;; Disable native-comp warnings

(add-hook 'focus-out-hook (lambda () (garbage-collect)))
(setq gc-cons-threshold (* 10 1000 1000)) ;; Lower after startup

(setq-default bidi-display-reordering nil) ;; Disable bidirectional text processing
(setq redisplay-dont-pause t) ;; Prevent UI lag
(setq frame-inhibit-implied-resize t) ;; Avoid expensive resizing calculations

;; Prevents aggressive CPU usage when scrolling.
(setq scroll-step 1
      scroll-conservatively 10000
      auto-window-vscroll nil)

;; Mac’s built-in ls can cause lag when using dired
;; Stops ls from causing unnecessary CPU spikes
(setq dired-use-ls-dired nil)

;; Optimize LSP Mode (if using LSP)
;; Prevents LSP-mode from draining battery with excessive processing
(setq lsp-idle-delay 0.5) ;; Delay LSP processing to save CPU
(setq lsp-enable-symbol-highlighting nil) ;; Turn off expensive features
(setq lsp-log-io nil) ;; Stop logging to reduce disk writes

;; Limit Background Process Refreshes
;; Reduces disk and CPU activity
(setq auto-revert-interval 1) ;; Check for file changes every 1 sec (default is 0.5s)
(setq auto-revert-stop-on-user-input t) ;; Don't refresh while typing
(global-auto-revert-mode 1) ;; Keep buffers updated
