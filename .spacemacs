;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
        better-defaults
     emacs-lisp
     git
     markdown
     html
     ;;chinese
      org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
      ;;spell-checking
      syntax-checking
     version-control
      (chinese :variables
               chinese-default-input-method 'wubi
               chinese-enable-youdao-dict t))
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(chinese-fonts-setup
                                      chinese-pyim
                                      swiper
                                      multiple-cursors 
                                      expand-region
                                      visual-regexp
                                      ;; visual-regexp-steroids
                                      beacon
                                      cal-china-x
                                      tabbar
                                      )
   
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))
 
(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
   						leuven
   						spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                          monokai
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.8)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil 
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq configuration-layer--elpa-archives
    '(("melpa-cn" . "http://elpa.zilongshanren.com/melpa/")
      ("org-cn"   . "http://elpa.zilongshanren.com/org/")
      ("gnu-cn"   . "http://elpa.zilongshanren.com/gnu/")))
      )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;;;;;;;;;;;;;;; Chinese fonts setup
  (require 'chinese-fonts-setup)
  ;; 字体大小不同时仍然能保持全屏
  (setq cfs-keep-frame-size nil)
  ;; 选择不同的字体配置
  (setq cfs-profiles
        '("program" "org-mode" "kaiti" "read-book"
          ))
  ;; For Windows 鼠标滚动字体变大小，需要配合Chinese font set
  (global-set-key (kbd "<C-wheel-up>") 'cfs-increase-fontsize)
  (global-set-key (kbd "<C-wheel-down>") 'cfs-decrease-fontsize)
  ;;;设置行距
  (setq-default line-spacing 12)
;;;;;;;
;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)

  (setq file-name-coding-system 'gbk)
  ;;;;;;;;;;;;;;;;;;;;;;;;
  (setq custom-file (expand-file-name "~/.emacs.d/lisp/Custom.el" dotspacemacs-directory))
  (load custom-file 'no-error 'no-message)


  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;
  (setq powerline-default-separator 'arrow)
  (spaceline-compile)
  ;;修改当前选区的颜色
  ;;可以定义当选中后文字的前景色
  (set-face-attribute 'region nil :background "#4e674e") 
  ;; :foreground "#ffffff") 

  ;; 更改光标的样式
  (setq evil-emacs-state-cursor '("#82c382" (bar . 2)))
   (setq-default evil-escape-key-sequence "jj") 
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;
  (server-start)
  ;;;更改默认"SPC SPC" 'evil-avy-goto-word-or-subword-1 跳转为2字符;;
  (evil-leader/set-key "SPC" 'avy-goto-char-2)
;;;;;;;;;;;;;;;;;;;;;;;
    (global-pangu-spacing-mode 0)
  ;;使用下面的配置文件将删除功能配置成与其他图形界面的编辑器相同，即当你选中一段文字之后输入一个字符会替换掉你选中部分的文字。
  (delete-selection-mode t)
  ;; 主动加载 Dired Mode 
  ;; (require 'dired)
  ;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  ;;自定义复制，避免与Ditto软件冲突
  (global-set-key (kbd "C-v") 'yank)
  ;; 将默认翻页"C-v"更改为"C-S-v"
  (global-set-key (kbd "C-S-v") 'scroll-up)
  
  ;;evil模式下同样能使用ditto复制
  (define-key evil-insert-state-map (kbd "C-v") 'evil-paste-after)
  (define-key evil-normal-state-map (kbd "C-v") 'evil-paste-after) 
  ;;;;;;;;;;;;;;;;;;;;;;;;  

  (require 'expand-region)
  (global-set-key (kbd "C-=") 'er/expand-region)

;;;;;;;;;;;;;;;;;;;;;;;;
  (require 'multiple-cursors)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;;;;;;;;;;;;;;;;;
  (require 'visual-regexp)
  (define-key global-map (kbd "C-c r") 'vr/replace)
  (define-key global-map (kbd "C-c q") 'vr/query-replace)
  ;; if you use multiple-cursors, this is for you:
  (define-key global-map (kbd "C-c m") 'vr/mc-mark)
  ;;;;;;;;;;;;;;;;;;;;;;;;  
 
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;; (ivy-mode 1)
  ;; (setq ivy-use-virtual-buffers t)
  ;; (global-set-key (kbd "C-s") 'swiper)
  ;;http://oremacs.com/swiper/
  ;;(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;  (global-set-key (kbd "<f6>") 'ivy-resume)
  ;;;;;;;;;;;;;;;;;;;;;;;;
(global-hungry-delete-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;
(beacon-mode 1)
(setq beacon-push-mark 35)
(setq beacon-color "#82c382")
;;;;;;;;;;;;;;;;;;;;;;;;
;; 不要显示minor mode
;; Diminished modes are minor modes with no modeline display
(require 'diminish)
;; Hide jiggle-mode lighter from mode line
;; (diminish 'jiggle-mode)
;; Replace abbrev-mode lighter with "Abv"
;; (diminish 'abbrev-mode "Abv")
(diminish 'beacon-mode)
;; (diminish 'ivy-mode "I")
(diminish 'server)
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-better-editor)
(require 'init-org)


  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;Company插件翻页更改
  ;;(global-company-mode 1)
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous)
   )
    
  (require 'chinese-pyim-company)
(setq pyim-company-max-length 10)

 ;
 ;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;
  (setq font-lock-maximum-decoration t
        font-lock-maximum-size nil)
 ;;;;;;;;;;;;;;;;;;;;;;;;
 
 ;;  config web-mode for HTML
  (add-to-list 'auto-mode-alist '("\\.\\(html\\|xhtml\\|css\\)$" . web-mode))
  (require 'web-mode)
  ;;(setq auto-mode-alist
 ;;       (append
 ;;       ;; '(("\\.js\\'" . js2-mode))
 ;;       '(("\\.html\\'" . web-mode))
 ;;        '(("\\.xhtml\\'" . web-mode))
 ;;        '(("\\.css\\'" . web-mode))
;;;;;;;;;;;;;;;;;;;;;;;;
  (global-set-key (kbd "<f9>") 'spacemacs-centered-buffer-mode)
  (global-company-mode 1)
  (show-paren-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;日历设置;;;;;;;;;;;;;;;;;;;;;;
;; 为设置中文里的 ‘celestial-stem’ (天干) 和 ‘terrestrial-branch’ (地支):
(setq chinese-calendar-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"]
      chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])
;;; 补充用法: holiday-float m w n 浮动阳历节日, m 月的第 n 个星期 w%7
(setq general-holidays '((holiday-fixed 1 1   "元旦")
                         (holiday-fixed 2 14  "情人节")
                         (holiday-fixed 4 1   "愚人节")
                         (holiday-fixed 12 25 "圣诞节")
                         (holiday-fixed 10 1  "国庆节")
                         (holiday-float 5 0 2 "母亲节")   ;5月的第二个星期天
                         (holiday-float 6 0 3 "父亲节")
                         ))
(setq local-holidays '((holiday-chinese 1 15  "元宵节 (正月十五)")
                       (holiday-chinese 5 5   "端午节 (五月初五)")
                       (holiday-chinese 9 9   "重阳节 (九月初九)")
                       (holiday-chinese 8 15  "中秋节 (八月十五)")
                       ;; 生日
                       ;; (birthday-fixed 9 28  "爸爸生日(1950)")
                       ;; (birthday-fixed 10 1  "妈妈生日(1953)")
                       ;; (holiday-chinese 5 29 "老婆生日")           ;阴历生日
                       (holiday-fixed 11 30 "老婆生日")
                       (holiday-lunar 1 1 "春节" 0)
                       ))
;; To use, add something like the following to your .emacs:
    (require 'cal-china-x)
    (setq mark-holidays-in-calendar t)
    (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
    (setq calendar-holidays cal-china-x-important-holidays)
    ;;;;;;;;;;;;;;;;;;;;;;;;

;;hydra-multiple-cursors settings;;Hydra多项选择编辑;;;;;;;;;;;;;;;;;;;;
(defhydra mc-hydra (:hint nil)
  "
     ^Up^            ^Down^        ^Other^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_l_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
[_M-p_] Unmark  [_M-n_] Unmark  [_r_] Mark by regexp
^ ^             ^ ^             [_q_] Quit
"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("r" mc/mark-all-in-region-regexp :exit t)
  ("q" nil))
(global-set-key (kbd"C-c m") 'mc-hydra/body)
(evil-leader/set-key "o m" 'mc-hydra/body)
;;hydra-multiple-cursors settings ends here;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
(electric-pair-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;

  
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfs--current-profile "program" t)
 '(cfs--profiles-steps (quote (("program" . 5))) t)
 '(package-selected-packages
   (quote
    (youdao-dictionary names chinese-word-at-point web-mode tagedit swiper slim-mode scss-mode sass-mode mmm-mode markdown-toc markdown-mode less-css-mode jade-mode helm-css-scss haml-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md find-by-pinyin-dired emmet-mode diff-hl company-web web-completion-data chinese-wbim chinese-pyim chinese-pyim-basedict ace-pinyin pinyinlib ace-jump-mode bind-key cal-china-x beacon async ivy package-build visual-regexp-steroids visual-regexp multiple-cursors wgrep smex ivy-hydra counsel-projectile counsel pangu-spacing toc-org smeargle orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets magit-gitflow htmlize helm-gitignore request helm-flyspell helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger flycheck-pos-tip flycheck evil-magit magit magit-popup git-commit with-editor company-statistics company-quickhelp pos-tip company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete chinese-fonts-setup ws-butler window-numbering volatile-highlights vi-tilde-fringe spaceline s powerline smooth-scrolling restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox hydra spinner page-break-lines open-junk-file neotree move-text macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight elisp-slime-nav define-word clean-aindent-mode buffer-move bracketed-paste auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm zenburn-theme which-key use-package spacemacs-theme quelpa popup helm-core evil bind-map avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
