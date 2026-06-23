(in-package #:prompt-universe)

(defparameter *draft-root*
  "output/lisp-drafts/"
  "AI-authored defprompt drafts before human approval.")

(defun draft-file-path (name)
  (merge-pathnames
   (format nil "~A.lisp" (string-downcase (string name)))
   *draft-root*))

(defun load-draft-file (name)
  "Load a draft .lisp file from output/lisp-drafts/."
  (let ((path (draft-file-path name)))
    (unless (probe-file path)
      (error "Draft not found: ~A (~A)" name path))
    (load path)
    (let ((prompt (find-prompt name)))
      (unless prompt
        (error "Draft ~A loaded but no matching defprompt was registered" name))
      prompt)))

(defun compile-draft-to-file (name &key (stage :candidate) directory)
  (let ((prompt (load-draft-file name)))
    (compile-prompt% prompt)
    (write-prompt-file prompt :stage stage :directory directory)))

(defun approve-draft (name)
  "Compile draft to output/approved/ and log approval."
  (let* ((path (compile-draft-to-file name :stage :approved))
         (log-dir (ensure-directories-exist "output/logs/"))
         (log-path (merge-pathnames
                    (format nil "approved-~A.log"
                            (string-downcase (string name)))
                    log-dir)))
    (with-open-file (stream log-path
                            :direction :output
                            :if-exists :supersede
                            :if-does-not-exist :create)
      (format stream "approved: ~A~%" (get-universal-time))
      (format stream "draft: ~A~%" (draft-file-path name))
      (format stream "output: ~A~%" path))
    path))