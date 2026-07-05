(in-package #:prompt-universe)

(defvar *seed-control-registry* (make-hash-table :test #'equal))

(defstruct seed-control
  name
  intent
  seed-id
  source-prompt
  preserve
  mutate
  forbid
  locked-sections
  parameterized-sections
  variant-axes)

(defun register-seed-control (name control)
  (let ((key (normalize-name name)))
    (when (gethash key *seed-control-registry*)
      (warn "Overwriting existing seed control: ~A" key))
    (setf (gethash key *seed-control-registry*) control))
  name)

(defun find-seed-control (name)
  (gethash (normalize-name name) *seed-control-registry*))

(defun expansion-plan-seed-control-object (plan)
  (let ((ref (expansion-plan-seed-control plan)))
    (when ref
      (or (find-seed-control ref)
          (error "Seed control not found: ~A" ref)))))
