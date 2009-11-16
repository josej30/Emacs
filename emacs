;;
;; Archivo de configuracion de Emacs
;; 02-Marzo-2005
;; Nicolas Lara
;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(browse-url-netscape-program "/usr/bin/firefox")
 '(case-fold-search t)
 '(current-language-environment "Spanish")
 '(ecb-directories-menu-user-extension-function nil)
 '(ecb-history-menu-user-extension-function nil)
 '(ecb-methods-menu-user-extension-function nil)
 '(ecb-options-version "2.24")
 '(ecb-sources-menu-user-extension-function nil)
 '(global-font-lock-mode t nil (font-lock))
 '(ispell-program-name "ispell" t)
 '(show-paren-mode t nil (paren)))
 
;;
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;; dvi viewer (para laTeX)
(set-default 'tex-dvi-view-command "xdvi")
;;
; en caso de volver a querer usear los colores sencillos
;(set-background-color "DarkSlateGrey")
;(set-foreground-color "beige")
;;
;;(load "/usr/share/emacs/site-lisp/site-gentoo.el")
;;
;; carga el GCL-mode
(autoload 'gcl-mode "gcl-mode")
(setq load-path (append '("~/elisp") load-path))
(setq auto-mode-alist (append '(("\\.gcl\\'" . gcl-mode)) auto-mode-alist))
;;
;; Carga el color-theme segun si estas usando emacs en X o en consola
(require 'color-theme)
(cond ((eq window-system nil)  (color-theme-pok-wob))
  (t (color-theme-charcoal-black))
)
;;
;; numero de linea
(line-number-mode 1) 
;;
;; numero de columna
(column-number-mode 1) 
;;
;; carga mouse wheel
(mwheel-install)  
;;
;; highlightea la seleccion
(delete-selection-mode 1) 
;;
;; te dice la funcion donde estas (funciona para C, no se si para otro lenguaje)
(which-func-mode 1)  
;;
;; auto completa
(icomplete-mode 1) 
;;
;; agregar movilidad entre buffers (SHIFT-arrow)
(windmove-default-keybindings)
;;
;; parentesis highlight
(show-paren-mode 1) 
;;
;; Auto-save mas seguido
(setq auto-save-default t)    ; Yes auto save good
(setq auto-save-interval 20)  ; Number of input chars between auto-saves
(setq auto-save-timeout 300)  ; Number of seconds idle time before auto-save
;;
;; Elimina el toolbar
(tool-bar-mode 0) 
;;
;; Setea la tecla F5 como "ir a linea"
(global-set-key [f5] 'goto-line)
;;
;; Setea la tecla F12 como "new frame on Display"
(global-set-key [f12] 'make-frame-on-display)
;;
;;;; Turn off bugging yes-or-no-p
(fset 'yes-or-no-p 'y-or-n-p)
;;
;; Hace que mouse deje de fastidiar en el codigo. (aunq si vas a usar el mouse esta opcion fastidia en el mouse)
;;(mouse-avoidance-mode "animate")
;;
;; Guarda los backups de emacs en otro directorio para no dejar basura por todo el filesystem
;; (Nota: falta hacer lo mismo con los otros archivos bizarros tipo #archivo#)
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs_backups"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
;;
;; configure css-mode
(autoload 'css-mode "css-mode")
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
;;
;; Word to Emacs 
;; Abre un Documento de Word como texto plano :P
;; (Requiere antiword)
(autoload 'word-to-emacs "word-to-emacs")
(add-to-list 'auto-mode-alist '("\\.doc\\'" . word-to-emacs))
;;
;; configure screenplay-mode
(autoload 'css-mode "screenplay-mode")
(add-to-list 'auto-mode-alist '("\\.scr\\'" . screenplay-mode))

;;
;; preview-latex
(add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
(autoload 'LaTeX-preview-setup "preview")

