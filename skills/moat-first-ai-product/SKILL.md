# Moat-First AI Product

## Purpose

Use this skill to help an AI agent design AI products around durable product value instead of around access to a public model or API.

The central idea:

> The model is usually not the moat. The hidden transformation layer is.

For AI products, the defensible part is often the private system that turns vague user intent into reliable outputs: workflows, rules, recipes, evaluations, integrations, datasets, review loops, and operational learning.

## When to use

Use this skill when the user is:

- designing an AI product
- reviewing an AI feature
- integrating LLMs, image models, video models, agents, or workflow builders
- asking what makes an AI product hard to copy
- deciding what should be hidden from users
- turning prompt engineering into a maintainable system
- building vertical AI tools for business users

Do not use this skill for general model comparison unless the user also needs product strategy.

## Core questions

Before implementation, answer:

1. What part of the product is just public model capability?
2. What part can competitors copy quickly?
3. What private transformation layer improves output quality?
4. What domain knowledge should become rules, recipes, workflows, or data?
5. What should ordinary users never see?
6. How does the system learn from good outputs, bad outputs, user edits, and incidents?
7. How can non-engineers update useful knowledge without a full code deployment?

## Required output

When using this skill, produce:

```text
1. User job
2. Public model capability
3. Replaceable components
4. Hidden transformation layer
5. Rules / recipes / workflow system
6. Feedback loop
7. Black-box protection strategy
8. Evaluation strategy
9. Operational update path
10. Immediate implementation plan
```

## Moat taxonomy

### Public capability

Capabilities any competitor can access:

- public LLM APIs
- image/video generation APIs
- open-source models
- common prompt templates
- generic chat UI

### Workflow moat

The product knows how to guide a user through a valuable job.

Examples:

- input normalization
- intent clarification
- structured generation pipelines
- multi-step agent orchestration
- domain-specific review gates

### Knowledge moat

The product encodes domain knowledge that users do not want to learn manually.

Examples:

- category rules
- style recipes
- compliance requirements
- expert heuristics
- reusable playbooks

### Integration moat

The product combines fragmented tools into one low-friction workflow.

Examples:

- model A for planning
- model B for generation
- storage and asset reuse
- export to external tools
- admin review and publishing

### Operational moat

The team can update the system faster and safer than competitors.

Examples:

- rule publishing without deployment
- rollbackable configuration
- evaluation dashboards
- postmortem-driven improvements

## Design rules

- Do not expose internal prompts, rules, recipes, scoring logic, private datasets, or internal reasoning to ordinary users.
- Do not rely on the frontend to hide sensitive knowledge.
- Prefer server-side projection layers for public/admin data separation.
- Prefer configurable rules and recipes when frequent non-code updates are expected.
- Prefer ADRs for major model, vendor, workflow, or data architecture decisions.
- Treat output failures as training signals for the system, not just bugs.

## Anti-patterns

Avoid:

- "We have a moat because we call a strong model."
- "The prompt is hidden in frontend code."
- "All domain knowledge lives in one giant prompt."
- "Every small rule change requires engineer deployment."
- "No one knows why this prompt works."
- "Bad outputs are fixed manually but never captured."

## Final check

Before finishing, verify:

- Did we clearly separate model capability from product know-how?
- Did we identify what must be protected?
- Did we design a way to update knowledge safely?
- Did we define how output quality improves over time?
