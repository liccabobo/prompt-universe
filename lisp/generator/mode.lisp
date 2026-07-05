(in-package #:prompt-universe)

(defparameter *mode-config-path*
  "config/mode.lisp"
  "User-editable mode switch: 0 = illustration, 1 = reserved.")

(defvar *mode-config* nil
  "Cached mode alist; reload with reload-mode-config.")

(defvar *mode-config-keys*
  '(:current-mode)
  "Known mode config fields.")

(defparameter *mode-id-registry*
  '((0 . :illustration)
    (1 . :reserved))
  "Numeric mode ID → internal keyword. Add 2, 3, … for future modes.")

(defun mode-keyword-for-id (id)
  (or (cdr (assoc id *mode-id-registry*))
      (error "Unknown mode id: ~A (registered: ~{~A~^, ~})"
             id (mapcar #'car *mode-id-registry*))))

(defun mode-id-for-keyword (keyword)
  (or (car (assoc keyword *mode-id-registry* :key #'cdr))
      (error "Unknown mode keyword: ~A" keyword)))

(defun coerce-mode-input (value)
  (cond
    ((integerp value) value)
    ((eq value :illustration) 0)
    ((eq value :reserved) 1)
    ((and (symbolp value) (digit-char-p (char (string value) 0)))
     (parse-integer (string value)))
    ((stringp value)
     (let ((trimmed (string-trim "() " value)))
       (cond
         ((string-equal trimmed "illustration") 0)
         ((string-equal trimmed "reserved") 1)
         (t (parse-integer trimmed)))))
    (t
     (error "Invalid mode value: ~A (use 0, 1, :illustration, or :reserved)" value))))

(defun normalize-mode-value (key value)
  (ecase key
    (:current-mode (coerce-mode-input value))
    (t value)))

(defun default-mode-value (key)
  (ecase key
    (:current-mode 0)))

(defun normalize-mode-config (alist)
  (loop for key in *mode-config-keys*
        collect (cons key
                      (normalize-mode-value
                       key (or (cdr (assoc key alist)) (default-mode-value key))))))

(defun read-mode-config-file (path)
  (with-open-file (stream path :direction :input)
    (let ((form (read stream nil)))
      (unless (listp form)
        (error "Mode config must be an alist in ~A" path))
      form)))

(defun reload-mode-config (&optional (path *mode-config-path*))
  (let ((resolved (merge-pathnames path (truename "."))))
    (unless (probe-file resolved)
      (error "Mode config not found: ~A" resolved))
    (setf *mode-config* (normalize-mode-config (read-mode-config-file resolved)))
    *mode-config*))

(defun mode-config ()
  (or *mode-config* (reload-mode-config)))

(defun mode-config-value (key &optional (config (mode-config)))
  (cdr (assoc key config)))

(defun current-mode-id (&optional (config (mode-config)))
  (mode-config-value :current-mode config))

(defun current-mode (&optional (config (mode-config)))
  (mode-keyword-for-id (current-mode-id config)))

(defun mode-name (&optional (config (mode-config)))
  (string-upcase (string (current-mode config))))

(defun illustration-mode-p (&optional (config (mode-config)))
  (= (current-mode-id config) 0))

(defun mode-summary (&optional (config (mode-config)))
  (let ((id (current-mode-id config)))
    (list :current-mode-id id
          :current-mode (current-mode config)
          :mode-name (mode-name config)
          :illustration-mode-p (illustration-mode-p config))))
