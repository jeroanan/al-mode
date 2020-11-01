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

(setq-local al-assignments
      '(("[:|+|-|/|*]=" . font-lock-keyword-face)))

(setq-local al-string-text
	    '(("'.*'" . font-lock-string-face)))

(setq-local al-single-line-comment
	    '((".*\\(//.*\\)" . (1 font-lock-comment-face))))

;; The different types of syntax highlight we want to apply in order
;; of priority. SO for instance we
(setq al-highlights (append al-single-line-comment
			    al-string-text
			    al-assignments
			    al-font-lock-keywords))

;; Handle pesky multiline comments -- from
;; http://ergoemacs.org/emacs/elisp_comment_coloring.html
(defvar al-mode-syntax-table nil "Syntax table for `al-mode'.")

(setq al-mode-syntax-table
      (let ( (synTable (make-syntax-table)))
        ;; comment style “/* … */”
	;; single-line comments are currently handled above
	;; in al-single-line-comment
        (modify-syntax-entry ?\/ ". 14" synTable)
        (modify-syntax-entry ?* ". 23" synTable)
        synTable))

(define-derived-mode al-mode prog-mode "al mode"
  "Major mode for editing AL Language Files"
  (setq-local font-lock-multiline t)
  (setq-local font-lock-defaults '(al-highlights nil t))

  (set-syntax-table al-mode-syntax-table))

;; Autoload mode when a .al file is opened
(add-to-list 'auto-mode-alist '("\\.al" . al-mode))

(provide 'al-mode)
