# Engineering Review Calibration

The purpose of this document is to calibrate engineering judgment.

These examples are not intended to be copied.

They illustrate how experienced engineers reason about engineering work, distinguish strong reviews from weak reviews, and prioritize engineering observations.

The objective is consistent engineering thinking rather than consistent wording.

---

# Calibration 1 — Strong Engineering Review

## Executive Summary

The repository is actively evolving toward a knowledge-driven execution engine.

Recent work has focused on separating execution behavior from engineering knowledge, reducing coupling while improving extensibility.

Overall engineering direction is strong.

## Positive Observations

- The execution engine no longer contains task-specific business logic.
- Runtime providers have clearly defined responsibilities.
- Knowledge artifacts are replacing hardcoded behavior.
- Public CLI execution now exercises the same execution path used by end users.

## Risks

- Runtime classification remains incomplete for first-party Engineering Lab repositories.
- Knowledge packages are still establishing long-term structure and consistency.
- Several engineering assumptions remain encoded within Runtime rather than knowledge.

## Engineering Decisions

The migration from task-specific implementations toward declarative knowledge packages is an architectural improvement.

Engineering behavior is becoming data-driven rather than implementation-driven.

This decision improves extensibility, reduces coupling, and aligns with long-term platform goals.

## Recommendations

1. Continue moving engineering knowledge out of executable code.
2. Improve Runtime project classification for first-party repositories.
3. Continue refining Repository Review before expanding the task library.

## Questions

- Which engineering assumptions still belong in Runtime?
- Which assumptions should become reusable knowledge artifacts?

---

# Calibration 2 — Weak Engineering Review

## Executive Summary

Looks good.

## Positive Observations

The repository is organized.

## Risks

There might be bugs.

## Recommendations

Commit your work.

Write tests.

Update documentation.

## Questions

None.

---

# Why This Review Is Weak

This review:

- repeats obvious information,
- provides little evidence,
- makes generic recommendations,
- offers no engineering insight,
- does not improve engineering understanding.

The reader learns nothing about the engineering decisions represented by the current work.

---

# Calibration 3 — Reporting vs Engineering

## Context

The Runtime currently classifies the repository as:

```
unknown
```

## Reporting

The project type is unknown.

## Engineering

The Runtime currently lacks first-party repository classification.

Improving Runtime classification would benefit every downstream engineering capability that depends upon project identification.

---

# Why Engineering Is Better

Reporting restates facts.

Engineering explains:

- why the observation exists,
- where it originates,
- how improving the underlying system benefits future engineering work.

---

# Calibration 4 — Weak Recommendation

## Observation

The repository contains several untracked files.

## Recommendation

Commit your work.

---

# Better Recommendation

The repository appears to represent an active engineering session.

No evidence currently suggests the work is complete.

Continue implementation until a coherent engineering milestone has been reached before recommending a commit.

---

# Why This Is Better

Engineering recommendations should respond to engineering evidence.

Repository state alone should not drive workflow recommendations.

---

# Calibration 5 — Local Optimization vs Platform Improvement

## Local Recommendation

Rename this function.

## Platform Recommendation

Clarify the responsibility represented by this function.

If similar naming ambiguity appears elsewhere in the Runtime, consider introducing a naming convention that improves consistency across the platform.

---

# Why This Is Better

Good engineers solve today's problem.

Great engineers improve the system that created today's problem.

Engineering Lab should encourage platform thinking whenever evidence supports it.

---

# Calibration 6 — Engineering Confidence

## Weak

This implementation is incorrect.

## Better

The available engineering context does not provide sufficient evidence to determine whether this implementation is correct.

Additional information that would improve confidence:

- surrounding architecture,
- intended responsibility,
- engineering constraints.

---

# Why This Is Better

Engineering confidence should always match available evidence.

When uncertainty exists, identify it.

Do not replace missing evidence with speculation.