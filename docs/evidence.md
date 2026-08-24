# Evidence

## Purpose

Evidence represents the information that an engineering task reasons about.

Evidence is independent of:

- Runtime implementation
- Knowledge Packages
- Inference providers
- Execution engines

Tasks do not reason directly over Runtime providers.

Tasks reason over Evidence.

---

## Responsibilities

The Evidence subsystem is responsible for collecting information required to perform an engineering task.

Evidence providers expose engineering information through a stable contract regardless of how that information is collected.

Evidence does **not**:

- discover engineering facts,
- transform representations,
- compose documents,
- perform inference.

Those responsibilities belong to other platform subsystems.

---

## Architecture

Engineering Lab currently consists of six major subsystems.

```text
Runtime
    discovers facts

↓

Renderers
    transform representations

↓

Evidence
    collects reasoning material

↓

Composers
    assemble knowledge packages

↓

Inference
    performs reasoning

↓

Interpreters
    normalize responses
```

Each subsystem owns exactly one responsibility.

---

## Evidence Contract

Every Evidence provider returns an `evidence/v1` document.

Example:

```json
{
  "schema": "evidence/v1",

  "id": "engineering.context",

  "type": "markdown",

  "producer": "runtime.context",

  "content": "..."
}
```

### Fields

| Field | Description |
|--------|-------------|
| schema | Evidence schema version |
| id | Globally unique evidence identifier |
| type | Representation type |
| producer | Component that generated the evidence |
| content | Evidence payload |

---

## Current Evidence Providers

### engineering.context

Produces engineering context assembled from:

- Project Runtime
- Git Runtime
- Changes Runtime

Current representation:

- Markdown

Producer:

- runtime.context

---

### engineering.question

Produces an engineering question supplied by the caller.

Current representation:

- Plain text

Producer:

- stdin

---

## Evidence Lifecycle

```text
Runtime
        ↓
Evidence Provider
        ↓
Evidence Contract
        ↓
Knowledge Composer
        ↓
Inference
```

Evidence is immutable.

Evidence should be reusable.

Evidence should not depend upon task implementations.

---

## Design Principles

Evidence should answer one question:

> What information should this task reason about?

Evidence should never answer:

> How should the task reason?

Reasoning belongs to Knowledge Packages.

---

## Future Evolution

Evidence currently exposes rendered content.

Future revisions may separate engineering facts from rendered representations.

Possible future contract:

```json
{
  "schema": "evidence/v2",

  "id": "engineering.context",

  "payload": { ... }
}
```

The current `evidence/v1` contract intentionally favors simplicity while the Knowledge Execution Engine continues to evolve.

Evolution should preserve backward compatibility whenever practical.