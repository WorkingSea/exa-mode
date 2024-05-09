;;; exa-mode.el --- Major mode for editing EXA assembly code in EXAPUNKS

;; Author: workingsea
;; Version: 1.0
;; Package-Requires: ((emacs "29"))
;; Keywords: languages,
;; URL: http://github.com/workingsea/exa-mode

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; This package provides syntax highlighting for EXA instructions, which are used in
;; the game EXAPUNKS.

;; To install exa-mode, add the following lines to your Emacs configuration:

;; (add-to-list 'load-path "/path/to/directory/containing/exa-mode/")
;; (require 'exa-mode)

;;; Code:

(defvar exa-mode-hook nil
  "Hook for customizing `exa-mode`.")

(defvar exa-mode-map
  (let ((map (make-sparse-keymap)))
    map)
  "Keymap for EXA major mode.")

(add-to-list 'auto-mode-alist '("\\.\\(exa\\|exapunks\\)\\'" . exa-mode))

(defconst exa-keywords
  '(("\\b\\(addi\\|copy\\|data\\|divi\\|drop\\|grab\\|halt\\|kill\\|link\\|make\\|mode\\|modi\\|muli\\|noop\\|rand\\|repl\\|seek\\|subi\\|swiz\\|test\\|void\\|wait\\|wipe\\)\\b" . font-lock-keyword-face)
    ("\\b\\(fjmp\\|jump\\|mark\\|tjmp\\)\\b" . font-lock-function-name-face)
    ("\\b\\(x\\|f\\|t\\|m\\)\\b" . font-lock-builtin-face)
    ("@\\(rep\\|end\\|{\\([0-9]+\\),\\([0-9]+\\)}\\)" . font-lock-constant-face))
  "Patterns to highlight in EXA mode.")

(defvar exa-font-lock-keywords exa-keywords
  "Default highlighting expressions for EXA mode.")

(defvar exa-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; Comment style: "; ..."
    (modify-syntax-entry ?\; "< b" st)
    ;; Newline ends comments
    (modify-syntax-entry ?\n "> b" st)
    st)
  "Syntax table for `exa-mode`.")

(defun exa-font-lock-setup ()
  "Set up font-lock for EXA mode to handle `NOTE` as a comment."
  (setq font-lock-defaults '(exa-font-lock-keywords))
  (font-lock-add-keywords nil
   '(("\\<\\(NOTE\\).*$" 0 'font-lock-comment-face t))))

(define-derived-mode exa-mode fundamental-mode "EXA"
  "Major mode for editing EXA language files."
  (set-syntax-table exa-mode-syntax-table)
  (exa-font-lock-setup)
  (setq-local font-lock-keywords-case-fold-search t))

(provide 'exa-mode)

;;; exa-mode.el ends here
