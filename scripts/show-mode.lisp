#!/usr/bin/env sbcl --script
(require :asdf)
(pushnew (truename "./") asdf:*central-registry* :test #'equal)
(ensure-directories-exist "build/fasl-cache/")
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (truename "build/fasl-cache/")))
   :ignore-inherited-configuration))
(asdf:load-system :prompt-universe)

(let ((config (prompt-universe:reload-mode-config))
      (summary (prompt-universe:mode-summary)))
  (declare (ignore config))
  (format t "Mode config (~A)~%~%" prompt-universe:*mode-config-path*)
  (format t "  current-mode: ~A (~A)~%"
          (getf summary :current-mode-id)
          (getf summary :mode-name))
  (format t "  mode ids: 0=illustration; 1=reserved for rebuilt story mode~%")
  (format t "~%Paths:~%")
  (format t "  illustration seeds: illustration/seeds/<category>/<SEED-NAME>.md~%")
  (format t "  illustration output: output/candidates/, variants/, publish/~%"))
