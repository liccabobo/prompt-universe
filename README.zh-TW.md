# Prompt Universe

*[English](README.md) · 繁體中文*

---

多數人把咒語當成訊息。

你在對話框打幾行字，模型回你幾行字。你複製覺得好的那句，貼進生圖工具，然後祈禱明天還有效。

這樣做，直到某天失效為止。週二剛好的那段咒語，週四就漂了。你請模型做十個變體，拿到十個同義改寫。你记不清到底哪一版才是你真正喜歡的。

問題通常不是才華。是咒語被放進了錯的載體。

**Prompt Universe 把咒語當成程式。**

不是因為 Lisp 很潮，而是程式具備聊天記錄沒有的性質：結構、審查、diff、重用、編譯。你先描述咒語*是什麼*。編譯器把它變成 markdown。你核准一份 canonical。然後才批次變體——真的換色系、換場景錨點、換配件——而不是換幾個形容詞。

這是一套給「想讓咒語撐過現實」的人用的小工具鏈。

---

## 更好的迴圈

想像你在做一系列圖像咒語——一條果凍 prop 線、一組角色、一輯細節特寫。

舊迴圈是：腦暴、貼上、重生成、再貼、失去脈絡、重來。

Prompt Universe 的迴圈是：

**想法 → 結構 → 審查 → 編譯 → 變體 → 發佈。**

從 `prompts/source/` 的種子出發，或寫一份 Lisp 草稿。你先拿到一份 candidate，仔細讀過。你說可以。批次才開始跑——預設十個變體，需要規模時可以到一百。滿意了，把整批移到 `output/publish/`，像對待任何你願意署名的資產一樣 commit。

AI 不能跳過中間步驟。它先提案結構。你確認。然後才編譯。

那個停頓，才是重點。

---

## 這適合誰

如果你曾想過：*要是能像管 app 一樣 version-control 我的咒語就好了*——這就是為你寫的。

你不必愛 Lisp。你要願意跑幾個指令，並且在乎你正在做的東西。本機有 SBCL。也許用 Cursor 或 Grok 協作，而不是拉霸機。

若你現在只想貼一段 prompt 去生圖，這裡會顯重。若你想要的是**一座圖書館**——種子、方法、變體、發佈批次——這裡會讓你鬆一口氣。

---

## 五分鐘試跑

安裝 [SBCL](https://www.sbcl.org/)（建議 2.2+）。

```bash
git clone https://gitlab.com/bobo-ai/prompt-universe.git
cd prompt-universe
```

編譯一個現成種子——芒果果凍 prop，已經 curated 過：

```bash
sbcl --script scripts/compile-seed.lisp prop-design/GOLDEN-MANGO-JELLY
```

看結構。看 markdown。整個理念就濃縮在這一道指令裡。

接著產十個口味變體：

```bash
sbcl --script scripts/batch-generate.lisp dessert-jelly-flavor-10
```

打開 `output/variants/`。每一檔都是真正的分歧，不是同義詞練習。

當某一批你願意站出來負責，就發佈它：

```bash
sbcl --script scripts/publish-variants.lisp GOLDEN-MANGO-JELLY-2026-06-17
git add output/publish/GOLDEN-MANGO-JELLY-2026-06-17
```

草稿與工作區在 gitignored 資料夾。發佈區在 `output/publish/`——你願意公開展示的那一層。

---

## 這裡有什麼

**種子** — `prompts/source/` 放 curated 參考咒語。讀它們、學形狀。不要直接改；透過 report 提案。

**編譯器** — `lisp/` 把 module、method、constraint 展開成完整 section，並跑驗證。

**腳本** — `scripts/` 讓你不用開 REPL 也能跑完整流程。

**文件** — `docs/` 寫規則：輸出格式、變體軸、發佈流程、負責任咒語設計。

**發佈成果** — `output/publish/` 是你審過、願意分享的變體批次書架。

repo 內建十份種子。機器是為上百份準備的。

---

## 與 AI 協作

你對 agent 說「做一個櫻桃果凍 prop」，它不該在第一則回覆就丟出成品咒語。

它應該理解意圖、提案 Lisp 結構、等你說可以。

這套紀律寫在 [`agents.md`](agents.md)。完整人類流程在 [`docs/guides/ai-workflow.md`](docs/guides/ai-workflow.md)。機器只有配合習慣，才發揮得出來。

---

## 授權

**粉絲與個人使用：免費。商業使用：未經授權禁止。**

本專案為粉絲與個人開放原始碼——不是 MIT、不是 OSI 定義的開源、也不是 public domain。

**你可以**

- 用它為自己生圖、玩創作
- 為學習與興趣 fork、修改
- 非商用分享你產出的圖像
- 在社群發布個人作品

**你不可以**（除非取得商業授權）

- 販售咒語包、課程、訂閱制或以此為核心的 SaaS
- 在客戶案或營利公司的製作流程中使用
- 再散布時移除版權或署名

你生成的圖與咒語由你享用與負責；但不得把內建種子與 plan 編成大量咒語包轉售。

完整條文：[`LICENSE`](LICENSE)（英文，具法律效力）· 中文參考：[`LICENSE.zh-TW.md`](LICENSE.zh-TW.md)

商業授權：請開 issue。

---

## 貢獻

歡迎 issue、文件改進、非商用 PR。

請勿直接修改 `prompts/source/`；問題請寫到 `output/reports/`。貢獻適用授權條款第 6 條。

---

## 想再深一點

- [AI 工作流程](docs/guides/ai-workflow.md)
- [實作進度](docs/architecture/implementation-status.md)
- [發佈規則（繁中）](docs/rules/publish.zh-TW.md) — 從 `variants/` 選批次 → `publish/` → git 分享
- [設計哲學](docs/context/philosophy/)

---

*由 [Licca Bobo](https://gitlab.com/bobo-ai/prompt-universe) 製作。給想讓咒語留得久的人。*