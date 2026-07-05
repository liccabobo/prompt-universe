(in-package #:prompt-universe)

(defvar *expansion-plan-registry* (make-hash-table :test #'equal))

(defstruct expansion-plan
  name
  intent
  seed-control
  seed-id
  source-prompt
  preserve
  forbid
  variant-axes
  variant-rules
  mutations)

(defun register-expansion-plan (name plan)
  (setf (gethash (normalize-name name) *expansion-plan-registry*) plan)
  name)

(defun find-expansion-plan (name)
  (gethash (normalize-name name) *expansion-plan-registry*))
