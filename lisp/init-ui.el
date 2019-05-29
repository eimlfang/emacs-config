;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭滚动条
(scroll-bar-mode -1)
;; 关闭启动页面
(setq inhibit-splash-screen t)
;; 设置光标样式
(setq-default cursor-type 'bar)
;; 默认开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; 显示当前行
(global-hl-line-mode t)

(provide 'init-ui)
