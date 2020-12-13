;;; al-mode.el --- major mode for editing al files  -*- lexical-binding: t; -*-

;; Copyright (c) 2020 by Dave Wilson

;; Package: al-mode
;; Created: November 1, 2020
;; Version: 0.1
;; Package-Requires: ((emacs "27.0"))
;; Author: Dave Wilson

;; License:
;; This is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version. This is distributed in the hope that it will be
;; useful, but without any warranty; without even the implied warranty
;; of merchantability or fitness for a particular purpose. See the GNU
;; General Public License for more details. See
;; http://www.gnu.org/licenses/ for details.

;; Commentary:
;; v0.1 Just provides syntax highlighting

;; Code:

(setq-local al-font-lock-keywords
	    (let* (
		   (x-control-keywords '("ARRAY"
					 "ASSERTERROR"
					 "BEGIN"
					 "BREAK"
					 "CASE"
					 "DO"
					 "DOWNTO"
					 "ELSE"
					 "END"
					 "EVENT"
					 "EXIT"
					 "FOR"
					 "FOREACH"
					 "FUNCTION"
					 "IF"
					 "IMPLEMENTS"
					 "IN"
					 "INDATASET"
					 "INTERFACE"
					 "INTERNAL"
					 "LOCAL"
					 "OF"
					 "PROCEDURE"
					 "PROGRAM"
					 "PROTECTED"
					 "REPEAT"
					 "RUNONCLIENT"
					 "SECURITYFILTERING"
					 "SUPPRESSDISPOSE"
					 "TEMPORARY"
					 "THEN"
					 "TO"
					 "TRIGGER"
					 "UNTIL"
					 "VAR"
					 "WHILE"
					 "WITH"
					 "WITHEVENTS"))
		   
		   (x-operator-keywords '("AND"
					  "DIV"
					  "MOD"
					  "NOT"
					  "OR"
					  "XOR"))
		   (x-property-keywords '("AVERAGE"
					  "CONST"
					  "COUNT"
					  "EXIST"
					  "FIELD"
					  "FILTER"
					  "LOOKUP"
					  "MAX"
					  "MIN"
					  "ORDER"
					  "SORTING"
					  "SUM"
					  "TABLEDATA"
					  "UPPERLIMIT"
					  "WHERE"
					  "ASCENDING"
					  "DESCENDING"))
		   (x-applicationobject-keywords '("CODEUNIT"
						   "PAGE"
						   "PAGEEXTENSION"
						   "PAGECUSTOMIZATION"
						   "DOTNET"
						   "ENUM"
						   "ENUMEXTENSION"
						   "VALUE"
						   "QUERY"
						   "REPORT"
						   "TABLE"
						   "TABLEEXTENSION"
						   "XMLPORT"
						   "PROFILE"
						   "CONTROLADDIN"))
		   (x-builtintype-keywords '("Action"
					     "Array"
					     "Automation"
					     "BigInteger"
					     "BigText"
					     "Blob"
					     "Boolean"
					     "Byte"
					     "Char"
					     "ClientType"
					     "Code"
					     "Codeunit"
					     "CompletionTriggerErrorLevel"
					     "ConnectionType"
					     "Database"
					     "DataClassification"
					     "DataScope"
					     "Date"
					     "DateFormula"
					     "DateTime"
					     "Decimal"
					     "DefaultLayout"
					     "Dialog"
					     "Dictionary"
					     "DotNet"
					     "DotNetAssembly"
					     "DotNetTypeDeclaration"
					     "Duration"
					     "Enum"
					     "ErrorInfo"
					     "ErrorType"
					     "ExecutionContext"
					     "ExecutionMode"
					     "FieldClass"
					     "FieldRef"
					     "FieldType"
					     "File"
					     "FilterPageBuilder"
					     "Guid"
					     "InStream"
					     "Integer"
					     "Joker"
					     "KeyRef"
					     "List"
					     "ModuleDependencyInfo"
					     "ModuleInfo"
					     "None"
					     "Notification"
					     "NotificationScope"
					     "ObjectType"
					     "Option"
					     "OutStream"
					     "Page"
					     "PageResult"
					     "Query"
					     "Record"
					     "RecordId"
					     "RecordRef"
					     "Report"
					     "ReportFormat"
					     "SecurityFilter"
					     "SecurityFiltering"
					     "Table"
					     "TableConnectionType"
					     "TableFilter"
					     "TestAction"
					     "TestField"
					     "TestFilterField"
					     "TestPage"
					     "TestPermissions"
					     "TestRequestPage"
					     "Text"
					     "TextBuilder"
					     "TextConst"
					     "TextEncoding"
					     "Time"
					     "TransactionModel"
					     "TransactionType"
					     "Variant"
					     "Verbosity"
					     "Version"
					     "XmlPort"
					     "HttpContent"
					     "HttpHeaders"
					     "HttpClient"
					     "HttpRequestMessage"
					     "HttpResponseMessage"
					     "JsonToken"
					     "JsonValue"
					     "JsonArray"
					     "JsonObject"
					     "View"
					     "Views"
					     "XmlAttribute"
					     "XmlAttributeCollection"
					     "XmlComment"
					     "XmlCData"
					     "XmlDeclaration"
					     "XmlDocument"
					     "XmlDocumentType"
					     "XmlElement"
					     "XmlNamespaceManager"
					     "XmlNameTable"
					     "XmlNode"
					     "XmlNodeList"
					     "XmlProcessingInstruction"
					     "XmlReadOptions"
					     "XmlText"
					     "XmlWriteOptions"
					     "WebServiceActionContext"
					     "WebServiceActionResultCode"
					     "SessionSettings"))
		   (x-comparison-keywords '("<="
					    ">="
					    "<>"
					    "<"
					    ">"))
		   (x-other-keywords '("ADDFIRST"
				       "ADDLAST"
				       "ADDAFTER"
				       "ADDBEFORE"
				       "ACTION"
				       "ACTIONS"
				       "AREA"
				       "ASSEMBLY"
				       "CHARTPART"
				       "CUEGROUP"
				       "CUSTOMIZES"
				       "COLUMN"
				       "DATAITEM"
				       "DATASET"
				       "ELEMENTS"
				       "EXTENDS"
				       "FIELD"
				       "FIELDGROUP"
				       "FIELDATTRIBUTE"
				       "FIELDELEMENT"
				       "FIELDGROUPS"
				       "FIELDS"
				       "FILTER"
				       "FIXED"
				       "GRID"
				       "GROUP"
				       "MOVEAFTER"
				       "MOVEBEFORE"
				       "KEY"
				       "KEYS"
				       "LABEL"
				       "LABELS"
				       "LAYOUT"
				       "MODIFY"
				       "MOVEFIRST"
				       "MOVELAST"
				       "MOVEBEFORE"
				       "MOVEAFTER"
				       "PART"
				       "REPEATER"
				       "USERCONTROL"
				       "REQUESTPAGE"
				       "SCHEMA"
				       "SEPARATOR"
				       "SYSTEMPART"
				       "TABLEELEMENT"
				       "TEXTATTRIBUTE"
				       "TEXTELEMENT"
				       "TYPE"
				       ))
		   (x-all-keywords (append x-control-keywords
					   x-operator-keywords
					   x-property-keywords
					   x-applicationobject-keywords
					   x-builtintype-keywords
					   x-comparison-keywords
					   x-other-keywords))
		   (x-control-keywords-regexp (regexp-opt x-all-keywords 'words)))
	      `((,x-control-keywords-regexp . font-lock-keyword-face))))

(defvar al-assignments)
;; The regexp contained here are all the ways of assigning a value to a variable
(setq-local al-assignments
	    '(("[:|+|-|/|*]=" . font-lock-keyword-face)))

(defvar al-string-text)
;; Anything inside single quotes is a string
(setq-local al-string-text
	    '(("'.*'" . font-lock-string-face)))

(defvar al-single-line-comment)
;; If a line contains // then it denotes the start of a single-line comment
(setq-local al-single-line-comment
	    '((".*\\(//.*\\)" . (1 font-lock-comment-face))))

(defvar al-highlights)
;; The different types of syntax highlight we want to apply in order
;; of priority. SO for instance we want to apply al-single-line-comment before
;; all other comment types.
(setq al-highlights (append al-single-line-comment
			    al-string-text
			    al-assignments
			    al-font-lock-keywords))

(defvar al-mode-syntax-table nil "Syntax table for `al-mode'.")
;; Handle pesky multiline comments -- from
;; http://ergoemacs.org/emacs/elisp_comment_coloring.html
(setq al-mode-syntax-table
      (let ( (synTable (make-syntax-table)))
        ;; comment style “/* … */”
	;; single-line comments are currently handled above
	;; in al-single-line-comment
        (modify-syntax-entry ?\/ ". 14" synTable)
        (modify-syntax-entry ?* ". 23" synTable)
        synTable))

(defun al-get-line-content ()
  "Get the current line as a string."
  (save-excursion
    (beginning-of-line)
    (setq p1 (point))
    (end-of-line)
    (setq p2 (point)))
  (buffer-substring-no-properties p1 p2))

(defun al-goto-previous-non-blank-line ()
  "Move the point up to the first non-blank line it encounters."
  (forward-line -1)
  (let ((line-content (setq line-content (al-get-line-content))))
    (when (and (string= "" (string-trim line-content))
	       (/= (line-number-at-pos) 1))))
    (al-goto-previous-non-blank-line))

(defun al-goto-first-character-on-line ()
  "Move the point to the first non-whitespace character on the current line."
  (beginning-of-line)
  (skip-chars-forward " \t\r"))

(defun al-delete-leading-whitespace ()
  "Delete leading whitespace from the current line."
  (save-excursion
    (beginning-of-line)
    (setq-local p1 (point))
    (al-goto-first-character-on-line)
    (setq-local p2 (- (point) 1))
    (unless (= p1 p2)
      (delete-region p1 p2))))

(defun al-get-current-line-indent ()
  "Get the column number of the current line's indent."
  (save-excursion
    (al-goto-first-character-on-line)
    (current-column)))

(defun al-get-previous-line-indent ()
  "Get the column number of the previous line's indent."
  (save-excursion
    (al-goto-previous-non-blank-line)
    (al-get-current-line-indent)))

(defun al-get-current-line-last-token ()
  "Get the last word on the current line."
  (string-trim (car (last
		     (split-string (al-get-line-content) " ")))))

(defun al-get-previous-line-last-token ()
  "Get the last word of the previous line."
  (save-excursion
    (al-goto-previous-non-blank-line)
    (al-get-current-line-last-token)))

(defun al-goto-line-where-last-token-is (token)
  "Move point down to the next line that ends with TOKEN."
  (forward-line -1)
  (unless (string= token (al-get-current-line-last-token))
    (al-goto-line-where-last-token-is token)))

(defun al-goto-start-of-block (block-alist-entry current-level)
  "Move point to the end of block according to BLOCK-ALIST-ENTRY.
CURRENT-LEVEL should be zero when called."
  (let ((block-begin (car block-alist-entry))
	(block-end (cdr block-alist-entry)))
    (forward-line -1)
    (let ((last-token (al-get-current-line-last-token)))
      (cond
       ((string= last-token block-end)
	(al-goto-start-of-block block-alist-entry (+ current-level 1)))
       ((string= last-token block-begin)
	(when (> current-level 0)
	  (al-goto-start-of-block block-alist-entry (- current-level 1))))
       (t (al-goto-start-of-block block-alist-entry current-level))))))

(defun al-get-indent-at-start-of-block (block-alist-entry)
  "Get the indent level at the start of the current block according to BLOCK-ALIST-ENTRY."
  (save-excursion
    (al-goto-start-of-block block-alist-entry 0)
    (al-get-current-line-indent)))

(defvar begin-end-blocks)
"Alist of block beginning and endings.
Entries ending in nil are 'beginning-only'."
(setq begin-end-blocks '(("{" . "}")
			 ("begin" . "end;")
			 ("var" . nil)))

(defun al-last-line-begins-block? ()
  "Is the last token of the previous line the begining of a block?"
  (let ((previous-token (al-get-previous-line-last-token)))
    (member previous-token (map-keys begin-end-blocks))))

(defun al-this-line-ends-block? ()
  "Does this line close a block?"
  (let ((last-token (al-get-current-line-last-token))
	(matching-tokens (map-values begin-end-blocks)))
    (member last-token matching-tokens)))

(defun al-indent-for-new-block ()
  "Indent the current line when it is the start of a block."
  (save-excursion
    (al-goto-first-character-on-line)
    (indent-to (indent-next-tab-stop (al-get-previous-line-indent)))))

(defun al-indent-end-block ()
  "Indent the current line when it is the end of a block."
  (save-excursion
    (let* ((this-token (al-get-current-line-last-token))
	   (block-alist-entry (rassoc this-token begin-end-blocks))
	   (starting-indent (al-get-indent-at-start-of-block block-alist-entry) ))
      (al-goto-first-character-on-line)
      (indent-to starting-indent))))

(defun al-indent-same-as-previous-line ()
  "Indent this line to the same level as the last non-empty one."
  (save-excursion
    (let ((indent-level (al-get-previous-line-indent)))
      (al-goto-first-character-on-line)
      (indent-to indent-level))))

(defun al-indent-line ()
  "Indent the current line."
  (al-delete-leading-whitespace)
  (cond
   ((= (line-number-at-pos) 1) nil)
   ((al-this-line-ends-block?) (al-indent-end-block))
   ((al-last-line-begins-block?) (al-indent-for-new-block))
   (t (al-indent-same-as-previous-line))))

(define-derived-mode al-mode prog-mode "al mode"
  "Major mode for editing AL Language Files"
  (setq-local font-lock-multiline t)
  (setq-local font-lock-defaults '(al-highlights nil t))
  (setq-local indent-line-function 'al-indent-line)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)

  (set-syntax-table al-mode-syntax-table))

;; Autoload mode when a .al file is opened
(add-to-list 'auto-mode-alist '("\\.al" . al-mode))

(provide 'al-mode)
