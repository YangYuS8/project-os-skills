# Quickstart

This quickstart focuses on simple installation and practical use.

## Option A: install into a project for mainstream agents

Run this inside the project you want agents to work on:

```bash
curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/main/scripts/install.sh | bash -s -- --mode project --dest . --agents all
```

This creates:

```text
.project-os/
  PROJECT_OS_AGENT.md
  skills/
  templates/
PROJECT_RULES.md
AGENTS.md
CLAUDE.md
GEMINI.md
CODEX.md
OPENCODE.md
.cursor/rules/project-os.mdc
.cursorrules
.windsurfrules
```

Existing files are not overwritten unless you pass `--force`.

## Option B: install native skills for Hermes-like agents

```bash
git clone https://github.com/YangYuS8/project-os-skills.git
cd project-os-skills
bash scripts/install.sh --mode skills --target hermes
```

By default, this copies skills to:

```text
~/.hermes/skills
```

You can override the target:

```bash
bash scripts/install.sh --mode skills --dest /custom/skills/path
```

## Option C: install both native skills and project adapters

```bash
bash scripts/install.sh --mode all --dest /path/to/project --agents all
```

## Minimal daily use

After installing into a project, edit:

```text
PROJECT_RULES.md
```

Then ask your agent:

```text
Use Project OS Skills to design this feature before coding.
```

Or be more specific:

```text
Use moat-first-ai-product to identify the real moat.
```

```text
Use adr-driven-architecture to write an ADR for this database choice.
```

```text
Use blackbox-contract-security to make sure hidden prompts and internal fields cannot leak.
```

```text
Use qa-as-asset to create a reusable smoke and regression checklist.
```

## Let agents use it automatically

The project adapters include an auto-use matrix. Agents that read project instruction files should automatically choose skills based on task type.

Examples:

- New feature -> `project-os-thinking` + `clean-boundary-engineering`
- AI product -> `moat-first-ai-product`
- Architecture choice -> `adr-driven-architecture`
- Hidden prompts or internal rules -> `blackbox-contract-security`
- Deployment or debugging -> `runbook-first-ops`
- Testing -> `qa-as-asset`
- Incident -> `postmortem-knowledge-base`

## Safe uninstall

Project-local install is just files. Remove the generated files if you no longer need them:

```text
.project-os/
PROJECT_RULES.md
AGENTS.md
CLAUDE.md
GEMINI.md
CODEX.md
OPENCODE.md
.cursor/rules/project-os.mdc
.cursorrules
.windsurfrules
```

Review before deleting if you added project-specific content.
