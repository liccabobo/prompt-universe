# Prompt Output Format Rules

## Purpose

This file defines mandatory formatting rules for compiled prompt markdown files.

These rules apply to final prompt output produced by the compiler, generated variants, and future promotion candidates. Existing curated source prompts are immutable and audit-only. These rules do not apply to Lisp source files, context articles, method notes, reports, or logs.

## File Naming

Compiled prompt markdown files must use uppercase English kebab-case:

```text
HOLO-NAILS.md
STRAWBERRY-JELLY.md
CYBER-FAIRY-RED-HOOD.md
GOLDEN-MANGO-JELLY.md
```

Repository folders and non-prompt documents must use lowercase English kebab-case:

```text
prompts/source/
docs/context/
docs/methods/
docs/rules/
noise-reduction-ladder.md
prompt-output-format.md
```

Only final prompt markdown files use uppercase filenames. Lisp files, context articles, methods, rules, reports, logs, and folder names use lowercase English kebab-case.

## Section Format

Final prompt output must use uppercase section headings.

Examples:

```text
TITLE:
SUBTITLE:
COLOR THEME:
PRIMARY:
SECONDARY:
COMPOSITION:
CAMERA:
LIGHTING:
NEGATIVE:
```

Section content should be compact and continuous. Avoid unnecessary blank lines inside a section.

Preferred:

```text
COLOR THEME:
{{soft strawberry pink, warm ivory, dusty mint green, deep berry red}}
```

Avoid:

```text
COLOR THEME:

{{soft strawberry pink, warm ivory}}

{{dusty mint green, deep berry red}}
```

## Text Case

Section headings are uppercase.

Section content should generally be lowercase, compact, and prompt-like, except when preserving:

- brand names
- titles
- subtitles
- issue names
- proper nouns
- model/tool-specific tokens
- explicit typography text intended to appear in the image

Examples:

```text
TITLE:
{{Licca Bobo}}

SUBTITLE:
{{Fresh Strawberry Jelly}}

PRIMARY:
2d anime prop illustration, anime collectible item artwork, high silhouette readability
```

## Replaceable Parameters

Use `{{...}}` for replaceable parameters.

`{{...}}` means another user can replace the value while keeping the same prompt structure.

Examples:

```text
TITLE:
{{Licca Bobo}}

SUBTITLE:
{{Fresh Strawberry Jelly}}

OBJECT DESIGN:
{{strawberry fragments only suspended inside fresh strawberry jelly}}
```

AI must decide which fields should be wrapped in `{{}}` by identifying which values are intended to be reusable variables across a prompt series.

## Fixed Vs Replaceable Content

For prompt series, distinguish fixed structure from replaceable parameters.

Common replaceable parameters:

- title
- subtitle
- product name
- issue name
- flavor
- character identity
- subject identity
- scene premise
- object design
- color theme
- accessory set
- outfit design
- food collection
- collectible display

Common fixed or mostly fixed sections:

- rendering language
- quality rules
- method rules
- negative constraints
- anatomy constraints
- anti-3d constraints
- anti-photography constraints
- validator boundaries
- series-level composition logic

This distinction should map cleanly to Lisp fields and expansion axes.

## Lisp And Macro Design

Replaceable prompt parameters should be represented in Lisp before compilation.

Recommended direction:

```lisp
(defprompt strawberry-jelly
  (:title (param "Licca Bobo"))
  (:subtitle (param "Fresh Strawberry Jelly"))
  (:object-design (param "strawberry fragments only suspended inside fresh strawberry jelly"))
  (:primary anime-prop-base)
  (:negative no-3d no-photography))
```

The compiler should render `(param "...")` as `{{...}}` in final prompt markdown.

Macro expansion must preserve parameter boundaries. A macro must not flatten replaceable parameters into ordinary prompt text unless the user explicitly asks for a fixed, non-template prompt.

## Series Logic

In a series, AI should identify:

- which sections stay stable across the series
- which sections become `{{}}` parameters
- which parameters become expansion axes
- which constraints must remain fixed

Example:

```lisp
(defexpansion-plan dessert-props-1000
  (:source strawberry-jelly-approved-v1)
  (:axes
   (:flavor 25)
   (:palette 10)
   (:garnish 4))
  (:fixed
   :anime-illustration-priority
   :prop-readability
   :negative-boundary))
```

The compiler should keep replaceable axes visible as `{{}}` when producing reusable prompt templates.
