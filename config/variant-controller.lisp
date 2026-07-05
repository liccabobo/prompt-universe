;;;; Variant Controller — 可自由手動調整；每次 batch-generate / evolve-prompt 都會重新載入。
;;;;
;;;; 滑桿參數使用 0-100：
;;;;   0      = 關閉（此軸不要求變化）
;;;;   1-49   = 軟性建議（建議變化，但驗證不強制）
;;;;   50-100 = 硬性要求（批次驗證時必須通過）
;;;;
;;;; :gender-mode      性別呈現控制；:fixed = 保留原設定，:mutable = 允許變體漂移。
;;;; :material-accent  材質強調自由文字，例如 "prism"、"holo"、"lightflow"；空字串 "" = 關閉。
;;;; :leap-creativity  跨層級創意跳躍；:allow = 允許跨抽象層替換，nil = 只允許同抽象層替換。
;;;; :axis-threshold   滑桿硬性要求門檻；大於等於此值會在驗證時強制要求（預設 50）。
;;;; :variant-count    每次批次 / evolve run 的預設變體數量（預設 10）。

((:variant-count . 20)        ; 變體數量：本次批次或 evolve run 要生成的 prompt 數（預設 10）。
 (:color-shift . 80)          ; 色彩變化強度：控制 palette / color-theme 必須改變的程度。
 (:gender-mode . :mutable)    ; 性別模式：:fixed 保留原性別呈現，:mutable 允許依變體漂移。
 (:scene-shift . 85)          ; 場景變化強度：控制 theme-anchor / scene premise 的改變幅度。
 (:accessory-shift . 80)      ; 配件變化強度：控制 props / garnish / accessory-set 的重主題化幅度。
 (:evolution-fusion . 60)     ; 演化融合強度：控制多個 evolution / rule 混合時的融合程度。
 (:material-accent . "prism") ; 材質強調：追加的材質語義；空字串 "" 表示不套用。
 (:leap-creativity . nil)     ; 創意跳躍：:allow 允許跨抽象層變化，nil 限制在同層級替換。
 (:axis-threshold . 50))      ; 總開關：滑桿值達此門檻時，該變化軸必須通過驗證。(預設 50)
