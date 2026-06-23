;;;; Publish Controller — 可自由手動調整；publish-variant-run / scripts/publish-variants.lisp 每次執行都會重新載入。
;;;;
;;;; 用途：把 output/variants/ 底下已審核的變體批次，移動或複製到 output/publish/ 以便 git 追蹤。
;;;;
;;;; :source-directory   變體工作區（預設 output/variants/，應在 .gitignore 內）。
;;;; :publish-directory  發佈區（預設 output/publish/，可被 git 追蹤）。
;;;; :transfer-mode      :move = 從 variants 移走；:copy = 保留 variants 副本。
;;;; :on-conflict        目標已存在時：:error 拒絕、:overwrite 覆蓋、:skip 略過。
;;;; :write-manifest     發佈後在資料夾寫入 PUBLISH-MANIFEST.md。
;;;; :require-markdown   來源資料夾至少需含一個 .md 咒語檔。

((:source-directory . "output/variants/")   ; 來源根目錄：變體工作區，通常不進 git。
 (:publish-directory . "output/publish/")   ; 目標根目錄：發佈區，供 git 追蹤。
 (:transfer-mode . :move)                   ; 傳輸模式：:move 移動（預設）；:copy 複製並保留原資料夾。
 (:on-conflict . :error)                    ; 衝突處理：目標已存在時拒絕；可改 :overwrite 或 :skip。
 (:write-manifest . t)                      ; 發佈紀錄：是否在目標資料夾寫入 PUBLISH-MANIFEST.md。
 (:require-markdown . t))                   ; 來源檢查：來源資料夾至少需含一個 .md 咒語檔。