 ;;;;;;;org mode settings;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)

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
  
  
  (setq org-agenda-files '("~/.emacs.d/private/org"))
  ;;Org-mode 来做学习笔记和安排工作时间

  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/.emacs.d/private/org/gtd.org" "工作安排")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)))
  
  )

(global-set-key (kbd "C-c C-r") 'org-capture)

  ;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-bullets-bullet-list '("●" "◎" "□" "★"))

  ;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)))

                                        ;添加文本文件语法高亮

  ;;;;;;;;;Org todo keywords关键词;;;;;;;;;;;;;;;
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
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
  ;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'init-org)
