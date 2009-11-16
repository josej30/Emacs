;;; Word to Emacs
;;; Author: Nicolas Lara <nicolas@ac.labf.usb.ve>
;;; Created: 21-03-2005
;;; NO MORE EXCUSES FOR USING WORD INSTEAD OF EMACS
;;; 
;;; To-Do: OpenOfficeWriter (.sxw) to Emacs

(defun getName()
  (setq name (substring (buffer-name) 0 (string-match "\\.doc" (buffer-name)) ))
  )

(defun convert()
  (let (getName)
    (and
     (shell-command (concat "antiword " (concat (getName) ".doc"))
		    )
     )
    )
  )

(defun word-to-emacs()
  (convert)
  (kill-buffer (concat (getName) ".doc")
	       )
  (delete-window)
  )

(provide 'word-to-emacs)
