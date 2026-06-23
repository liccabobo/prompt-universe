#!/usr/bin/env sbcl --script
(require :asdf)
(pushnew (truename "./") asdf:*central-registry* :test #'equal)
(asdf:load-system :prompt-universe)

(let ((controller (prompt-universe:reload-variant-controller)))
  (format t "Variant controller (~A)~%~%" prompt-universe:*variant-controller-path*)
  (dolist (pair controller)
    (format t "  ~A: ~A~%" (car pair) (cdr pair)))
  (let ((plan (prompt-universe:find-expansion-plan :aware-loop-transit-10)))
    (when plan
      (let ((spec (prompt-universe:effective-variant-axis-spec plan controller)))
        (format t "~%Effective axes (aware-loop-transit-10):~%")
        (format t "  required: ~{~A~^, ~}~%" (getf spec :required))
        (format t "  recommended: ~{~A~^, ~}~%" (getf spec :recommended))
        (when (getf spec :leap-creativity)
          (format t "  leap-creativity: on~%"))))))