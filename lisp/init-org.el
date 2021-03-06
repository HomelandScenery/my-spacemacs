 ;;;;;;;org mode settings;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)
(setq org-directory "~/git/org")
(setq org-default-notes-file "~/git/org/refile.org")
;;;;;;;;org mode settings;;;;;;;;;;;;;;;;
(defadvice org-agenda (around split-vertically activate)
  (let ((split-width-threshold 60))  ; or whatever width makes sense for you
    ad-do-it))

;; set agenda files
(setq org-src-fontify-natively t)
;; (setq org-agenda-files (file-expand-wildcards "~/.emacs.d/private/org/*.org"))
(with-eval-after-load 'org
  ;; Org 模式相关设定

  ;; 设置默认 Org Agenda 文件目录
  (setq org-agenda-files (quote ("~/git/org"
                                 ;; "~/git/org/client1"
                                 ;; "~/git/client2"
                                 )))
  ;;Org-mode 来做学习笔记和安排工作时间

  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/git/org/gtd.org" "工作安排")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("c" "开庭" entry (file+headline "~/git/org/gtd.org" "开庭")
           "* TODO [#B] %^法院第%^庭\n 法官：%^，书记员：%^，电话：%^\n  %i\n"
           :empty-lines 1)
          ("r" "回复" entry (file "~/git/org/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/git/org/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/git/org/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/git/org/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/git/org/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/git/org/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
          ))
  )

(global-set-key (kbd "C-c C-r") 'org-capture)

  ;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-bullets-bullet-list '("●" "◎" "□" "★"))

  ;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'org-mode-hook
          (lambda ()
            (setq truncate-lines nil)
            (visual-line-mode 1) ; 1 for on, 0 for off.
            (toggle-word-wrap -1)
            (local-set-key(kbd "<C-S-return>") 'org-insert-subheading);;添加子标题的快捷键
            ))
;;添加文本文件语法高亮
(setq org-src-fontify-natively t)

;;;;;;;;;Org todo keywords关键词;;;;;;;;;;;;;;;
;; logging settings;;

(setq org-log-done (quote time))
(setq org-log-into-drawer t)
(setq org-log-state-notes-insert-after-drawers nil)
(setq org-log-reschedule (quote time))
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n/!)" "|" "DONE(d@)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "#00d8d8" :weight bold) ;:foreground "blue" 
              ("DONE" :foreground "#80bf80" :weight bold) ;:foreground "forest green" 
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))
  ;;;;;;;;Fast Todo Selection;;;;;;;;;;;;;;;;
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)
  ;;;;;;;;TODO state triggers;;;;;;;;;;;;;;;;
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))
  ;;;;;;;;;;;;;;;;;;;;;;;;
;; 设定每插入或删除一个注脚后,自动重编码和排序文档中的所有注脚.
(setq org-footnote-auto-adjust t)
;;From BH org-mode settings;;;;;;;;;;;;;;;;;;;;;;
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;;;;;;;;;;;;;;;;;;;;;;;;
;;加密org文件;;;;;;;;;;;;;;;;;;;;;;
(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key nil)
;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.
(setq auto-save-default nil)
;; Auto-saving does not cooperate with org-crypt.el: so you need
;; to turn it off if you plan to use org-crypt.el quite often.
;; Otherwise, you'll get an (annoying) message each time you
;; start Org.
(setq org-crypt-tag-matcher "加密")
;; To turn it off only locally, you can insert this:
;;
;; # -*- buffer-auto-save-file-name: nil; -*-
  ;;;;;;;;;;;;;;;;;;;;;;;;
;;Ordered tasks;;有顺序的任务设置
(setq org-enforce-todo-dependencies t)
(setq org-track-ordered-property-with-tag t)
(setq org-agenda-dim-blocked-tasks nil);;('invisible);;在Agenda视图中，隐藏任务
;; (setq org-enforce-todo-checkbox-dependencies t)
;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'init-org)
