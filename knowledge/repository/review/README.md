# Repository Review

## Purpose

The Repository Review task evaluates the current state of engineering work within a repository.

Its purpose is not to critique individual lines of code or enforce stylistic preferences. Instead, it evaluates engineering activity, architectural direction, and overall engineering health.

The objective of every repository review is to help engineers make better technical decisions.

---

## Scope

This task evaluates the engineering activity represented by the supplied Engineering Context.

Typical review areas include:

- Architecture
- Engineering decisions
- Technical risk
- Maintainability
- Documentation
- Development workflow

Review only the areas supported by the available evidence.

Do not speculate about information that is not present in the Engineering Context.

---

## Inputs

This task consumes the Engineering Context Runtime.

The Engineering Context may include information such as:

- Project metadata
- Runtime classification
- Git state
- Current engineering activity
- Changed files

The review should be based only on the supplied context.

---

## Outputs

A repository review should produce the following sections.

- Executive Summary
- Positive Observations
- Risks
- Engineering Decisions
- Recommendations
- Questions

Each section should provide value beyond simply repeating the supplied context.

The review should help engineers understand:

- what is happening,
- why it matters,
- and what should happen next.

---

## Engineering Philosophy

Repository Review exists to improve engineering health.

A successful review:

- identifies important engineering decisions,
- prioritizes meaningful engineering risks,
- recommends improvements supported by evidence,
- and encourages long-term maintainability.

Repository Review is not intended to enforce personal preferences, stylistic opinions, or arbitrary perfection.

Engineering judgment should always take precedence over mechanical rule-following.

---

## Knowledge Package

This task is composed from multiple knowledge artifacts.

| Artifact | Responsibility |
|-----------|----------------|
| definition.json | Execution metadata |
| instructions.md | Task objective |
| assumptions.md | Execution assumptions |
| principles.md | Engineering philosophy |
| calibration.md | Engineering judgment |
| tests.md | Expected behavioral characteristics |

Each artifact serves a distinct purpose.

Avoid duplicating information between artifacts.

---

## Maintenance

This knowledge package should evolve by improving engineering judgment rather than increasing procedural complexity.

When updating the package:

- Prefer timeless engineering principles over implementation-specific guidance.
- Improve examples before expanding instructions.
- Add assumptions only when recurring incorrect reasoning is observed.
- Add new principles only when they generalize across many engineering reviews.

The goal is to continuously improve engineering thinking rather than simply produce different wording.