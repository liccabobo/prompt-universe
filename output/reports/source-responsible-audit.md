# Source Responsible Audit

## Scope

Audited directory:

```text
prompts/source/
```

Reference rule:

```text
docs/rules/responsible-prompt-validator.md
```

This is an initial text scan, not a complete validator implementation.

## Summary

- Severe real-person likeness issues: none found in this initial scan.
- Direct celebrity/public figure names: none found in this initial scan.
- Direct external brand names: none found in this initial scan.
- Direct living artist style references: none found in this initial scan.
- Needs-review public-domain / franchise-overlap terms: found.
- Generic false positives: found.

## Findings

### Needs Review: Public-Domain / Franchise-Overlap Terms

File:

```text
prompts/source/story-illustration/SNOW-WHITE.md
```

Flagged term:

```text
Snow White
```

Risk category:

```text
public-domain-name-with-commercial-franchise-overlap
```

Severity:

```text
needs-review
```

Notes:

The phrase can refer to a public-domain fairytale figure, but it also has strong commercial franchise associations. The prompt appears to use fairytale motifs rather than direct franchise branding. Keep under review.

Suggested neutral alternative:

```text
fairest princess, mirror fairytale princess, enchanted apple princess
```

---

File:

```text
prompts/source/character-design/ALICE.md
```

Flagged term:

```text
Wonderland
```

Risk category:

```text
public-domain-name-with-commercial-franchise-overlap
```

Severity:

```text
needs-review
```

Notes:

The phrase can refer to a public-domain literary setting, but it also has commercial adaptation associations. The prompt appears to use broad surreal fairytale imagery rather than direct franchise branding. Keep under review.

Suggested neutral alternative:

```text
dreamland, surreal rabbit-hole realm, logic-dissolving fairytale world
```

### Low Risk: Cultural Or Regional Style Descriptors

File:

```text
prompts/source/evolution-strategy/AFTERNOON-TEA.md
```

Flagged terms:

```text
Korean-inspired
French-Korean
```

Risk category:

```text
cultural-style-descriptor
```

Severity:

```text
low
```

Notes:

These are broad cultural or regional styling descriptors, not person names or brand names. No action required unless the project later chooses to avoid national or regional style descriptors.

### False Positive: Generic Artist Language

File:

```text
prompts/source/prop-design/GOLDEN-MANGO-JELLY.md
```

Flagged term:

```text
visible artist brush decisions
```

Risk category:

```text
generic-art-process-language
```

Severity:

```text
false-positive
```

Notes:

This does not name a specific artist or style. No action required.

## Recommended Validator Additions

Add checks for:

- real person names
- celebrity names
- public figure names
- external brand names
- franchise names
- copyrighted character names
- living artist names
- `in the style of ...`
- public-domain names with strong franchise overlap
- internal project allowlist terms

Suggested internal allowlist:

```text
Licca Bobo
ADI-601
Prompt Universe
```

## Source Protection

No source files were modified.

Per `docs/rules/source-seed-protection.md`, all findings are report-only.

