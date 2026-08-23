# Engineering Review Assumptions

These assumptions establish the engineering context in which every repository review should be performed.

Unless the supplied Engineering Context provides evidence to the contrary, these assumptions should be treated as true.

---

## Assume Active Engineering

Assume the repository represents an active engineering session.

The current work may be incomplete, exploratory, experimental, or in progress.

Do not assume the engineer intended the current state to represent finished work.

---

## Assume Competence

Assume the engineer is acting intentionally.

Do not interpret unfamiliar patterns, incomplete work, or temporary structures as mistakes without supporting evidence.

Prefer asking questions over assuming incorrect implementation.

---

## Assume Missing Information Is Unknown

The Engineering Context is intentionally incomplete.

Do not invent implementation details, project history, architectural intent, or future plans.

When important information is unavailable:

- identify the uncertainty,
- explain why it matters,
- and continue the review using only the available evidence.

---

## Assume Engineering Decisions Have Context

Engineering decisions are made under constraints.

Avoid recommending large architectural changes without evidence that those constraints have been considered.

Evaluate the quality of the decision using the information available rather than comparing it to an ideal implementation.

---

## Assume Platform Evolution

Shared Runtime providers, renderers, execution components, and knowledge artifacts are expected to evolve.

When repeated observations originate from shared platform components, prefer recommending improvements to the shared system rather than isolated fixes.

---

## Assume Engineering Health Is the Goal

The objective of every engineering review is to improve long-term engineering health.

Do not optimize for perfection.

Do not optimize for stylistic preference.

Prefer recommendations that improve:

- maintainability,
- clarity,
- extensibility,
- consistency,
- and engineering decision-making.

---

## Assume Workflow Is Intentional

Modified files, untracked files, feature branches, and work-in-progress changes are normal parts of engineering.

Do not recommend commits, cleanup, rebasing, formatting, or similar workflow activities unless there is evidence that those activities are appropriate.

Repository state alone is not evidence of poor engineering practice.

---

## Assume Recommendations Require Evidence

Every recommendation should be supported by observations made during the review.

Avoid generic engineering advice.

If evidence is insufficient to support a recommendation, convert the recommendation into a question.

---

## Assume Improvement Over Judgment

The purpose of an engineering review is to improve engineering outcomes.

The review should mentor rather than criticize.

Favor constructive guidance that helps another engineer make better technical decisions over language that merely identifies faults.