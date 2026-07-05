#!/usr/bin/env sbcl --script
;;;; Compile any curated seed from illustration/seeds/ to output/.
(require :asdf)
(pushnew (truename "./") asdf:*central-registry* :test #'equal)
(ensure-directories-exist "build/fasl-cache/")
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (truename "build/fasl-cache/")))
   :ignore-inherited-configuration))
(asdf:load-system :prompt-universe)

(defun usage ()
  (format t "~&Prompt Universe — compile-seed~%")
  (format t "================================~%~%")
  (format t "Usage:~%")
  (format t "  sbcl --script scripts/compile-seed.lisp <seed-id> [--stage STAGE]~%~%")
  (format t "  seed-id   Relative path without .md under illustration/seeds/~%")
  (format t "            Example: prop-design/GOLDEN-MANGO-JELLY~%~%")
  (format t "  --stage   candidate | approved | variant | batch  (default: candidate)~%")
  (format t "  --list    List available seeds~%")
  (format t "  --help    Show this help~%~%")
  (format t "Examples:~%")
  (format t "  sbcl --script scripts/compile-seed.lisp prop-design/GOLDEN-MANGO-JELLY~%")
  (format t "  sbcl --script scripts/compile-seed.lisp detail-shot/HOLO-NAILS --stage candidate~%")
  (finish-output))

(defun list-seeds (&optional (root "illustration/seeds/"))
  (let ((root-path (truename root)))
    (sort
     (loop for file in (directory (merge-pathnames "**/*.md" root-path))
           for rel = (enough-namestring file root-path)
           collect (subseq rel 0 (- (length rel) 3)))
     #'string<)))

(defun parse-stage (name)
  (case (intern (string-upcase name) :keyword)
    (:candidate :candidate)
    (:approved :approved)
    (:variant :variant)
    (:batch :batch)
    (otherwise
     (error "Unknown stage: ~A (use candidate, approved, variant, or batch)" name))))

(defun parse-args (argv)
  (let ((seed-id nil)
        (stage :candidate)
        (list-p nil)
        (help-p nil))
    (loop for i from 0 below (length argv)
          for arg = (nth i argv)
          do (cond
               ((string= arg "--help") (setf help-p t))
               ((string= arg "-h") (setf help-p t))
               ((string= arg "--list") (setf list-p t))
               ((string= arg "--stage")
                (let ((value (nth (1+ i) argv)))
                  (unless value (error "Missing value after --stage"))
                  (setf stage (parse-stage value))))
               ((and (not (char= #\- (char arg 0))) (null seed-id))
                (setf seed-id arg))
               ((char= #\- (char arg 0))
                (error "Unknown option: ~A" arg))))
    (values seed-id stage list-p help-p)))

(multiple-value-bind (seed-id stage list-p help-p)
    (parse-args (cdr sb-ext:*posix-argv*))
  (cond
    (help-p (usage))
    (list-p
     (format t "~&Available seeds:~%")
     (dolist (seed (list-seeds))
       (format t "  ~A~%" seed))
     (finish-output))
    ((null seed-id)
     (usage)
     (sb-ext:exit :code 1))
    (t
     (format t "~&Seed: illustration/seeds/~A.md~%" seed-id)
     (format t "Stage: ~A~%~%" (string-downcase (symbol-name stage)))
     (handler-case
         (progn
           (let ((prompt (prompt-universe:load-seed seed-id)))
             (multiple-value-bind (valid-p messages)
                 (prompt-universe:validate-prompt-detail prompt)
               (unless valid-p
                 (error "Validation failed:~%~{~A~^~%~}"
                        (mapcar #'prompt-universe::validation-message-text
                                messages)))))
           (let* ((path (prompt-universe:compile-seed-to-file seed-id :stage stage))
                  (prompt (prompt-universe:load-seed seed-id)))
             (format t "Compiled: ~A~%" path)
             (format t "Sections: ~D~%"
                     (length (prompt-universe:prompt-sections prompt)))))
       (error (c)
         (format *error-output* "~&Error: ~A~%" c)
         (sb-ext:exit :code 1))))))