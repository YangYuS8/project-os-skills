# Agent Compatibility

Project OS Skills is designed to work with two categories of agents.

## 1. Native skill loaders

Some agents can load a directory of skills directly.

For these agents, install the `skills/*` folders into the agent's skills directory.

```bash
bash scripts/install.sh --mode skills --target hermes
```

Supported target today:

| Target | Install mode | Notes |
|---|---|---|
| Hermes | native skills | Copies `skills/*` into `~/.hermes/skills` by default. |
| Custom skills directory | native skills | Use `--dest /path/to/skills`. |

## 2. Project instruction adapters

Many agents read project-level instruction files. For these agents, install Project OS into the project root.

```bash
bash scripts/install.sh --mode project --dest /path/to/project --agents all
```

The installer creates `.project-os/` and project instruction files.

| Adapter | Files generated |
|---|---|
| Generic / AGENTS | `AGENTS.md` |
| Codex-style | `AGENTS.md`, `CODEX.md` |
| Claude-style | `CLAUDE.md` |
| Gemini-style | `GEMINI.md` |
| Cursor-style | `.cursor/rules/project-os.mdc`, `.cursorrules` |
| Windsurf-style | `.windsurfrules` |
| OpenCode-style | `OPENCODE.md` |

## How automatic use works

Adapters contain an auto-use matrix:

| Task type | Skill |
|---|---|
| New project, feature, or product review | `project-os-thinking` |
| AI product, prompt/rule system, model integration | `moat-first-ai-product` |
| Architecture choice | `adr-driven-architecture` |
| Implementation and code organization | `clean-boundary-engineering` |
| Hidden prompts, rules, credentials, sensitive fields | `blackbox-contract-security` |
| Deployment, debugging, rollback | `runbook-first-ops` |
| Testing and release checks | `qa-as-asset` |
| Incidents and repeated bugs | `postmortem-knowledge-base` |

Agents that respect project instructions should choose the right skill without the user naming it every time.

## Best practice

Install project adapters into every important project, then maintain:

```text
PROJECT_RULES.md
```

Use `PROJECT_RULES.md` for facts that are specific to that project:

- product constraints
- accepted ADRs
- deployment rules
- sensitive fields
- testing requirements
- known incidents

Keep reusable methodology in this repository.

## Compatibility philosophy

This repository does not depend on one agent vendor.

It provides:

1. native skill folders for agents that support skill loading;
2. project instruction adapters for agents that read repository-level guidance;
3. templates that any agent can use;
4. a simple installer that does not require a package manager.
