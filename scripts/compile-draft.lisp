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
  (format t "~&Usage: sbcl --script scripts/compile-draft.lisp <draft-name> [--stage STAGE]~%")
  (format t "  draft file: output/lisp-drafts/<draft-name>.lisp~%")
  (format t "  stage: candidate | approved | variant | batch (default: candidate)~%"))

(defun parse-stage (name)
  (case (intern (string-upcase name) :keyword)
    (:candidate :candidate) (:approved :approved)
    (:variant :variant) (:batch :batch)
    (t (error "Unknown stage: ~A" name))))

(let ((name nil) (stage :candidate))
  (loop for arg in (cdr sb-ext:*posix-argv*)
        for i from 0
        do (cond
             ((string= arg "--stage")
              (setf stage (parse-stage (nth (1+ i) (cdr sb-ext:*posix-argv*)))))
             ((and (not (char= #\- (char arg 0))) (null name))
              (setf name (intern (string-downcase arg) :keyword)))))
  (unless name (usage) (sb-ext:exit :code 1))
  (handler-case
      (let* ((path (prompt-universe:compile-draft-to-file name :stage stage))
             (prompt (prompt-universe:load-draft-file name)))
        (format t "Compiled: ~A~%" path)
        (format t "Sections: ~D~%"
                (length (prompt-universe:prompt-sections prompt))))
    (error (c)
      (format *error-output* "Error: ~A~%" c)
      (sb-ext:exit :code 1))))