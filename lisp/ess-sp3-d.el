;;; ess-sp3-d.el --- S-PLUS 3.x customization

;; Copyright (C) 1997--2004 A.J. Rossini, Richard M. Heiberger, Martin
;;      Maechler, Kurt Hornik, Rodney Sparapani, and Stephen Eglen.

;; Author: A.J. Rossini <rossini@u.washington.edu>
;; Created: 12 Jun 1997
;; Maintainer: ESS-core <ESS-core@r-project.org>

;; Keywords: languages

;; This file is part of ESS.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; A copy of the GNU General Public License is available at
;; https://www.r-project.org/Licenses/

;;; Commentary:

;; This file defines all the S-PLUS 3.x customizations for ess-mode.

;;; Code:

(require 'ess-s-lang)
(require 'ess-trns)

(defvar S+3-dialect-name "S+3"
  "Name of 'dialect' for S-PLUS 3.x.");easily changeable in a user's .emacs

(defvar S+3-customize-alist
  (append
   '((ess-local-customize-alist         . 'S+3-customize-alist)
     (ess-dialect                       . S+3-dialect-name)
     (ess-object-name-db-file           . "ess-s+3-namedb.el" )
     (inferior-ess-program              . inferior-S+3-program)
     (inferior-ess-help-command         . "help(\"%s\", pager=\"cat\", window=FALSE)\n")
     (inferior-ess-help-filetype . nil)
     (inferior-ess-search-list-command  . "search()\n")
     (inferior-ess-start-file           . nil) ;"~/.ess-S+3")
     (inferior-ess-start-args       . "")
     (ess-STERM  . "iESS")
     )
   S+common-cust-alist)

  "Variables to customize for S+3.")


(defun S+3 (&optional proc-name)
  "Call 'S-PLUS 3.x', the 'Real Thing'  from StatSci."
  (interactive)
  (setq ess-customize-alist S+3-customize-alist)
  (ess-write-to-dribble-buffer
   (format "\n(S+3): ess-dialect=%s, buf=%s\n" ess-dialect (current-buffer)))
  (inferior-ess)
  (if inferior-ess-language-start
      (ess-eval-linewise inferior-ess-language-start)))

(defun S+3-mode (&optional proc-name)
  "Major mode for editing S+3 source.  See `ess-mode' for more help."
  (interactive)
  (setq ess-customize-alist S+3-customize-alist)
  (ess-mode S+3-customize-alist proc-name)
  (if ess-imenu-use-S (ess-imenu-S)))

(defun S+3-transcript-mode ()
  "S-PLUS 3.x transcript mode."
  (interactive)
  (ess-transcript-mode S+3-customize-alist))



 ; Provide package

(provide 'ess-sp3-d)

;;; ess-sp3-d.el ends here
