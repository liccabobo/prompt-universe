#!/usr/bin/env sbcl --script
(require :asdf)
(pushnew (truename "./") asdf:*central-registry* :test #'equal)
(ensure-directories-exist "build/fasl-cache/")
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (truename "build/fasl-cache/")))
   :ignore-inherited-configuration))
(asdf:load-system :prompt-universe)

(let ((name nil))
  (loop for arg in (cdr sb-ext:*posix-argv*)
        when (and (not (char= #\- (char arg 0))) (null name))
          do (setf name (intern (string-downcase arg) :keyword)))
  (unless name
    (format t "Usage: sbcl --script scripts/approve-draft.lisp <draft-name>~%")
    (sb-ext:exit :code 1))
  (handler-case
      (let ((path (prompt-universe:approve-draft name)))
        (format t "Approved: ~A~%" path)
        (format t "You can now run batch-generate on an expansion plan.~%"))
    (error (c)
      (format *error-output* "Error: ~A~%" c)
      (sb-ext:exit :code 1))))