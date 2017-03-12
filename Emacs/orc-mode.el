;; Emacs mode for editing Orc programs
;;
;; Created by amp

;; BSD 3-Clause License
;;
;; Copyright (c) 2017 The University of Texas at Austin ("U. T. Austin")
;; All rights reserved.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions are met:
;;
;; * Redistributions of source code must retain the above copyright notice, this
;;   list of conditions and the following disclaimer.
;;
;; * Redistributions in binary form must reproduce the above copyright notice,
;;   this list of conditions and the following disclaimer in the documentation
;;   and/or other materials provided with the distribution.
;;
;; * Neither the name of the copyright holder nor the names of its
;;   contributors may be used to endorse or promote products derived from
;;   this software without specific prior written permission.
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
;; DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
;; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
;; CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
;; OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.orc\\'" . orc-mode))
;; TODO: Handle .inc files. The inc extension is used by too many other things.

(defvar orc-mode-hook nil)

(defvar orc-mode-map
  (let ((map (make-sparse-keymap)))
    map)
  "Keymap for Orc major mode")

(defconst orc-font-lock-keywords-keywords-1
  (regexp-opt '("as" "def" "else" "if" "import" "include" "lambda" "stop" "then" "type" "val" "_" "new" "with" "class" "extends" "site") t))

(defconst orc-font-lock-keywords-keywords-2
  (regexp-opt '(":>" "<:") t))

(defconst orc-font-lock-keywords-literals
  (regexp-opt '("true" "false" "null" "'\\w*'" "\"[^\"]*\"" "this" "self" "super" "signal") t))

(defconst orc-font-lock-keywords-combinators
  (regexp-opt '("{|" "|}" ">" ">>" ";" "|") t))

(defconst orc-font-lock-keywords-1
  (list
   (cons orc-font-lock-keywords-keywords-1 font-lock-builtin-face)
   (cons orc-font-lock-keywords-literals font-lock-variable-name-face))
  "Minimal highlighting expressions for Orc mode")

(defvar orc-font-lock-keywords orc-font-lock-keywords-1
  "Default highlighting expressions for Orc mode")

(defvar orc-mode-syntax-table
  (let ((st (make-syntax-table)))
	(modify-syntax-entry ?_ "w" st)
	(modify-syntax-entry ?\{  "(}1nb" st)
	(modify-syntax-entry ?\}  "){4nb" st)
	(modify-syntax-entry ?-  "_ 123" st)
	(modify-syntax-entry ?\n ">" st)
	st)
  "Syntax table for orc-mode")

;;;###autoload
(defun orc-mode ()
  "Major mode for editing Orc files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table orc-mode-syntax-table)
  (use-local-map orc-mode-map)
  (setq-local font-lock-defaults '(orc-font-lock-keywords))
  (setq-local tab-stop-list (number-sequence 2 120 2))
  (setq major-mode 'orc-mode)
  (setq mode-name "Orc")
  (font-lock-add-keywords nil (list (list orc-font-lock-keywords-combinators 0 font-lock-warning-face)))
  (font-lock-add-keywords nil (list (list orc-font-lock-keywords-keywords-2 0 font-lock-builtin-face))) 
  (run-hooks 'orc-mode-hook))

(provide 'orc-mode)
