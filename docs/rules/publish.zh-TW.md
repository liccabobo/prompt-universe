# 發佈規則（Publish）

*[English](publish.md) · 繁體中文*

## 白話說明（給一般使用者）

批次產出的咒語會先放在 `output/variants/`。這裡是**工作區**，git **不會追蹤**，夥伴或其他人 pull 專案時**看不到**這些檔案。

當你在 `output/variants/` 裡找到**想分享**的那一批咒語，就做一次 **publish（發佈）**：

1. 確認資料夾名稱，例如 `MATCHING-PAW-PAIR-2026-06-22/`
2. 把它移到 `output/publish/`（資料夾名稱不變，只改上一層目錄）
3. `git add` 並 commit

發佈後，咒語會進入 **git 追蹤區**。有 repo 權限的人 pull 就能拿到同一批咒語——**這個功能的主要目的，就是讓你能快速跟夥伴或其他人分享咒語**，而不是只留在本機自用。

```text
variants  = 試做、修改、本機留著
publish   = 審好了，要透過 git 分享出去
```

### 最簡單的做法

```bash
# 腳本（推薦）
sbcl --script scripts/publish-variants.lisp MATCHING-PAW-PAIR-2026-06-22

# 或手動移動
mv output/variants/MATCHING-PAW-PAIR-2026-06-22 output/publish/

# 提交給夥伴
git add output/publish/MATCHING-PAW-PAIR-2026-06-22
git commit -m "publish: matching-paw-pair species 100"
```

---

## 目的

`output/publish/` 是**已審核變體批次**的 git 追蹤發佈區。

工作區變體留在 `output/variants/`（gitignored）。審核滿意後，再提升到 `output/publish/`。

## 資料夾

```text
output/variants/{{PROTOTYPE}}-{{YYYY-MM-DD}}/   工作區（git 不追蹤）
output/publish/{{PROTOTYPE}}-{{YYYY-MM-DD}}/    發佈區（git 追蹤）
```

資料夾名稱保持相同，只改父目錄：

```text
variants  ->  publish
```

## 設定檔

```text
config/publish.lisp
```

| 欄位 | 類型 | 說明 |
|------|------|------|
| `:source-directory` | 路徑字串 | 來源根目錄（預設 `output/variants/`） |
| `:publish-directory` | 路徑字串 | 發佈根目錄（預設 `output/publish/`） |
| `:transfer-mode` | `:move` / `:copy` | 移走或保留 variants 副本 |
| `:on-conflict` | `:error` / `:overwrite` / `:skip` | 目標已存在時的行為 |
| `:write-manifest` | 布林 | 發佈後寫入 `PUBLISH-MANIFEST.md` |
| `:require-markdown` | 布林 | 來源資料夾至少需有一個 `.md` 咒語 |

預設為 **move**：發佈後該批次會從 `output/variants/` 移走。

## 手動發佈

審核變體批次後：

```bash
mv output/variants/MATCHING-PAW-PAIR-2026-06-22 output/publish/
git add output/publish/MATCHING-PAW-PAIR-2026-06-22
git commit -m "publish: matching-paw-pair species 100"
```

## 腳本發佈

```bash
sbcl --script scripts/publish-variants.lisp MATCHING-PAW-PAIR-2026-06-22
git add output/publish/MATCHING-PAW-PAIR-2026-06-22
```

每次執行都會重新載入 `config/publish.lisp`。

可接受的參數格式：

```text
MATCHING-PAW-PAIR-2026-06-22
output/variants/MATCHING-PAW-PAIR-2026-06-22
output/variants/MATCHING-PAW-PAIR-2026-06-22/
```

## 生命週期

```text
batch-generate
  -> output/variants/{{PROTOTYPE}}-{{DATE}}/
  -> 你審核 / 修改
  -> publish（移動或複製）
  -> output/publish/{{PROTOTYPE}}-{{DATE}}/
  -> git add / commit
  -> 夥伴 pull 後使用同一批咒語
```

## Git 規則

- `output/variants/` 維持在 `.gitignore` 內
- `output/publish/` **不** ignore
- 不要從 `output/candidates/` 或 `output/approved/` 直接 publish；只發佈變體批次

## AI 規則

當使用者說 **發佈**、**publish** 或 **移到 publish** 時，AI 應：

1. 確認目標 run folder 在 `output/variants/`
2. 執行 `scripts/publish-variants.lisp` 或等效的 `mv`
3. 提醒使用者 `git add output/publish/<run-folder>`

未經使用者明確指示，不得自動 publish。