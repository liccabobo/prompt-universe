# 用 GPT Image 2 生圖時，該如何正確描述 prism / holo 這類高頻污染詞？
大家都知道 GPT Image 2 是噪聲偏高的生圖模型，很容易炸毛，除了正確壓制噪聲的技巧，假如想要用 holo 當主題，該如何做才不會拉升噪點？

因此我發明了降噪階梯變化版「Prism 頻率階梯」，來解決這個問題。

原本為了降噪，我的咒語結構設計是把 holo / prism 這種容易造成噪聲很高的高頻字詞，直接塞進第四層 QUATERNARY 做壓制，因為它只是點綴用的特效。但是現在反過來，需要利用 holo / prism 這種詞彙當作主題，holo 是主要的設計焦點時，又該如何做呢？
其實原則一直都很簡單，都是要讓模型知道 holo 並不是整張圖的全域材質，就不容易有碎片化的噪點。我直接把第四層刪掉，改成 QUALITY 渲染控制。

PRIMARY = 角色穩定
SECONDARY = 畫面結構與攝影光學
TERTIARY = 色調與材質
QUALITY = 渲染頻率控制
渲染頻率的控制是什麼意思？其實可以參考 QUALITY 的內容，會發現完全沒有提到任何風格，而是有點像一個調整渲染的曲線滑桿：
reduced high-frequency edge density 降低高頻邊緣密度
minimal crystal-sharp rendering 最小化水晶般銳利的渲染感
suppressed texture fragmentation 抑制紋理碎片化
這些字詞都不是美學的，而是工具的，更偏向是渲染頻率的參數描述語義，核心是抑制 prism 的擴散半徑。
其餘區域全部維持在低頻、霧化、乾淨的渲染：
soft-focus rendering balance 柔焦渲染平衡
soft atmospheric separation 軟大氣分離（霧化）
clean low-frequency cel-shading 乾淨的低頻賽璐璐上色
簡單說，我把 GPT Image 2 當作 Adobe 工具去思考。

holo 光療美甲｜咒語參考
prompts/source/detail-shot/HOLO-NAILS.md