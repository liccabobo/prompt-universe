(in-package #:prompt-universe)

(defun stage-directory (stage)
  (ecase stage
    (:candidate "output/candidates/")
    (:approved "output/approved/")
    (:variant "output/variants/")
    (:publish "output/publish/")
    (:batch "output/batches/")))

(defun format-variant-date (&optional (universal-time (get-universal-time)))
  "Return YYYY-MM-DD for variant run folder names."
  (multiple-value-bind (second minute hour date month year)
      (decode-universal-time universal-time)
    (declare (ignore second minute hour))
    (format nil "~4,'0D-~2,'0D-~2,'0D" year month date)))

(defun prompt-slug-name (name)
  (string-upcase (substitute #\- #\_ (string name))))

(defun variant-run-folder-name (base-name &optional (date-string (format-variant-date)))
  "Prototype spell name + date, e.g. GOLDEN-MANGO-JELLY-2026-06-17."
  (format nil "~A-~A" (prompt-slug-name base-name) date-string))

(defun variant-run-directory (base-name &optional (date-string (format-variant-date)))
  (merge-pathnames
   (format nil "~A/" (variant-run-folder-name base-name date-string))
   (stage-directory :variant)))

(defun ensure-directory-exists (pathname)
  (ensure-directories-exist pathname)
  pathname)

(defun compile-prompt% (prompt)
  (multiple-value-bind (valid-p messages) (validate-prompt prompt)
    (unless valid-p
      (error "Prompt validation failed: ~{~A~^; ~}" messages)))
  (render-prompt prompt))

(defun compile-prompt (name-or-prompt)
  (compile-prompt% (ensure-prompt name-or-prompt)))

(defun write-prompt-file (prompt &key (stage :candidate) directory)
  (let* ((output-dir (ensure-directory-exists (or directory (stage-directory stage))))
         (path (merge-pathnames (prompt-file-name prompt) output-dir)))
    (with-open-file (stream path
                            :direction :output
                            :if-exists :supersede
                            :if-does-not-exist :create)
      (write-string (render-prompt prompt) stream))
    path))

(defun compile-prompt-to-file (name-or-prompt &key (stage :candidate) directory)
  (let ((prompt (ensure-prompt name-or-prompt)))
    (compile-prompt% prompt)
    (write-prompt-file prompt :stage stage :directory directory)))