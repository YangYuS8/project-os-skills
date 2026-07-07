# Agent Adapters

Project OS Skills supports two integration styles.

## 1. Native skill loading

Use this when an agent supports a skills directory.

The installer copies `skills/*` into the target skills directory.

Example:

```bash
bash scripts/install.sh --mode skills --target hermes
```

## 2. Project instruction adapters

Use this for agents that read project-level instruction files.

The installer copies:

- `.project-os/skills/*`
- `.project-os/templates/*`
- `.project-os/PROJECT_OS_AGENT.md`
- `PROJECT_RULES.md`
- agent-facing instruction files such as `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `CODEX.md`, Cursor rule files, Windsurf rule files, and `OPENCODE.md` depending on selected adapters.

Example:

```bash
bash scripts/install.sh --mode project --dest /path/to/project --agents all
```

## Adapter strategy

Adapters do not duplicate every skill. They tell the agent:

1. where the local Project OS skills are installed;
2. when to use each skill automatically;
3. which project-specific file is authoritative;
4. which safety rules must always apply.

## Existing project files

The installer does not overwrite existing adapter files unless `--force` is used.

If a target file already exists, the installer writes a `*.project-os.example` file next to it so you can merge manually.

## Security

Do not put secrets, credentials, private prompts, or private customer data in adapter files.

Keep reusable methodology in this repository. Keep project-specific but non-secret facts in `PROJECT_RULES.md`. Keep secrets in proper secret storage.
