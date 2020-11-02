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
	     (output-buffer (generate-new-buffer output-buffer-name)))
	(with-current-buffer output-buffer-name
	  (insert "# -*- mode: snippet -*-\n")
	  (insert (format "# name: %s\n" snippet-name))
	  (insert "# --\n\n")
	  (dolist (k (cdr j))
	    (when (string= "body" (car k))
	      (dolist (l (cdr k))
		(insert (format "%s\n" l))))))))))
      
