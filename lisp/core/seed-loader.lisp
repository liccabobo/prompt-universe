(in-package #:prompt-universe)

(defparameter *seed-root*
  "prompts/source/"
  "Root directory for immutable curated seed prompts.")

(defun seed-relative-path (seed-id)
  "SEED-ID is a relative path without extension, e.g. prop-design/GOLDEN-MANGO-JELLY."
  (format nil "~A.md" (string seed-id)))

(defun seed-file-path (seed-id)
  (merge-pathnames (seed-relative-path seed-id) *seed-root*))

(defun seed-name-from-id (seed-id)
  "prop-design/GOLDEN-MANGO-JELLY -> golden-mango-jelly"
  (let ((basename (pathname-name (parse-namestring (format nil "/~A" seed-id)))))
    (intern (string-downcase (substitute #\- #\_ basename)))))

(defun section-heading-line-p (line)
  (and (find #\: line)
       (let ((trimmed (string-trim #(#\space #\tab) line)))
         (and (> (length trimmed) 1)
              (char= #\: (char trimmed (1- (length trimmed))))
              (every (lambda (char)
                       (or (upper-case-p char)
                           (digit-char-p char)
                           (find char '(#\- #\space #\:))))
                     (subseq trimmed 0 (1- (length trimmed))))))))

(defun parse-param-line-p (line)
  (let ((trimmed (string-trim #(#\space #\tab) line)))
    (and (>= (length trimmed) 4)
         (char= #\{ (char trimmed 0))
         (char= #\{ (char trimmed 1))
         (char= #\} (char trimmed (- (length trimmed) 2)))
         (char= #\} (char trimmed (- (length trimmed) 1))))))

(defun parse-line-entries (line)
  (let ((trimmed (string-trim #(#\space #\tab) line)))
    (cond
      ((zerop (length trimmed)) nil)
      ((parse-param-line-p trimmed)
       (list (param (subseq trimmed 2 (- (length trimmed) 2)))))
      (t (list trimmed)))))

(defun parse-seed-lines (lines)
  (let ((preface nil)
        (sections nil)
        (current-heading nil)
        (current-body nil)
        (in-preface t))
    (flet ((flush-section ()
             (when current-heading
               (let ((entries nil))
                 (dolist (line current-body)
                   (setf entries (append entries (parse-line-entries line))))
                 (push (make-prompt-section
                        :heading (normalize-heading current-heading)
                        :entries entries)
                       sections))
               (setf current-heading nil
                     current-body nil))))
      (dolist (line lines)
        (cond
          ((and in-preface (section-heading-line-p line))
           (setf in-preface nil)
           (setf current-heading (string-trim #(#\space #\tab #\:) line))
           (setf current-body nil))
          (in-preface
           (push line preface))
          ((section-heading-line-p line)
           (flush-section)
           (setf current-heading (string-trim #(#\space #\tab #\:) line))
           (setf current-body nil))
          (t
           (push line current-body))))
      (flush-section)
      (values (nreverse preface) (sort-sections (nreverse sections))))))

(defun load-seed (seed-id)
  "Load immutable seed markdown from prompts/source/ into a prompt struct."
  (let ((path (seed-file-path seed-id)))
    (unless (probe-file path)
      (error "Seed not found: ~A (~A)" seed-id path))
    (with-open-file (stream path :direction :input)
      (let ((lines (loop for line = (read-line stream nil nil)
                         while line
                         collect line)))
        (multiple-value-bind (preface sections)
            (parse-seed-lines lines)
          (make-prompt
           :name (seed-name-from-id seed-id)
           :intent (format nil "curated seed: ~A" seed-id)
           :semantic-tags '(:seed :source)
           :risk-tags nil
           :preface preface
           :sections sections))))))

(defun compile-seed (seed-id)
  (compile-prompt% (load-seed seed-id)))

(defun compile-seed-to-file (seed-id &key (stage :candidate) directory)
  (let ((prompt (load-seed seed-id)))
    (compile-prompt% prompt)
    (write-prompt-file prompt :stage stage :directory directory)))