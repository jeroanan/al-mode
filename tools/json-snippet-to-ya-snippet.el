(defun json-to-yas (file-name)
  (let* ((json-array-type 'list)
	 (json-key-type 'string)
	 (json (json-read-file file-name)))
    (dolist (j json)
      (let* ((snippet-tag (car j))
	     (snippet-name
	      (string-trim (nth 1 (split-string snippet-tag ":"))))
	     (output-buffer-name
	      (generate-new-buffer-name (concat "snippet-" snippet-name)))
	     (output-buffer (generate-new-buffer output-buffer-name))
	     (yasnippet-key "YASNIPPET-KEY"))
	(with-current-buffer output-buffer-name
	  (insert "# -*- mode: snippet -*-\n")
	  (insert (format "# name: %s\n" snippet-name))
	  (insert (format "# key: %s\n" yasnippet-key))
	  (insert "# --\n\n")
	  (dolist (k (cdr j))
	    (cond ((string= "body" (car k))
		   (dolist (l (cdr k))
		     (insert (format "%s\n" l))))
		  ((string= "prefix" (car k))
		   (progn
		     (search-backward yasnippet-key)
		     (replace-match (format "%s" (downcase (cdr k))) t)
		     (goto-char (point-max)))))))))))
      
(fset 'options-seperator
   (kmacro-lambda-form [?\C-s ?, return ?h ?i ?\" delete ?  ?\" escape] 0 "%d"))
