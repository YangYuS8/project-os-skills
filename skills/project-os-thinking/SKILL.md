# Project OS Thinking

## Purpose

Use this skill to help an AI agent think about a software project as a complete product-engineering operating system, not just a set of code files.

This skill is especially useful when the user is starting a new project, designing a major feature, reviewing an existing project, or asking for a long-term development strategy.

## When to use

Use this skill when the user is:

- starting a new software project
- turning a rough idea into a product
- designing a major feature or module
- reviewing a project architecture or development philosophy
- asking an agent to help build a maintainable system
- asking why a project feels well-designed
- asking how to generalize a development methodology

Do not use this skill for tiny one-off edits unless the user explicitly asks for project-level thinking.

## Core philosophy

Do not jump directly into coding.

First clarify:

1. Who is the user?
2. What job is the user hiring this product to do?
3. What is the real pain, not only the surface request?
4. What is the project’s moat?
5. What knowledge should become reusable rules, recipes, workflows, or database records?
6. Which parts must be hidden from ordinary users?
7. What technical decisions need ADR records?
8. What operational, testing, and postmortem documents must exist?

## Required output

When using this skill, produce a project-specific review with these sections:

1. Product positioning
2. Target users and JTBD
3. Core workflow
4. Moat analysis
5. Knowledge and rule system
6. System architecture
7. Key ADR candidates
8. Engineering boundaries
9. Security and permission model
10. Deployment and Runbook plan
11. QA checklist
12. Postmortem and knowledge-base plan
13. Immediate next actions

## Rules

- Treat code as only one layer of the system.
- Prefer concrete project-specific decisions over generic templates.
- Ask targeted questions when missing information would change the design.
- Do not fill unknowns with vague assumptions.
- For AI products, distinguish public model capability from private product know-how.
- Identify which parts of the system are replaceable, defensible, operational, or risky.
- Convert repeated experience into reusable rules, checklists, templates, or knowledge base entries.
- Avoid unnecessary complexity. A simple system with clear boundaries is better than a fashionable architecture with unclear ownership.

## Moat analysis checklist

For each project, identify:

- Public capabilities: things competitors can easily access.
- Replaceable components: models, APIs, databases, frameworks, vendors.
- Hidden know-how: rules, prompts, workflows, recipes, scoring, data, domain experience.
- Integration moat: value created by combining tools into one workflow.
- Operational moat: faster updating, safer deployment, better support, lower friction.
- Feedback loop: how user results, failures, and incidents improve the system.

## Output style

Be direct and concrete.

Prefer:

```text
This project’s moat is not the model API. It is the rule layer that converts vague user intent into structured workflows.
```

Avoid:

```text
This project should create synergy through an innovative AI-powered platform.
```

## Final check

Before finishing, verify:

- Did we explain why this project should exist?
- Did we identify what should not be exposed to users?
- Did we separate product, architecture, engineering, operations, QA, and knowledge capture?
- Did we produce actionable next steps?
