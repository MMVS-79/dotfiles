(tool-bar-mode 0) ;; Disable toolbar
(menu-bar-mode 1) ;; enable menu
(scroll-bar-mode 0) ;; Disable scrollbars
(setq use-dialog-box nil) ;; No pop-up dialogs

(global-display-line-numbers-mode)
;; Display (an absolute) line number before each non-continuation screen line that displays buffer text.
;; If the line is a continuation line, or if the entire screen line displays a display or an overlay string, that line will not be numbered.
(setq display-line-numbers-type 't)

;; set default size of frame
(setq default-frame-alist '(
(left . 0)
(width . 0)
(fullscreen . maximized)))

;; Font
(add-to-list 'default-frame-alist '(font . "Iosevka-16"))

;; tabs
(global-tab-line-mode 1)
(custom-set-faces
 '(tab-line ((t (:inherit mode-line :background "#181818" :foreground "#757575" :height 0.9))))
 '(tab-line-tab ((t (:inherit tab-line :background "#252525" :foreground "#b8b8b8"
                              :box (:line-width 1 :color "#252525")))))
 '(tab-line-tab-current ((t (:inherit tab-line-tab :background "#3a3a3a" :foreground "#e4e4ef"
                                      :box (:line-width 1 :color "#3a3a3a")))))
 '(tab-line-tab-inactive ((t (:inherit tab-line-tab :background "#181818" :foreground "#505050")))))


;; load packages
(setq package-enable-at-startup nil) (package-initialize)
;; load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/manual_cloned_packs/gruber-darker")
(add-to-list 'custom-theme-load-path "~/.emacs.d/manual_cloned_packs/everforest")
(add-to-list 'custom-theme-load-path "~/.emacs.d/manual_cloned_packs/vs-code-dark-plus")
(load-theme 'vscode-dark-plus t)

;; disable splash / welcome buffer
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil) ;; No message in scratch buffer
;; Automatically open buffer list on startup
(add-hook 'emacs-startup-hook (lambda ()
                                (call-interactively 'buffer-menu)))

;; delete trailing whitespace when I save files
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; smart indent
(setq-default indent-line-function 'indent-relative)

;; back tab / reverse indent
(global-set-key (kbd "<backtab>") 'indent-rigidly-left-to-tab-stop)

;; autocomplete paired brackets
(electric-pair-mode 1)

;; Cmd + / (macOS) will toggle comments like in many modern IDEs
(global-set-key (kbd "s-/") 'comment-line)

;; Prevent Window Splitting
(setq display-buffer-alist
      '(("." (display-buffer-same-window))))

;; Block manual splits
(global-set-key (kbd "C-x 2") (lambda () (interactive) (message "Vertical split disabled.")))
(global-set-key (kbd "C-x 3") (lambda () (interactive) (message "Horizontal split disabled.")))

;; tells Emacs to open files in the existing frame rather than creating a new one when they are opened from Finder (macOS)
(setq ns-pop-up-frames nil)

;; disable backup files
(setq make-backup-files nil)

;; Prompt to delete autosaves when killing buffers.
(setf kill-buffer-delete-auto-save-files t)

;; Create the auto-saves directory if it doesn't exist
(let ((auto-save-dir (expand-file-name "~/.emacs.d/auto-saves/")))
  (unless (file-exists-p auto-save-dir)
    (make-directory auto-save-dir t)))

;; Set auto-save-file-name-transforms to store all auto-save files in one directory
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/auto-saves/\\1") t)))

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


;; add ability to move text  using opt(mac) and up or down arrows
(add-to-list 'load-path "~/.emacs.d/manual_cloned_packs/move-text")
(require 'move-text)
(move-text-default-bindings)
(defun indent-region-advice (&rest ignored)
  (let ((deactivate deactivate-mark))
    (if (region-active-p)
        (indent-region (region-beginning) (region-end))
      (indent-region (line-beginning-position) (line-end-position)))
    (setq deactivate-mark deactivate)))
(advice-add 'move-text-up :after 'indent-region-advice)
(advice-add 'move-text-down :after 'indent-region-advice)

;; vterm TODO - > convert all load paths to use user-emacs-directory as it will make the config more agnostic
(add-to-list 'load-path (expand-file-name "manual_cloned_packs/vterm" user-emacs-directory))
(require 'vterm)
(setq vterm-shell "/bin/zsh --login")
(add-hook 'vterm-mode-hook (lambda() (display-line-numbers-mode -1)))

;; YAML mode conf
(require 'yaml-mode)
(setq auto-mode-alist
      (append '(("\\.yml\\'" . yaml-mode)
                ("\\.yaml\\'" . yaml-mode))
              auto-mode-alist))

;; GDscript mode conf
(add-to-list 'load-path "~/.emacs.d/manual_cloned_packs/gdscript-mode")
(require 'gdscript-mode)

;; Rust mode conf
(require 'rust-mode)

;; simp c mode conf
(add-to-list 'load-path "~/.emacs.d/manual_cloned_packs/simpc-mode")
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
