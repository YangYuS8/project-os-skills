# Installation

Project OS Skills can be installed in two ways:

- **Project adapter mode** — installs Project OS into one repository so mainstream coding agents can discover and use it through project instruction files.
- **Native skills mode** — copies the skill folders into a Hermes-like skills directory.

Most users should start with **Project adapter mode**.

| You want | Run | Lands on disk |
|---|---|---|
| Project-local guidance for mainstream agents | `curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/main/scripts/install.sh \| bash -s -- --mode project --dest . --agents all` | `.project-os/`, `PROJECT_RULES.md`, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `CODEX.md`, `OPENCODE.md`, Cursor/Windsurf rules |
| Native Hermes-style skills | `bash scripts/install.sh --mode skills --target hermes` | `~/.hermes/skills/*` by default |
| Both | `bash scripts/install.sh --mode all --dest /path/to/project --agents all` | Both of the above |

## For Humans

**Strongly recommended: let an LLM coding agent install this for you.**

Project OS Skills is mostly useful when the agent understands how to use it. Letting the agent install it also lets the agent read the full guide, inspect the generated files, and help fill `PROJECT_RULES.md` for the current repository.

Paste this prompt into Codex, Claude Code, Cursor, Windsurf, OpenCode, Gemini CLI, Hermes, or any coding agent session opened inside your target project:

```text
Install and configure Project OS Skills by following the instructions here:
https://raw.githubusercontent.com/YangYuS8/project-os-skills/refs/heads/main/docs/guide/installation.md
```

That is the preferred human experience.

### Manual one-line project install

If you want to run it yourself:

```bash
curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/main/scripts/install.sh | bash -s -- --mode project --dest . --agents all
```

### Manual native skills install

```bash
git clone https://github.com/YangYuS8/project-os-skills.git
cd project-os-skills
bash scripts/install.sh --mode skills --target hermes
```

## For LLM Agents

> **Important:** Fetch and read this guide before installing. Do not rely on memory or a summarized preview.

Use:

```bash
curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/refs/heads/main/docs/guide/installation.md
```

Your job is to install Project OS Skills safely, then help the user make it useful for the current project.

### Step 1: Identify the install target

Determine whether the user wants:

1. **Project adapter mode** for the current repository. This is the default.
2. **Native skills mode** for Hermes-like agents.
3. **Both**.

If the target project path is ambiguous, ask the user before installing.

### Step 2: Explain expected changes before running commands

Before executing the installer, tell the user what will be created.

For project adapter mode, expected files include:

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

The installer is designed not to overwrite existing adapter files unless `--force` is passed. If a target file already exists, it writes a `*.project-os.example` file for manual merging.

### Step 3: Install into the current project

If the user wants the default project-local install, run from the target repository root:

```bash
curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/main/scripts/install.sh | bash -s -- --mode project --dest . --agents all
```

If the project path is not the current directory:

```bash
curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/main/scripts/install.sh | bash -s -- --mode project --dest /path/to/project --agents all
```

### Step 4: Install native Hermes-style skills when requested

If the user wants native skills:

```bash
git clone https://github.com/YangYuS8/project-os-skills.git
cd project-os-skills
bash scripts/install.sh --mode skills --target hermes
```

By default, this copies skills into:

```text
~/.hermes/skills
```

Use a custom directory when the user's agent requires it:

```bash
bash scripts/install.sh --mode skills --dest /custom/skills/path
```

### Step 5: Verify installation

After project adapter install, inspect:

```bash
ls -la .project-os
ls -la .project-os/skills
ls -la .project-os/templates
ls -la PROJECT_RULES.md AGENTS.md 2>/dev/null || true
git status --short
```

After native skills install, inspect:

```bash
ls -la ~/.hermes/skills
```

### Step 6: Help fill `PROJECT_RULES.md`

Do not stop after installing files.

Read the current repository enough to help the user fill `PROJECT_RULES.md` with project-specific facts:

- product constraints
- target users
- accepted architecture decisions
- sensitive fields
- deployment rules
- testing rules
- known incidents
- agent operating rules

If the current project is small or unclear, ask targeted questions instead of inventing facts.

### Step 7: Explain how agents should use it

Tell the user that future agents should read:

```text
PROJECT_RULES.md
.project-os/PROJECT_OS_AGENT.md
.project-os/skills/*/SKILL.md
```

The adapters contain an auto-use matrix:

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

## Installer options

```bash
bash scripts/install.sh [options]
```

Options:

```text
--mode project|skills|all     Install project adapters, native skills, or both. Default: project
--dest PATH                   Project root for --mode project, or skills directory for --mode skills
--agents LIST                 Comma list: all,codex,claude,gemini,cursor,windsurf,opencode,generic
--target NAME                 Native skill target. Currently: hermes. Default: hermes
--force                       Overwrite existing adapter files
--dry-run                     Print actions without writing files
--help                        Show help
```

## Safety notes

- Do not paste secrets into `PROJECT_RULES.md`, adapter files, or skills.
- If the repository has strict supply-chain rules, download and inspect `scripts/install.sh` before running it.
- Do not pass `--force` unless the user explicitly wants existing instruction files overwritten.
- If existing files are present, merge the generated `*.project-os.example` files manually.
- If the project uses Git, show `git status --short` after installation.

## Troubleshooting

### `curl` is missing

Clone the repository manually:

```bash
git clone https://github.com/YangYuS8/project-os-skills.git
cd project-os-skills
bash scripts/install.sh --mode project --dest /path/to/project --agents all
```

### `git` is missing

The one-line installer can fall back to `curl` + `tar`. If both Git and curl are unavailable, install one of them first.

### Existing instruction files were not overwritten

This is expected. The installer avoids overwriting by default and writes `*.project-os.example` files for manual merging.

### The agent does not automatically use the skills

Ask it explicitly:

```text
Use Project OS Skills and follow PROJECT_RULES.md as the project-specific source of truth.
```

Then point it to:

```text
.project-os/PROJECT_OS_AGENT.md
.project-os/skills/*/SKILL.md
```
