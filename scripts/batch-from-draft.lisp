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
  (format t "~&Usage: sbcl --script scripts/batch-from-draft.lisp <draft-name> <plan-name> [--count N]~%"))

(let ((draft nil) (plan nil) (count nil))
  (loop for arg in (cdr sb-ext:*posix-argv*)
        for i from 0
        do (cond
             ((string= arg "--count")
              (setf count (parse-integer (nth (1+ i) (cdr sb-ext:*posix-argv*)))))
             ((and (not (char= #\- (char arg 0))) (null draft))
              (setf draft (intern (string-downcase arg) :keyword)))
             ((and (not (char= #\- (char arg 0))) draft (null plan))
              (setf plan (intern (string-upcase arg) :keyword)))))
  (unless (and draft plan) (usage) (sb-ext:exit :code 1))
  (handler-case
      (progn
        (prompt-universe:load-draft-file draft)
        (multiple-value-bind (paths report run-directory)
            (prompt-universe:batch-generate plan :count count)
          (format t "Run folder: ~A~%" run-directory)
          (format t "Generated ~D variants~%" (length paths))
          (dolist (path paths) (format t "  ~A~%" path))
          (format t "Report: ~A~%" report)))
    (error (c)
      (format *error-output* "Error: ~A~%" c)
      (sb-ext:exit :code 1))))