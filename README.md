# Prompt Universe

*English · [繁體中文](README.zh-TW.md)*

---

Most people treat prompts like messages.

You type something into a chat box. You get something back. You copy the good line, paste it into an image model, and hope it still works tomorrow.

That works until it doesn't. The prompt that felt perfect on Tuesday drifts by Thursday. You ask the model to make ten variations and get ten paraphrases of the same idea. You can't quite remember which version you actually liked.

The problem isn't talent. It's that prompts are being stored in the wrong medium.

**Prompt Universe treats a prompt like code.**

Not because Lisp is fashionable, but because code has properties that chat transcripts don't: structure, review, diff, reuse, and compile. You describe what the prompt *is*. A compiler turns that description into markdown. You approve one canonical version. Then you generate variants that actually diverge — different palette, different scene anchor, different props — not just different adjectives.

This is a small toolchain for people who want their prompts to survive contact with reality.

---

## A better loop

Imagine you're building a series of image prompts — a jelly prop line, a character set, a detail-shot collection.

The old loop looks like this: brainstorm, paste, regenerate, paste again, lose the thread, start over.

The Prompt Universe loop looks like this:

**Idea → structure → review → compile → variants → publish.**

You start from a seed in `prompts/source/` or write a draft in Lisp. You get one candidate prompt and read it carefully. You say yes. Only then does the batch run — ten variants by default, a hundred when you need scale. When you're happy, you publish the batch to `output/publish/` and commit it like any other asset you trust.

The AI doesn't get to skip the middle steps. It proposes structure first. You confirm. Then it compiles.

That pause is the point.

---

## Who this is for

This is for you if you've ever thought: *I wish I could version-control my prompts the way I version-control my apps.*

You don't need to love Lisp. You need to be willing to run a few commands and care about what you're making. SBCL on your machine. Maybe Cursor or Grok as a collaborator, not a slot machine.

If you only want a single prompt to paste into Midjourney right now, this will feel heavy. If you want a **library** — seeds, methods, variants, published batches — it will feel like relief.

---

## Try it in five minutes

Install [SBCL](https://www.sbcl.org/) (2.2+ recommended).

```bash
git clone https://gitlab.com/bobo-ai/prompt-universe.git
cd prompt-universe
```

Compile an existing seed — a golden mango jelly prop, already curated:

```bash
sbcl --script scripts/compile-seed.lisp prop-design/GOLDEN-MANGO-JELLY
```

See the structure. See the markdown. That's the whole idea in one command.

Now generate ten flavor variants:

```bash
sbcl --script scripts/batch-generate.lisp dessert-jelly-flavor-10
```

Open `output/variants/`. Each file is a real divergence, not a thesaurus exercise.

When a batch is ready to share, publish it:

```bash
sbcl --script scripts/publish-variants.lisp GOLDEN-MANGO-JELLY-2026-06-17
git add output/publish/GOLDEN-MANGO-JELLY-2026-06-17
```

Working drafts live in gitignored folders. Published work lives in `output/publish/` — the part you stand behind.

---

## What lives here

**Seeds** — `prompts/source/` holds curated reference prompts. Read them. Learn their shape. Don't edit them; propose changes through reports.

**Compiler** — `lisp/` expands modules, methods, and constraints into full prompt sections with validation.

**Scripts** — `scripts/` is how you actually run things without opening a REPL.

**Docs** — `docs/` holds the rules: output format, variant axes, publish workflow, responsible prompting.

**Published work** — `output/publish/` is the public-facing shelf for variant batches you've reviewed.

Ten seeds ship with the repo today. The machinery is built for hundreds.

---

## Working with AI

Tell your agent "generate a cherry jelly prop" and it should not dump a finished prompt on the first reply.

It should interpret your intent, propose Lisp changes, and wait for your yes.

That discipline is written in [`agents.md`](agents.md). The full human workflow is in [`docs/guides/ai-workflow.md`](docs/guides/ai-workflow.md). The machinery only works if the habits match.

---

## License

**Fan & personal use: free. Commercial use: not allowed without permission.**

This is source-available for fans and individuals — not MIT, not OSI open source, not public domain.

**You can**

- use it to make art for yourself
- learn, fork, and modify it for hobby projects
- share your generated images non-commercially
- post personal creations to social media

**You cannot** (without a separate commercial license)

- sell prompt packs, courses, subscriptions, or SaaS built on this repo
- use it in client work or a for-profit production pipeline
- remove copyright or attribution when redistributing

The images and prompts you generate are yours to enjoy; you're responsible for how you use them. You may not resell bulk prompt libraries compiled from the shipped seeds and plans.

Full terms: [`LICENSE`](LICENSE) · Chinese reference: [`LICENSE.zh-TW.md`](LICENSE.zh-TW.md)

Commercial licensing: open an issue.

---

## Contribute

Issues welcome. Documentation improvements welcome. Non-commercial pull requests welcome.

Please don't edit files in `prompts/source/` directly — report problems to `output/reports/` instead. Contributions are governed by Section 6 of the license.

---

## Go deeper

- [AI workflow guide](docs/guides/ai-workflow.md)
- [Implementation status](docs/architecture/implementation-status.md)
- [Publish rules](docs/rules/publish.md) · [發佈規則](docs/rules/publish.zh-TW.md) — share a `variants/` batch via git
- [Design philosophy](docs/context/philosophy/)

---

*Made by [Licca Bobo](https://gitlab.com/bobo-ai/prompt-universe). For people who want their prompts to last.*