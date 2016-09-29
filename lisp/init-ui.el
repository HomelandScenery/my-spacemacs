 ;;;设置行距
(setq-default line-spacing 12)
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

(provide 'init-ui)
