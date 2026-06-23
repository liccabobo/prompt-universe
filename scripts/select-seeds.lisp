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
  (format t "~&Usage: sbcl --script scripts/select-seeds.lisp --intent \"...\" [--limit N]~%"))

(let ((args (cdr sb-ext:*posix-argv*))
      (intent nil)
      (limit 5))
  (loop for i from 0 below (length args)
        for arg = (nth i args)
        do (cond
             ((string= arg "--intent")
              (setf intent (nth (1+ i) args)))
             ((string= arg "--limit")
              (setf limit (parse-integer (nth (1+ i) args))))))
  (unless intent
    (usage)
    (sb-ext:exit :code 1))
  (format t "~&Seed matches for: ~A~%~%" intent)
  (dolist (meta (prompt-universe:select-seeds :intent intent :limit limit))
    (format t "~3D  ~A~%     category: ~A~%     hint: ~A~%~%"
            (prompt-universe:seed-metadata-score meta)
            (prompt-universe:seed-metadata-id meta)
            (prompt-universe:seed-metadata-category meta)
            (prompt-universe:seed-metadata-intent-hint meta))))