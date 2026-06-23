(in-package #:prompt-universe)

(defun variant-file-name (base-name index)
  (format nil "~A-V~3,'0D.md"
          (string-upcase (substitute #\- #\_ (string base-name)))
          index))

(defun write-variant-file (prompt index &key directory base-name run-date)
  (let* ((slug (or base-name (prompt-name prompt)))
         (output-dir (ensure-directory-exists
                       (or directory (variant-run-directory slug run-date))))
         (filename (variant-file-name slug index))
         (path (merge-pathnames filename output-dir)))
    (compile-prompt% prompt)
    (with-open-file (stream path :direction :output :if-exists :supersede)
      (write-string (render-prompt prompt) stream))
    path))

(defun write-controller-report-lines (stream controller effective-spec)
  (format stream "## Variant Controller~%~%")
  (format stream "Source: ~A~%~%" *variant-controller-path*)
  (format stream "| Field | Value |~%")
  (format stream "|-------|-------|~%")
  (format stream "| variant-count | ~A |~%" (controller-value :variant-count controller))
  (format stream "| color-shift | ~A |~%" (controller-value :color-shift controller))
  (format stream "| gender-mode | ~A |~%" (controller-value :gender-mode controller))
  (format stream "| scene-shift | ~A |~%" (controller-value :scene-shift controller))
  (format stream "| accessory-shift | ~A |~%" (controller-value :accessory-shift controller))
  (format stream "| evolution-fusion | ~A |~%" (controller-value :evolution-fusion controller))
  (format stream "| material-accent | ~A |~%" (controller-value :material-accent controller))
  (format stream "| leap-creativity | ~A |~%" (controller-value :leap-creativity controller))
  (format stream "| axis-threshold | ~A |~%~%" (controller-value :axis-threshold controller))
  (when effective-spec
    (format stream "Effective required axes: ~{~A~^, ~}~%"
            (getf effective-spec :required))
    (format stream "~%Effective recommended axes: ~{~A~^, ~}~%~%"
            (getf effective-spec :recommended))))

(defun write-batch-report (plan-name paths &key count run-directory plan
                                              controller effective-spec)
  (let* ((report-dir (ensure-directories-exist "output/reports/"))
         (report-path (merge-pathnames
                       (format nil "batch-~A.md"
                               (string-downcase (string plan-name)))
                       report-dir))
         (axis-summary (and plan (variant-axis-summary plan))))
    (with-open-file (stream report-path :direction :output :if-exists :supersede)
      (format stream "# Batch Report: ~A~%~%" plan-name)
      (format stream "Count: ~D~%~%" count)
      (when run-directory
        (format stream "## Run Folder~%~%~A~%~%" run-directory))
      (when controller
        (write-controller-report-lines stream controller effective-spec))
      (when axis-summary
        (format stream "## Plan Variant Axes~%~%")
        (format stream "- required: ~{~A~^, ~}~%"
                (getf axis-summary :required))
        (format stream "- recommended: ~{~A~^, ~}~%~%"
                (getf axis-summary :recommended)))
      (format stream "## Variants~%~%")
      (loop for path in paths
            for i from 1
            do (format stream "~D. ~A~%" i path)))
    report-path))

(defun batch-generate (plan-name &key count)
  (let* ((controller (reload-variant-controller))
         (plan (or (find-expansion-plan plan-name)
                   (error "Expansion plan not found: ~A" plan-name)))
         (limit (resolve-variant-count count controller))
         (mutations (expansion-plan-mutations plan))
         (base (plan-base-prompt plan))
         (base-name (prompt-name base))
         (run-date (format-variant-date))
         (run-directory (variant-run-directory base-name run-date))
         (paths nil)
         (effective-spec nil))
    (unless mutations
      (error "Expansion plan ~A has no :mutations" plan-name))
    (multiple-value-bind (valid-p messages spec)
        (validate-expansion-plan-mutations plan base :controller controller)
      (setf effective-spec spec)
      (unless valid-p
        (error "Variant axis validation failed for ~A:~%~{~A~^~%~}"
               plan-name messages)))
    (loop for mutation in mutations
          for i from 1
          while (<= i limit)
          do (let* ((variant (apply-mutation (clone-prompt base) mutation))
                    (variant* (apply-variant-controller-effects variant controller)))
               (push (write-variant-file variant* i
                                         :base-name base-name
                                         :directory run-directory
                                         :run-date run-date)
                     paths)))
    (let ((report (write-batch-report plan-name (reverse paths)
                                      :count (length paths)
                                      :run-directory run-directory
                                      :plan plan
                                      :controller controller
                                      :effective-spec effective-spec)))
      (values (reverse paths) report run-directory))))