# Variant Expansion Axes

## Purpose

Define how controlled prompt variants should diverge from a canonical prototype. Variants must feel creatively distinct, not like minor palette tweaks on the same scene.

This file governs `defexpansion-plan`, `batch-generate`, and AI-authored mutation sets.

## Core Principle

A variant changes **semantic premise**, not only rendering adjectives.

Minimum creative distance per variant:

1. **Palette shift** — color direction is visibly different.
2. **Theme-anchor shift** — the scene premise category changes at the same abstraction level.
3. **Accessory shift** — symbolic props / garnish / support objects re-theme to match the new anchor.

Optional but encouraged:

4. **Scene-shell shift** — background and secondary environment reframed for the new anchor.
5. **Outfit shift** — costume logic adapts to the new anchor while preserving character identity locks.
6. **Evolution narrative shift** — fusion / evolution strategy rewritten for the new shape language.

## Generic Axis Definitions

| Axis | Meaning | Typical mutation keys |
|------|---------|------------------------|
| `:color-theme` | Palette and light-color direction | `:color-theme`, `:lighting` |
| `:theme-anchor` | Core premise category of the spell | `:secondary`, `:background`, `:evolution-strategy`, `:object-design`, `:flavor`, `:story-background` |
| `:accessory-set` | Prop cluster, symbols, garnish | `:thematic-symbol`, `:accessory-design`, `:top-garnish` |
| `:scene-shell` | Enclosure / environment readability | `:background`, `:secondary` |
| `:outfit-design` | Costume or surface styling | `:outfit-design` |
| `:action` | Pose relation to new props | `:action` |
| `:composition` | Layout emphasizing new anchor geometry | `:composition` |

Axis names are semantic, not literal nouns. `:theme-anchor` does not mean “vehicle only”. It means:

- character editorial → enclosed transit shell, architecture chamber, ritual space, workshop, sanctuary, stage frame, etc.
- prop design → dessert type, flavor family, object identity, material story, etc.
- story illustration → scene premise, symbolic location, narrative hook, etc.

## Swap Rule (same abstraction level)

When replacing a theme anchor, swap within the **same abstraction layer**:

```text
enclosed transit shell  -> another enclosed transit shell
dessert prop identity   -> another dessert prop identity
ritual chamber          -> another ritual chamber
editorial poster field  -> another poster field with similar negative-space role
```

Do **not** confuse abstraction layers:

```text
bad: submarine -> random floating flower close-up
bad: mango jelly -> realistic portrait studio
good: submarine -> steam airship gondola
good: mango jelly -> wild cherry jelly
good: tea-party courtyard -> moonlit jade sanctuary
```

## Preserve / Mutate / Forbid

### Usually preserve

- title / subtitle locks requested by user
- character identity anchors (face, hair, anatomy) unless the request explicitly opens them
- rendering language (`PRIMARY`, anti-3d / anti-photo constraints)
- denoise ladder and negative-space method boundaries
- evolution strategy **class** (graphic fusion, not body mutation)

### Usually mutate

- `:color-theme`
- theme-anchor sections
- accessory / symbol sections
- outfit logic tied to the new anchor
- background / secondary shell
- evolution strategy **wording** to match the new geometry language

### Usually forbid

- identity drift into photorealism or 3D
- body mutation / liquid anatomy
- clutter that breaks negative-space guidance
- accessory piles that ignore the new anchor

## Expansion Plan Requirements

Every `defexpansion-plan` should declare:

```lisp
(:variant-axes
 (:required :color-theme :theme-anchor :accessory-set)
 (:recommended :scene-shell :outfit-design :evolution-strategy)
 (:theme-anchor-keys :secondary :background :evolution-strategy :object-design :flavor)
 (:accessory-keys :thematic-symbol :accessory-design :top-garnish))
```

If omitted, the compiler uses defaults from `*default-variant-axis-spec*`.

Each mutation group must satisfy all `:required` axes. `batch-generate` rejects plans that fail validation.

## AI Authoring Checklist

Before writing `:mutations`:

1. Identify the prototype's current theme anchor in one phrase.
2. Propose N anchors at the same abstraction layer.
3. For each variant, rewrite palette + accessories + shell + outfit + evolution wording as one coherent package.
4. Keep hair / face / title / subtitle / anatomy locks unless the user opened them.
5. Ensure no two variants share the same palette direction and anchor noun cluster.

## Example Pattern (character editorial)

Prototype anchor: `steampunk enclosed transit shell`

Variant anchors:

- steam airship gondola
- brass locomotive cab
- clockwork orbital lift capsule
- velvet night-tram booth

Each variant should read as a new editorial poster premise, not the same cabin with recolored gauges.