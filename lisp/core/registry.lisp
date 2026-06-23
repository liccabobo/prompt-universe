(in-package #:prompt-universe)

(defvar *prompt-registry* (make-hash-table :test #'equal))
(defvar *module-registry* (make-hash-table :test #'equal))
(defvar *method-registry* (make-hash-table :test #'equal))

(defun normalize-name (name)
  (string-upcase (string name)))

(defun register-prompt (name prompt)
  (let ((key (normalize-name name)))
    (when (gethash key *prompt-registry*)
      (warn "Overwriting existing prompt: ~A" key))
    (setf (gethash key *prompt-registry*) prompt))
  name)

(defun find-prompt (name)
  (gethash (normalize-name name) *prompt-registry*))

(defun register-module (name module)
  (let ((key (normalize-name name)))
    (when (gethash key *module-registry*)
      (warn "Overwriting existing module: ~A" key))
    (setf (gethash key *module-registry*) module))
  name)

(defun find-module (name)
  (gethash (normalize-name name) *module-registry*))

(defun register-method (name method)
  (let ((key (normalize-name name)))
    (when (gethash key *method-registry*)
      (warn "Overwriting existing method: ~A" key))
    (setf (gethash key *method-registry*) method))
  name)

(defun find-prompt-method (name)
  (gethash (normalize-name name) *method-registry*))