# Install with an Agent

[English](#english) | [简体中文](#简体中文)

## English

The preferred installation flow is intentionally simple: ask your coding agent to install Project OS Skills by reading the full installation guide.

Copy this prompt into Codex, Claude Code, Cursor, Windsurf, OpenCode, Gemini CLI, Hermes, or any coding agent session opened inside the project you want to enhance:

```text
Install and configure Project OS Skills by following the instructions here:
https://raw.githubusercontent.com/YangYuS8/project-os-skills/refs/heads/main/docs/guide/installation.md
```

That guide tells the agent how to:

- choose project adapter mode, native skills mode, or both;
- explain expected file changes before running commands;
- run the installer safely;
- avoid overwriting existing instruction files;
- verify the install;
- help fill `PROJECT_RULES.md` with project-specific facts.

Manual installation remains available in [`quickstart.md`](quickstart.md) and [`guide/installation.md`](guide/installation.md).

## 简体中文

推荐安装方式刻意保持简单：让你的 Coding Agent 阅读完整安装指南并自己完成安装。

在你想增强的项目中，把下面这段话发给 Codex、Claude Code、Cursor、Windsurf、OpenCode、Gemini CLI、Hermes 或其他 Coding Agent：

```text
请按照下面这份安装指南，把 Project OS Skills 安装并配置到当前项目：
https://raw.githubusercontent.com/YangYuS8/project-os-skills/refs/heads/main/docs/guide/installation.md
```

这份指南会告诉 Agent 如何：

- 选择项目适配器模式、原生 skills 模式，或两者都安装；
- 执行命令前先说明预计会创建或修改哪些文件；
- 安全运行安装器；
- 避免覆盖已有的 Agent 指令文件；
- 验证安装结果；
- 帮你根据当前项目补全 `PROJECT_RULES.md`。

手动安装方式仍然保留在 [`quickstart.md`](quickstart.md) 和 [`guide/installation.md`](guide/installation.md)。
