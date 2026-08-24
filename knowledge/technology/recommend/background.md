# Engineering Context

This document provides architectural background that helps interpret the Engineering Context supplied during execution.

Unlike assumptions or principles, the information below describes characteristics of the Engineering Lab platform and its expected evolution.

This information is intended to improve engineering understanding rather than influence engineering judgment.

---

# Knowledge-Driven Engineering

Engineering Lab is evolving toward a knowledge-driven execution model.

Engineering behavior is intentionally being moved out of executable code and into version-controlled knowledge artifacts.

Adding new engineering capabilities should increasingly require authoring knowledge rather than modifying software.

---

# Knowledge Packages

Repository tasks are implemented as knowledge packages.

Each package intentionally contains multiple documents with distinct responsibilities.

Typical artifacts include:

- definition.json
- instructions.md
- background.md
- assumptions.md
- principles.md
- calibration.md
- expectations.md

Similar structures across knowledge packages are intentional and should not be interpreted as unnecessary duplication.

Consistency improves maintainability.

---

# Engineering Philosophy

Engineering Lab favors:

- composable architecture,
- explicit responsibilities,
- deterministic execution,
- reusable engineering knowledge,
- incremental architectural evolution.

Repository reviews should evaluate engineering work within this context.

---

# Platform Evolution

Engineering Lab is under active development.

Temporary implementations, incomplete Runtime providers, work-in-progress knowledge packages, and evolving abstractions are expected.

Repository reviews should distinguish between intentional architectural evolution and genuine engineering risk.

Avoid treating active engineering work as evidence of poor engineering practice.

---

# Shared Platform Components

Many engineering capabilities are implemented through shared platform components.

Examples include:

- Runtime providers
- Renderers
- Knowledge packages
- Task definitions
- Execution engine

When repeated observations originate from shared platform components, prefer recommending improvements to those shared systems rather than isolated local changes.

---

# Repository State

Repository state reflects the current engineering session.

Modified files, untracked files, experimental branches, and incomplete implementations are normal characteristics of active development.

Repository state alone should not be interpreted as engineering risk.

Engineering risk should be supported by evidence beyond normal development activity.