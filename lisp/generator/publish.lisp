(in-package #:prompt-universe)

;;;; 變體發佈模組 — 將 output/variants/ 的批次資料夾提升到 output/publish/。
;;;; 設定檔：config/publish.lisp（每次 publish-variant-run 都會重新載入）。

(defparameter *publish-config-path*
  "config/publish.lisp"
  "使用者可編輯的發佈設定檔路徑。")

(defvar *publish-config* nil
  "快取的發佈設定 alist；請用 reload-publish-config 重新載入。")

(defvar *publish-config-keys*
  '(:source-directory :publish-directory :transfer-mode :on-conflict
    :write-manifest :require-markdown)
  "已知的發佈設定欄位清單。")

(defun normalize-publish-value (key value)
  "正規化單一設定值，補預設並驗證合法選項。"
  (ecase key
    (:source-directory (ensure-publish-directory-value value "output/variants/"))
    (:publish-directory (ensure-publish-directory-value value "output/publish/"))
    (:transfer-mode (if (member value '(:move :copy)) value :move))
    (:on-conflict (if (member value '(:error :overwrite :skip)) value :error))
    (:write-manifest (not (null value)))
    (:require-markdown (not (null value)))
    (t value)))

(defun ensure-publish-directory-value (value default)
  "確保目錄字串以 / 結尾。"
  (let ((text (string-trim '(#\space) (if value (string value) default))))
    (if (char= #\/ (char text (1- (length text))))
        text
        (concatenate 'string text "/"))))

(defun default-publish-value (key)
  "回傳單一欄位的預設值。"
  (ecase key
    (:source-directory "output/variants/")
    (:publish-directory "output/publish/")
    (:transfer-mode :move)
    (:on-conflict :error)
    (:write-manifest t)
    (:require-markdown t)))

(defun normalize-publish-config (alist)
  "將讀入的 alist 正規化為完整設定。"
  (loop for key in *publish-config-keys*
        collect (cons key
                      (normalize-publish-value
                       key (or (cdr (assoc key alist)) (default-publish-value key))))))

(defun read-publish-config-file (path)
  "從檔案讀取發佈設定 alist。"
  (with-open-file (stream path :direction :input)
    (let ((form (read stream nil)))
      (unless (listp form)
        (error "Publish config must be an alist in ~A" path))
      form)))

(defun reload-publish-config (&optional (path *publish-config-path*))
  "重新載入 config/publish.lisp 並更新快取。"
  (let ((resolved (merge-pathnames path (truename "."))))
    (unless (probe-file resolved)
      (error "Publish config not found: ~A" resolved))
    (setf *publish-config* (normalize-publish-config (read-publish-config-file resolved)))
    *publish-config*))

(defun publish-config ()
  "取得目前發佈設定；若尚未載入則自動讀檔。"
  (or *publish-config* (reload-publish-config)))

(defun publish-config-value (key &optional (config (publish-config)))
  "讀取單一發佈設定欄位。"
  (cdr (assoc key config)))

(defun split-path-components (text)
  "將路徑字串依 / 切成元件清單。"
  (loop with start = 0
        for pos = (position #\/ text :start start)
        collect (subseq text start pos)
        while pos
        do (setf start (1+ pos))
        finally (return (nconc (when (< start (length text))
                                 (list (subseq text start)))
                               nil))))

(defun publish-run-folder-name (name-or-path)
  "將資料夾名稱或路徑正規化為 PROTOTYPE-YYYY-MM-DD。"
  (let* ((text (string-trim '(#\space #\/) (string name-or-path)))
         (parts (remove "" (split-path-components text) :test #'string=))
         (name (if (and (>= (length parts) 2)
                        (string= (first parts) "output")
                        (member (second parts) '("variants" "publish") :test #'string=))
                   (if (>= (length parts) 3)
                       (third parts)
                       (error "Invalid variant run path: ~A" name-or-path))
                   (if (= (length parts) 1)
                       (first parts)
                       (error "Invalid variant run folder: ~A" name-or-path)))))
    (unless (and name (plusp (length name)))
      (error "Variant run folder name is empty"))
    name))

(defun publish-root-pathname (relative-dir)
  "將設定檔中的相對目錄轉為專案根目錄下的絕對路徑。"
  (merge-pathnames relative-dir (truename ".")))

(defun publish-source-directory (folder-name &optional (config (publish-config)))
  "組出來源完整路徑：output/variants/<folder-name>/。"
  (merge-pathnames
   (format nil "~A/" folder-name)
   (publish-root-pathname (publish-config-value :source-directory config))))

(defun publish-target-directory (folder-name &optional (config (publish-config)))
  "組出目標完整路徑：output/publish/<folder-name>/。"
  (merge-pathnames
   (format nil "~A/" folder-name)
   (publish-root-pathname (publish-config-value :publish-directory config))))

(defun directory-markdown-count (directory)
  "計算資料夾內 .md 咒語檔數量。"
  (count-if (lambda (entry)
              (and (pathname-name entry)
                   (string= "md" (pathname-type entry))))
            (uiop:directory-files directory "*.md")))

(defun ensure-publish-source-ready (source-dir require-markdown)
  "確認來源資料夾存在，且（若設定要求）至少含一個 .md 檔。"
  (unless (uiop:directory-exists-p source-dir)
    (error "Variant run folder not found: ~A" source-dir))
  (when require-markdown
    (let ((count (directory-markdown-count source-dir)))
      (unless (plusp count)
        (error "Variant run folder has no markdown prompts: ~A" source-dir)))))

(defun remove-directory-tree (directory)
  "刪除整個目標資料夾（用於 :overwrite 衝突處理）。"
  (uiop:delete-directory-tree directory :validate t))

(defun copy-directory-tree (source-dir target-dir)
  "複製來源資料夾內所有檔案到目標（:transfer-mode :copy）。"
  (ensure-directories-exist target-dir)
  (dolist (file (uiop:directory-files source-dir))
    (uiop:copy-file file (merge-pathnames (file-namestring file) target-dir))))

(defun move-directory-tree (source-dir target-dir)
  "移動整個資料夾到 publish（:transfer-mode :move，預設）。"
  (ensure-directories-exist (directory-namestring target-dir))
  (rename-file source-dir target-dir))

(defun write-publish-manifest (target-dir folder-name &key transfer-mode source-dir)
  "在發佈資料夾寫入 PUBLISH-MANIFEST.md 紀錄。"
  (let ((path (merge-pathnames "PUBLISH-MANIFEST.md" target-dir)))
    (with-open-file (stream path :direction :output :if-exists :supersede)
      (format stream "# Publish Manifest: ~A~%~%" folder-name)
      (format stream "- published-at: ~A~%" (format-variant-date))
      (format stream "- source: ~A~%" source-dir)
      (format stream "- target: ~A~%" target-dir)
      (format stream "- transfer-mode: ~A~%" transfer-mode)
      (format stream "- prompt-count: ~D~%"
              (directory-markdown-count target-dir)))
    path))

(defun publish-variant-run (name-or-path &key (config nil))
  "發佈一個變體批次資料夾到 output/publish/。
   接受資料夾名稱或完整路徑，例如 MATCHING-PAW-PAIR-2026-06-22。
   回傳：target-dir, transfer-mode, folder-name, manifest-path（可為 nil）。"
  (let* ((config (or config (reload-publish-config)))
         (folder-name (publish-run-folder-name name-or-path))
         (source-dir (publish-source-directory folder-name config))
         (target-dir (publish-target-directory folder-name config))
         (transfer-mode (publish-config-value :transfer-mode config))
         (on-conflict (publish-config-value :on-conflict config))
         (write-manifest (publish-config-value :write-manifest config))
         (require-markdown (publish-config-value :require-markdown config)))
    (ensure-publish-source-ready source-dir require-markdown)
    (cond
      ((uiop:directory-exists-p target-dir)
       (ecase on-conflict
         (:error
          (error "Publish target already exists: ~A" target-dir))
         (:skip
          (return-from publish-variant-run
            (values target-dir :skipped folder-name)))
         (:overwrite
          (remove-directory-tree target-dir))))
      (t
       (ensure-directories-exist (publish-config-value :publish-directory config))))
    (ecase transfer-mode
      (:move (move-directory-tree source-dir target-dir))
      (:copy
       (copy-directory-tree source-dir target-dir)))
    (let ((manifest-path
           (when write-manifest
             (write-publish-manifest target-dir folder-name
                                     :transfer-mode transfer-mode
                                     :source-dir source-dir))))
      (values target-dir transfer-mode folder-name manifest-path))))