(in-package #:prompt-universe)

(defparameter *default-candidate-count* 1
  "Default number of canonical prompt candidates to create before review.")

(defparameter *default-final-variant-count* 10
  "Fallback default for :variant-count when controller omits the field.")

(defparameter *default-batch-count* 10
  "Default batch count. Per-request overrides must not mutate this value.")

(defun resolve-count (requested &key (role :final-variant))
  "Return REQUESTED if set, otherwise the default for ROLE."
  (or requested
      (ecase role
        (:candidate *default-candidate-count*)
        (:final-variant *default-final-variant-count*)
        (:batch *default-batch-count*))))