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



(provide 'init-org)
