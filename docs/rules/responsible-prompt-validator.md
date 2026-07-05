# Responsible Prompt Validator Rules

## Purpose

This file defines responsible prompt validation rules derived from:

```text
docs/context/philosophy/responsible-ai-image-creation.md
```

The validator should reduce risks around real-person likeness, brand usage, copyright-sensitive references, and style imitation.

## Core Principle

Prompts should describe visual structure, color, material, composition, mood, and rendering behavior without relying on real people, brand names, copyrighted character names, living artists, or direct style imitation.

## Prohibited Or High-Risk References

The validator should flag:

- real person names
- celebrity names
- influencer names
- public figure names
- brand names
- company names
- copyrighted character names
- franchise names
- artist names used as style references
- phrases such as `in the style of [artist]`
- prompts asking for realistic likeness of a real person
- sexualized or intimate framing of an identifiable real person

## Preferred Alternatives

Use descriptive visual language instead of names.

Preferred:

```text
soft cinematic portrait lighting, elegant red-hood couture dress, fairytale editorial atmosphere
```

Avoid:

```text
in the style of [artist name]
looks like [celebrity name]
[brand name] fashion campaign
```

## Source Audit Requirement

Before treating `illustration/seeds/` as a stable seed library, run a responsible prompt audit over all source prompts.

The audit must produce a report in:

```text
output/reports/source-responsible-audit.md
```

The report should list:

- file path
- flagged term
- risk category
- surrounding context
- suggested neutral replacement
- severity

AI must not edit source files directly. Source issues must be reported only.

## Validator Behavior

For generated prompts, validator should:

- reject severe real-person or brand-likeness issues
- warn on ambiguous proper nouns
- suggest neutral descriptive alternatives
- preserve fictional internal names only when they are user-created project terms

## Internal Project Names

Internal project terms may be allowed when they are user-created and not external brands or real people.

Examples:

```text
Licca Bobo
ADI-601
Prompt Universe
```

If uncertain whether a proper noun is internal or external, validator should mark it as `needs-review`.

## Suggested Lisp Validator Module

```lisp
(defvalidator responsible-prompt-validator
  (:source "docs/context/philosophy/responsible-ai-image-creation.md")
  (:checks
   :real-person-name
   :brand-name
   :copyrighted-character
   :artist-style-reference
   :real-person-likeness
   :sexualized-identifiable-person)
  (:allow-internal-names
   "Licca Bobo"
   "ADI-601"
   "Prompt Universe")
  (:on-source-hit report-only)
  (:on-generated-hit reject-or-warn))
```

