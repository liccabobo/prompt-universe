(in-package #:prompt-universe)

(defun prompt-file-name (prompt)
  (format nil "~A.md"
          (string-upcase
           (substitute #\- #\_ (string (prompt-name prompt))))))

(defun render-entry (entry)
  (typecase entry
    (prompt-param
     (format nil "{{~A}}" (prompt-param-value entry)))
    (string entry)
    (symbol (string-downcase (string entry)))
    (t (princ-to-string entry))))

(defun render-section (section stream)
  (format stream "~A:~%" (normalize-heading (prompt-section-heading section)))
  (format stream "~{~A~^, ~}~%"
          (mapcar #'render-entry (prompt-section-entries section))))

(defun render-prompt-to-stream (prompt stream)
  (dolist (line (prompt-preface prompt))
    (format stream "~A~%" line))
  (when (prompt-preface prompt)
    (format stream "~%"))
  (loop for section in (prompt-sections prompt)
        for index from 0
        do
          (when (> index 0)
            (format stream "~%"))
          (render-section section stream)))

(defun render-prompt (prompt)
  (with-output-to-string (out)
    (render-prompt-to-stream prompt out)))