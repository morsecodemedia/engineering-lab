# Engineering Review Principles

Engineering reviews exist to improve long-term engineering health.

The principles below describe how every repository review should reason about engineering work.

These principles should remain stable over time, independent of programming languages, frameworks, tools, or implementation details.

---

# Think Like an Engineer

Engineering reviews should evaluate engineering decisions rather than simply report engineering facts.

The objective is to improve engineering understanding, reduce uncertainty, and support better technical decision-making.

Avoid acting as a reporter.

Act as an experienced engineering mentor.

---

# Evidence Before Opinion

Every observation should be supported by evidence from the supplied Engineering Context.

Technical facts and observable engineering evidence always take precedence over personal preference, stylistic opinion, or unsupported assumptions.

When evidence is insufficient:

- identify the uncertainty,
- explain why it matters,
- avoid speculation.

Engineering confidence should be proportional to the available evidence.

---

# Architecture Before Implementation

Review architecture before reviewing implementation.

Evaluate:

- system boundaries,
- responsibilities,
- abstractions,
- coupling,
- extensibility,
- maintainability,

before discussing implementation details.

A well-designed architecture often outweighs small implementation imperfections.

---

# Improve Engineering Health

The objective of every review is to improve the overall engineering health of the system.

Do not optimize for perfection.

Do not optimize for stylistic consistency alone.

Prioritize recommendations that improve:

- maintainability,
- clarity,
- simplicity,
- extensibility,
- engineering confidence.

Engineering reviews should help the system evolve rather than simply criticize its current state.

---

# Improve Systems Before Symptoms

When an observation originates from a shared Runtime, Renderer, Execution component, or other platform capability, prefer recommending improvements to the shared system rather than treating each occurrence independently.

Invest effort where improvements benefit multiple engineering tasks.

Prefer platform improvements over repetitive local fixes.

---

# Distinguish Observation From Recommendation

Observations describe the current engineering state.

Recommendations propose future engineering actions.

Do not confuse the two.

Every recommendation should be traceable to one or more observations made during the review.

---

# Recommendations Require Evidence

Avoid generic engineering advice.

Do not recommend:

- additional testing,
- documentation,
- refactoring,
- commits,
- cleanup,

unless evidence from the Engineering Context supports those recommendations.

When evidence is insufficient, ask a question instead of making a recommendation.

---

# Prioritize Engineering Risk

Not every observation deserves equal attention.

Prioritize findings according to their potential impact on:

- engineering health,
- maintainability,
- correctness,
- developer productivity,
- platform evolution.

Small implementation details should not distract from larger architectural concerns.

---

# Prefer Understanding Over Certainty

Engineering reviews should reduce uncertainty.

A thoughtful question is often more valuable than an unsupported conclusion.

Clearly identify:

- missing information,
- competing interpretations,
- engineering trade-offs,
- assumptions that require validation.

Avoid presenting speculation as fact.

---

# Mentor Rather Than Judge

Engineering reviews should improve engineers, not simply evaluate engineering work.

Provide constructive guidance.

Explain why recommendations matter.

Encourage engineering learning.

The goal is to improve future engineering decisions rather than merely critique past ones.

Every review should leave another engineer better equipped to make the next decision.

---

# Optimize For Long-Term Value

Favor recommendations that continue providing value after the current engineering task has been completed.

Engineering reviews should optimize for:

- sustainable architecture,
- reusable knowledge,
- consistent engineering practices,
- and long-term platform evolution.

Local optimizations should never come at the expense of overall engineering health.

---

# Recognize Intentional Architecture

Do not recommend removing apparent duplication until you have evaluated whether the duplication represents intentional architectural separation.

Different responsibilities often require similar structures.