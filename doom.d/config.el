;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Joshua Aresty"
      user-mail-address "jaresty@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(custom-set-faces!
  `(italic :family "Victor Mono")
  `(bold-italic :family "Victor Mono" :weight bold))
(setq doom-font (font-spec :family "Monaspace Xenon" :size 16))
;; doom-variable-pitch-font (font-spec :family "Luansevka Nerd Font Mono" :size 16))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-Iosvkem)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq mouse-autoselect-window nil)
(after! vterm
  (setq vterm-shell "/opt/homebrew/bin/fish")
  )

(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "arc-cli" browse-url-generic-args '("new-little-arc"))
;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(map!
 :leader
 (:prefix ("l" . "LLM")
  :desc "dall-e" "d" #'dall-e-shell
  :desc "chatgpt" "c" #'chatgpt-shell
  :desc "gpsend" "l" #'gptel-send)
 :desc "gptel" "L" #'gptel
 :desc "Magit Trace Definition" "gi" #'magit-log-trace-definition
 :desc "Select Recent Search" "\"" #'vertico-repeat-select
 :desc "Kill buffer and window" "wD" #'kill-buffer-and-window)
(after! org
  (setq org-directory "~/org/")
  (setq org-agenda-files '("~/gtd/inbox.org"
                           "~/gtd/gtd.org"
                           "~/gtd/tickler.org"))
  (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                 (file+headline "~/gtd/inbox.org" "Tasks")
                                 "* TODO %i%?")
                                ("T" "Tickler" entry
                                 (file+headline "~/gtd/tickler.org" "Tickler")
                                 "* %i%? \n %U")))
  (setq org-refile-targets '(("~/gtd/gtd.org" :maxlevel . 3)
                             ("~/gtd/someday.org" :level . 1)
                             ("~/gtd/tickler.org" :maxlevel . 2)))
  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((d2 . t)))
  )
(setq fancy-splash-image (concat doom-private-dir "splash.png"))
(after! evil-vars
  (setq evil-shift-width 2)
  )

(use-package! gptel
  :config
  (setq-default gptel-default-mode 'org-mode
                gptel-model "gpt-4"))
(use-package! chatgpt-shell
  :config
  (setq chatgpt-shell-openai-key
        (lambda ()
          (auth-source-pick-first-password :host "api.openai.com"))
        chatgpt-shell-model-version 4))

(use-package! dall-e-shell
  :config
  (setq dall-e-shell-openai-key
        (lambda ()
          (auth-source-pick-first-password :host "api.openai.com"))))
(global-subword-mode)

(after! evil
  (evil-define-key 'normal 'global (kbd "M-.") '+lookup/definition)
  (evil-define-key '(insert normal) 'global (kbd "M-/") 'complete-symbol)
  (evil-define-key 'normal 'global (kbd "g s i") 'avy-goto-symbol-1)
  )
(use-package! ox-slack
  :after org)
(after! ox-slack
  (add-to-list 'org-export-backends 'slack)
  )


(use-package code-compass
  :load-path "~/.emacs.d/lisp")

(setq tab-width 2)
(after! indent
  (setq standard-indent 2)
  )
(after! typescript-mode
  (setq typescript-indent-level 2)
  (setq-hook! 'typescript-mode-hook +format-with 'prettier)
  (add-hook! typescript-tsx-mode 'jest-minor-mode)
  (add-hook! typescript-mode 'jest-minor-mode)
  )

(after! sql
  (setq sql-mysql-login-params '(user password server database port))
  )

(after! dap-mode
  (dap-register-debug-template "Node: Attach"
                               (list :type "node"
                                     :cwd nil
                                     :request "attach"
                                     :program nil
                                     :port 9229
                                     :name "Node::Run")))

(after! lsp-ui
  (setq lsp-ui-doc-show-with-mouse t)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-sideline-show-hover t)
  ;; (setq lsp-ui-doc-show-with-cursor t)
  ;; (setq lsp-ui-doc-position 'top)
  )
(after! lsp-mode
  (advice-add 'json-parse-string :around
              (lambda (orig string &rest rest)
                (apply orig (s-replace "\\u0000" "" string)
                       rest)))
  (advice-add 'json-parse-buffer :around
              (lambda (orig &rest rest)
                (while (re-search-forward "\\u0000" nil t)
                  (replace-match ""))
                (apply orig rest))))
(add-to-list 'auto-mode-alist '("\\.d2\\'" . d2-mode))
(add-to-list 'auto-mode-alist '("\\.prisma\\'" . prisma-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . web-mode))
(add-to-list 'lsp-language-id-configuration '("\\.inc$" . "php"))
(after! flycheck
  (setq next-error-find-buffer-function 'next-error-buffer-unnavigated-current)
  )

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
