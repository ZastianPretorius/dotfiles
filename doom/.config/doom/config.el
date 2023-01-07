;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zastian Pretorius"
      user-mail-address "Zastian00@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

(set-fontset-font "fontset-default" nil (font-spec :size 17 :name "Meterial Icons"))

(setq doom-font (font-spec :family "Illusion Z" :size 17)
      doom-variable-pitch-font (font-spec :family "Illusion Z" :size 17)
      doom-big-font (font-spec :family "Illusion Z" :size 24))

(require 'whitespace)
(setq whitespace-line-column 99)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

(require 'fill-column-indicator)
(setq fci-rule-column 99)
(setq fci-rule-width 1)
(setq fci-rule-color "#a280d5")
(add-hook 'prog-mode-hook 'fci-mode)

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.4))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)



(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "The UwU Editor")))

(defun my-weebery-is-always-greater ()
  (let* ((banner '("⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⢀⣾⡿⠋⠉⠁⢠⣿⠏⢁⣿⣿⣿⠏⠉⢸⣿⡏⠉⢻⣿⣿⡇⠈⠙⢿⣿⣿⣿⣷⡆⠀⠀⢇⠢⣈⡒⡤"
"⣿⣿⣿⣿⣿⣏⣴⡇⠀⠀⠀⢠⡿⠋⠀⠀⠀⣰⣿⠋⠀⣼⣿⣿⠏⠀⠀⡾⣿⠁⠀⠀⣿⣿⣷⠀⠀⠀⠹⣿⣿⣿⣿⣄⢀⣿⣷⣿⣶⣶"
"⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⢠⡟⠁⠀⠀⠀⢰⣿⠇⠀⢰⣿⣿⡷⠀⣀⣜⣁⣻⣀⣀⣀⣸⢻⣿⡇⠀⠀⠀⠘⣿⣿⣷⠹⣿⣿⣿⣿⣿⣿"
"⣿⣿⣿⣿⣿⣿⠃⠀⠀⣠⣿⠀⠀⠀⠀⢠⣿⡏⠀⢀⣿⣿⡿⠛⣩⣿⠿⠛⢻⡏⠉⠉⢹⠉⢿⣿⡀⠀⠀⠀⠹⣿⣿⡆⠙⣿⣿⣿⣿⣿"
"⣿⣿⣿⣿⣿⡏⠀⠀⣰⣿⡟⠀⠀⠀⢀⣾⣿⠀⠀⣸⣿⡿⢥⣶⠝⠁⠀⠀⠀⡇⠀⠀⡜⠰⡀⢻⡇⠀⠀⠀⠀⢿⣿⣿⠀⠸⣿⣿⣿⡿"
"⣿⣿⢿⣿⣿⡃⠀⣼⣿⣿⡇⣀⣀⣤⣾⣿⡇⠀⠰⣼⡟⣠⠎⠁⠀⢀⣠⠔⠁⢹⣀⣠⣧⣶⣦⣤⣷⣤⣤⣠⣤⠼⣿⣿⡆⠀⢹⣿⣿⣿"
"⣿⣿⣿⣿⣿⠀⣼⣿⣿⣿⣏⣁⣼⣿⣿⣿⠀⢠⣾⣟⡔⠁⠀⠀⠀⢸⠁⠀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⣿⣿⣇⠀⠀⣿⣿⣿"
"⣿⣿⣿⣿⣿⣸⣿⣿⣿⣿⣟⣹⣿⣿⣿⡿⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⢰⣾⢟⣻⡿⠛⢻⢋⣻⣏⣱⠞⠙⣄⡀⠀⣿⡽⣿⠀⠀⢸⣿⣿"
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠉⢘⡅⠚⠋⠉⠁⠀⠀⠀⠀⣔⣾⢏⢦⢄⣿⣧⣿⡆⠀⠈⣿⣿"
"⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⡿⢻⣿⣿⡿⠋⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠟⠉⠀⢂⢻⣿⣿⣿⡇⠀⠀⢽⣿"
"⣿⣿⣿⣿⣿⢃⣿⣿⣿⣿⣷⣿⣿⣿⣿⡷⠀⠀⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠉⠀⢀⣠⣾⣟⡖⢻⣿⣿⠃⠀⠀⣿⣿"
"⣿⣿⣿⣿⣟⣼⣿⣿⣿⣿⣿⣿⠟⣻⠿⠓⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠾⠿⠛⠉⠁⢰⢸⣿⡿⠀⠀⠀⣿⣿"
"⣿⣿⣿⣿⣿⣿⣿⠋⠰⢟⣿⠌⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠇⠀⠀⢠⡇⣿"
"⣿⣿⣿⣿⣿⣿⣏⠓⠓⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⢾⣿⡟⠀⠀⠀⣼⠃⣿"
"⣿⣿⣿⣿⣿⣿⣿⣷⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠤⠤⠤⠤⠤⠄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡿⠀⠀⠀⣰⠏⢰⣿"
"⣿⣿⣿⣿⣿⣿⣿⣿⡀⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⣠⢚⣡⣴⣾⣿⣿⣿⣿⡿⠿⢿⠀⠀⠀⠀⠀⠀⠀⠀⣼⡿⠁⠀⠀⣰⠏⣠⣿⣿"
"⣿⣿⣿⣿⣿⣿⣿⣿⣧⣤⣴⡾⠋⠀⠀⠀⠀⠀⠀⠀⣃⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⡸⠀⠀⠀⠀⠀⠀⠀⣼⣿⣃⠤⠚⠚⠉⠉⠉⠙⠛"
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠉⠀⢀⡄⠀⠀⠀⠀⠀⠀⠙⢽⣿⠿⠋⠉⠁⠀⢠⡆⢰⠃⠀⠀⠀⠀⠀⠀⣼⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣴⡿⠁⠀⠀⠀⠀⠀⠀⠀⠈⢯⠀⠀⠀⠀⢀⡞⢠⠋⠀⠀⠀⠀⠀⢀⣾⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡄⠀⠀⠀⣸⢠⠃⠀⠀⠀⠀⠀⢠⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⡆⢠⠉⢿⣿⣿⡟⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠳⡀⠀⠀⡇⠇⠀⠀⠀⠀⠀⣠⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⣿⣼⠀⠈⢿⣿⡇⢹⣿⣿⣿⣿⣿⣿⣿⡗⠤⣀⠀⠀⠀⠀⠀⠑⢄⣀⡞⠀⠀⠀⠀⢀⣴⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⣿⣿⣷⠀⠀⠹⢇⠀⢻⣿⣿⣿⣿⣿⣿⣧⠀⠈⠻⣷⣦⣤⣀⡀⠀⠉⠀⠀⠀⣀⡴⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⣿⣿⠟⠀⠀⠀⠈⠳⣄⢻⣿⣿⣿⣿⣿⣿⣆⠀⠀⠈⠻⢿⣿⣿⣿⣷⣶⣴⣾⣿⣿⣿⣿⡿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⣿⣿⣄⠀⠀⠀⠀⠀⠈⠳⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠉⡿⢿⣿⣿⣿⣿⣿⣿⣿⡿⢱⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)

(setq ess-r--no-company-meta t)

(set-frame-parameter nil 'alpha-background 90) ; For current frame
(add-to-list 'default-frame-alist '(alpha-background . 90)) ; For all new frames henceforth


(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (julia . t)
   (python . t)
   (jupyter . t)))

;; accept completion from copilot and fallback to company
(defun my-tab ()
  (interactive)
  (or (copilot-accept-completion)
      (company-indent-or-complete-common nil)))


(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map company-active-map
         ("<tab>" . 'my-tab)
         ("TAB" . 'my-tab)
         :map company-mode-map
         ("<tab>" . 'my-tab)
         ("TAB" . 'my-tab)))

;; asm stuff
(use-package! nasm-mode
  :mode "\\.[n]*\\(asm\\|s\\)\\'")

;; Get Haxor VM from https://github.com/krzysztof-magosa/haxor
(use-package! haxor-mode
  :mode "\\.hax\\'")

(use-package! mips-mode
  :mode "\\.mips\\'")

(use-package! riscv-mode
  :mode "\\.riscv\\'")

(use-package x86-lookup
  :ensure t
  :config
  (setq  x86-lookup-pdf "~/.config/doom/asm-ref.pdf"))


;; chatgpt stuff
;;(use-package! chatgpt
;;  :defer t
;;  :config
;;  (unless (boundp 'python-interpreter)
;;    (defvaralias 'python-interpreter 'python-shell-interpreter))
;;  (setq chatgpt-repo-path (expand-file-name "straight/repos/ChatGPT.el/" doom-local-dir))
;;  (set-popup-rule! (regexp-quote "*ChatGPT*")
;;    :side 'bottom :size .5 :ttl nil :quit t :modeline nil)
;;  :bind ("C-c q" . chatgpt-query))


(load! "lisp/chatgpt.el")




;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
