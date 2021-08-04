;;; ado-emacs.el --- Azure DevOps integration

;;; Copyright (C) 2021 by Stephen Cott

;; Author: Stephen Cott <stephencott@gmail.com>
;; URL: https://github.com/cotste/ado-emacs.el
;; Version: 0.01

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Azure devops operations in Emacs

;;; Code:

(defvar ado-username)
(defvar ado-token)
(defvar ado-url)
(defvar ado-org)
(defvar ado-proj)

(defun ado-get-rest(url username token)

  "Make a REST API call to ADO.
URL - the  root URL for ADO API
USERNAME - The username to connect to ADO with
TOKEN - The token used to connect to ADO"

  (let ((url-request-method "GET")
        (url-request-extra-headers (list (cons "Content-Type" "application/json") (cons "Authorization" (concat "Basic " (base64-encode-string (concat username":" token) t))))))
    (with-current-buffer
        (url-retrieve-synchronously ado-url)
      (setf (point) url-http-end-of-headers)
      (json-read))))

;(ado-get-rest ado-url ado-username ado-token)


(provide 'ado-emacs)
;;; ado-emacs.el ends here
