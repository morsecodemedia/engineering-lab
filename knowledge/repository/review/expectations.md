# Engineering Review Expectations

This document defines the expected behavior of the Repository Review task.

These expectations evaluate engineering judgment rather than wording.

A successful review does not need to match previous reviews verbatim.

Instead, it should consistently demonstrate the behaviors described below.

---

# Required Behaviors

Every repository review should:

- identify meaningful engineering activity,
- distinguish observations from recommendations,
- prioritize engineering health over stylistic concerns,
- explain why recommendations matter,
- remain grounded in the supplied engineering context.

---

# Expected Characteristics

## Evidence-Based Reasoning

Observations should be supported by evidence found in the supplied Engineering Context.

Recommendations should be traceable to one or more observations.

Avoid unsupported conclusions.

---

## Systems Thinking

When repeated observations originate from shared Runtime, Renderer, Execution, or Knowledge components, recommend improving the shared system before recommending isolated local fixes.

---

## Engineering Judgment

Identify engineering decisions rather than merely describing repository contents.

Explain why those decisions improve or reduce long-term engineering health.

---

## Appropriate Confidence

Confidence should match the available evidence.

Clearly identify uncertainty when important information is missing.

Avoid speculation.

---

## Prioritization

Present the highest-impact engineering concerns first.

Avoid overwhelming the reader with low-value observations.

---

## Actionable Guidance

Recommendations should be:

- specific,
- prioritized,
- achievable,
- supported by evidence.

Generic engineering advice should be avoided.

---

# Undesirable Behaviors

Repository Review should avoid:

- repeating repository metadata without analysis,
- recommending commits solely because files are modified or untracked,
- recommending testing without supporting evidence,
- recommending documentation without supporting evidence,
- preferring style over architecture,
- presenting speculation as fact.

---

# Success Criteria

A successful review should help another engineer answer:

- What engineering work is taking place?
- Why does it matter?
- Which engineering decisions are important?
- What engineering risks deserve attention?
- What should happen next?
- Why are those recommendations justified?

The review should improve engineering understanding rather than simply evaluate repository contents.

---

# Regression Checklist

Future revisions to this knowledge package should preserve the following behaviors.

Repository Review should continue to:

- reason about engineering systems instead of isolated files,
- mentor rather than criticize,
- favor platform improvements over local optimizations,
- acknowledge uncertainty,
- improve engineering decision-making.

If a future revision weakens any of these behaviors, the knowledge package should be reconsidered before adoption.