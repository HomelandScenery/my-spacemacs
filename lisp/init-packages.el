;;;;;;;;;;;;;;; Chinese fonts setup
(require 'chinese-fonts-setup)
;; 字体大小不同时仍然能保持全屏
;; 让 chinese-fonts-setup 随着 emacs 自动生效。
(chinese-fonts-setup-enable)
;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
;; (cfs-set-spacemacs-fallback-fonts)
(setq cfs-keep-frame-size nil)
;; 选择不同的字体配置
(setq cfs-profiles
      '("program" "org-mode" "kaiti" "read-book"
        ))
;; For Windows 鼠标滚动字体变大小，需要配合Chinese font set
(global-set-key (kbd "<C-wheel-up>") 'cfs-increase-fontsize)
(global-set-key (kbd "<C-wheel-down>") 'cfs-decrease-fontsize)

;; Charset 设置
(use-package mule
  :ensure nil
  :config
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8-unix)
  (prefer-coding-system 'utf-8-unix)
  (set-input-method 'chinese-wubi)
  (when (eq system-type 'windows-nt)
    (setq file-name-coding-system 'gbk))
  ;;  (set-language-environment "UTF-8")
  ;; (set-buffer-file-coding-system 'utf-8-unix)
  ;; (set-clipboard-coding-system 'utf-8-unix)
  ;; (set-file-name-coding-system 'utf-8-unix)
  ;; (set-keyboard-coding-system 'utf-8-unix)
  ;; (set-next-selection-coding-system 'utf-8-unix)
  ;; (set-selection-coding-system 'utf-8-unix)
  ;; (set-terminal-coding-system 'utf-8-unix)

  ;; (when (eq system-type 'windows-nt)
  ;;   (setq file-name-coding-system 'gbk)
  ;;   (set-selection-coding-system 'gbk-dos)
  ;;   (set-next-selection-coding-system 'gbk-dos)
  ;; (set-clipboard-coding-system 'gbk-dos))
  )
;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;更改默认"SPC SPC" 'evil-avy-goto-word-or-subword-1 跳转为2字符;;
(evil-leader/set-key "SPC" 'avy-goto-char-2)
;;使用下面的配置文件将删除功能配置成与其他图形界面的编辑器相同，即当你选中一段文字之后输入一个字符会替换掉你选中部分的文字。
(delete-selection-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;
;; 主动加载 Dired Mode 
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;;;;;;;;;;;;;;;;;;;;;;;;
;;自定义复制，避免与Ditto软件冲突
(global-set-key (kbd "C-v") 'yank)
;;;;;;;;;;;;;;;;;;;;;;;;
;; 将默认翻页"C-v"更改为"C-S-v"
(global-set-key (kbd "C-S-v") 'scroll-up)
;;;;;;;;;;;;;;;;;;;;;;;;
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
(diminish 'centered-window-mode)
;; (diminish 'ivy-mode "I")
(diminish 'server-buffer-clients "SerV")
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;Company插件翻页更改
(global-company-mode 1)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  )

;; (require 'chinese-pyim-company)
;; (setq pyim-company-max-length 10)
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
;; (global-set-key (kbd "<f9>") 'spacemacs-centered-buffer-mode)
(show-paren-mode t)
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
(tabbar-mode 1)
(mode-icons-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;
(require 'centered-window-mode)
(centered-window-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;

(require 'bind-key)
(bind-key* "<f9>" 'centered-window-mode)
;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-packages)
