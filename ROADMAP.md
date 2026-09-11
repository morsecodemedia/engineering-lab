# Engineering Lab Product Roadmap

Engineering Lab is evolving into a Knowledge-Driven Engineering Platform.

Rather than embedding engineering expertise into executable software, Engineering Lab captures engineering knowledge as version-controlled artifacts executed through a deterministic platform.

The long-term objective is to continuously improve engineering capability by evolving knowledge rather than increasing software complexity.

Knowledge should outlive implementation.

> Engineering Lab should understand everything the engineer already knows before asking the engineer to explain it again.

---

# Product Maturity

Engineering Lab is organized around several parallel product tracks.

Each track represents an area of the platform that matures independently while contributing to the overall product.

Tracks intentionally evolve in parallel rather than sequential phases.

---

# Foundation

Status

✅ Stable

Goal

Provide a stable execution platform that rarely changes.

The platform should become increasingly boring.

New engineering capabilities should primarily require authoring knowledge rather than modifying platform software.

Current Scope

- Runtime
- Runtime Providers
- Evidence
- Renderers
- Knowledge Composer
- Knowledge Packages
- Knowledge Validation
- Local Inference
- Product Identity
- Public CLI

Future Improvements

- Conversation Runtime
- Evidence v2
- Interpreter abstraction
- Platform bootstrap refinement
- Structured JSON output contracts
- Runtime simplification

Success Criteria

- Platform architecture remains stable.
- Platform subsystems maintain clear ownership.
- Engineering knowledge evolves independently of execution.
- New capabilities require little or no platform work.

---

# Engineering Capabilities

Status

🚧 Active

Goal

Teach Engineering Lab how experienced engineers think.

Engineering capabilities are the primary value delivered by the platform.

Current Domains

```text
Repository
    review
    summarize
    architect
    onboard

Technology
    explain
    compare
    recommend
    troubleshoot
    brainstorm

Code
    review
    summarize
    explain
    refactor
    optimize

Architecture
    assess

Planning
    implementation
    migration
    execution

Security
    audit

Accessibility
    audit

Documentation

Writing
```

Success Criteria

Every new engineering capability should primarily require authoring a Knowledge Package rather than modifying platform software.

---

# Engineering Workflows

Status

🚧 Active

Goal

Compose individual engineering capabilities into complete engineering workflows.

Engineering Lab should become an engineering teammate rather than a collection of isolated commands.

Example Workflows

Repository Review

```text
Repository Review
        ↓
Implementation Plan
        ↓
Coding Agent
        ↓
Repository Review
```

Architecture Planning

```text
Architecture Assessment
        ↓
Migration Plan
        ↓
Execution Tasks
```

Technology Evaluation

```text
Technology Recommendation
        ↓
Implementation Plan
        ↓
Repository Review
```

Future Workflows

- Architecture Review
- Refactoring Workflow
- Security Review
- Accessibility Review
- Documentation Workflow

Success Criteria

Engineering Lab assists throughout the complete engineering lifecycle instead of solving isolated engineering problems.

---

# Knowledge Authoring

Status

🚧 Active

Goal

Provide an excellent authoring experience for Engineering Knowledge.

Engineering Lab should become an IDE for Engineering Knowledge.

Current Commands

```text
Knowledge

    info
    validate
```

Planned Commands

```text
Knowledge

    doctor
    scaffold
    lint
    metrics
```

Future Improvements

- Knowledge templates
- Package scaffolding
- Knowledge quality metrics
- Behavioral regression testing
- Package dependency visualization

Success Criteria

Authoring new engineering capabilities becomes a guided workflow rather than a manual process.

---

# Flagship Capability

Status

📋 Planned

## Planning.Implementation

Purpose

Transform engineering understanding into executable implementation artifacts suitable for another engineer or coding agent.

Inputs

- Repository Review
- Engineering Goals
- User Constraints
- Additional Engineering Context

Outputs

```text
PLAN.md

TASKS.md

RISKS.md

QUESTIONS.md
```

Consumers

- Codex
- Qwen Coder
- Claude Code
- Human Engineers

Long-Term Goal

Engineering Lab should prepare another engineer to execute complex engineering work without requiring additional architectural interpretation.

This capability represents the primary differentiator of Engineering Lab.

---

# Adaptive Intelligence

Status

📋 Planned

Goal

Continuously improve engineering reasoning while keeping platform complexity low.

Future Areas

- AI Policy Engine
- Provider Selection
- Model Selection
- Confidence Scoring
- Cost Awareness
- Multi-model execution
- Conversation Runtime
- Evidence v2

Success Criteria

Engineering Lab automatically selects the most appropriate reasoning strategy based upon the engineering problem.

---

# Product Integration (MCU)

Status

📋 Planned

Goal

Integrate Engineering Lab into the larger MCU ecosystem.

Areas

- Product Identity
- Registration
- Discovery
- Installation
- Updates
- Versioning

Ownership

Most Product Integration work belongs within Workstation.

Engineering Lab should behave as a registered MCU product rather than implementing its own installation lifecycle.

---

# Ideas Parking Lot

These ideas intentionally remain outside the current roadmap.

They should continue being explored but should not compete with current product priorities.

Potential MCU Products

- Neuro Lab
- Research Lab
- Writing Lab
- Image Lab
- Strategy Lab
- Financial Lab

Platform Ideas

- Engineering Memory
- Mission
- Knowledge Metrics
- Reasoning Patterns
- Conversation Runtime
- Evidence v2
- Engineering Missions

These ideas should graduate into the roadmap only when a real engineering workflow demonstrates their value.

---

# Long-Term Vision

Engineering Lab is not intended to become another AI assistant.

Engineering Lab is intended to become an Engineering Knowledge Platform.

The platform should capture, validate, execute, and continuously improve engineering expertise.

Execution should remain deterministic.

Knowledge should remain version-controlled.

Engineering capabilities should become increasingly reusable.

The execution platform should remain stable while engineering knowledge continuously evolves.

Software executes.

Knowledge teaches.

Engineers improve.

## Engineering Runtime

Status

Planned

Objective

Replace one-shot inference with a persistent engineering runtime.

Background

The current REPL prototype demonstrated that launching a new
`llama-cli` process for every prompt reloads the model,
reinitializes the conversation, and prevents Engineering Lab
from behaving as a persistent engineering teammate.

Success Criteria

- Persistent model lifetime
- Persistent conversation
- Runtime-owned session loop
- Capability invocation during conversation
- Foundation for MCP integration

Capability Phases

Goal

Allow capabilities to execute across multiple
conversation turns.

Example

planning.implementation

    Discovery

    ↓

    Planning

    ↓

    Complete

The runtime owns capability progression.

The language model does not.