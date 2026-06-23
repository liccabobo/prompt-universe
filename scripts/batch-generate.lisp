#!/usr/bin/env sbcl --script
(require :asdf)
(pushnew (truename "./") asdf:*central-registry* :test #'equal)
(ensure-directories-exist "build/fasl-cache/")
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (truename "build/fasl-cache/")))
   :ignore-inherited-configuration))
(asdf:load-system :prompt-universe)

(defun usage ()
  (format t "~&Usage: sbcl --script scripts/batch-generate.lisp <plan-name> [--count N]~%")
  (let ((controller (prompt-universe:reload-variant-controller)))
    (format t "  default count: ~D (from config/variant-controller.lisp :variant-count)~%"
            (prompt-universe:controller-value :variant-count controller)))
  (format t "  example: sbcl --script scripts/batch-generate.lisp dessert-jelly-flavor-10~%"))

(let ((plan nil) (count nil))
  (loop for arg in (cdr sb-ext:*posix-argv*)
        for i from 0
        do (cond
             ((string= arg "--count")
              (setf count (parse-integer (nth (1+ i) (cdr sb-ext:*posix-argv*)))))
             ((and (not (char= #\- (char arg 0))) (null plan))
              (setf plan (intern (string-upcase arg) :keyword)))))
  (unless plan (usage) (sb-ext:exit :code 1))
  (handler-case
      (multiple-value-bind (paths report run-directory)
          (prompt-universe:batch-generate plan :count count)
        (format t "Run folder: ~A~%" run-directory)
        (format t "Generated ~D variants~%" (length paths))
        (dolist (path paths) (format t "  ~A~%" path))
        (format t "Report: ~A~%" report))
    (error (c)
      (format *error-output* "Error: ~A~%" c)
      (sb-ext:exit :code 1))))