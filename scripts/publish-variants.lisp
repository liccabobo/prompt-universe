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
  (format t "~&Usage: sbcl --script scripts/publish-variants.lisp <run-folder>~%")
  (format t "  run-folder examples:~%")
  (format t "    MATCHING-PAW-PAIR-2026-06-22~%")
  (format t "    output/variants/MATCHING-PAW-PAIR-2026-06-22/~%")
  (format t "~%Config: config/publish.lisp~%")
  (format t "Manual equivalent: mv output/variants/<run-folder> output/publish/~%"))

(let ((folder nil))
  (loop for arg in (cdr sb-ext:*posix-argv*)
        when (and (not (char= #\- (char arg 0))) (null folder))
          do (setf folder arg))
  (unless folder
    (usage)
    (sb-ext:exit :code 1))
  (handler-case
      (multiple-value-bind (target-dir transfer-mode folder-name manifest-path)
          (prompt-universe:publish-variant-run folder)
        (format t "Published: ~A~%" folder-name)
        (format t "Target: ~A~%" target-dir)
        (format t "Transfer mode: ~A~%" transfer-mode)
        (when manifest-path
          (format t "Manifest: ~A~%" manifest-path))
        (format t "~%Next: git add output/publish/~A~%" folder-name))
    (error (c)
      (format *error-output* "Error: ~A~%" c)
      (sb-ext:exit :code 1))))