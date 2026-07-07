# Install with an Agent

[English](#english) | [简体中文](#简体中文)

## English

The easiest way to install Project OS Skills is to ask your coding agent to do it for you.

Copy this prompt into the agent inside the project you want to enhance:

```text
Install Project OS Skills into this repository.

Use the official repository:
https://github.com/YangYuS8/project-os-skills

Goal:
- install project-local Project OS context into the current repository
- enable adapters for mainstream agents
- do not overwrite existing instruction files without preserving a copy
- after installation, inspect PROJECT_RULES.md and help me fill it with project-specific facts

Preferred command:
curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/main/scripts/install.sh | bash -s -- --mode project --dest . --agents all

Before running commands, briefly explain what files will be created or changed. After installation, summarize the installed files and suggest the next edit to PROJECT_RULES.md.
```

### Hermes native skills prompt

Use this when you want to install Project OS Skills into a Hermes-style skills directory:

```text
Install Project OS Skills as native skills for my Hermes-like agent.

Use the official repository:
https://github.com/YangYuS8/project-os-skills

Preferred commands:
git clone https://github.com/YangYuS8/project-os-skills.git
cd project-os-skills
bash scripts/install.sh --mode skills --target hermes

After installation, confirm where the skills were copied and list the installed skill names.
```

### Install both project adapters and native skills

```text
Install Project OS Skills both as project-local agent guidance and as native Hermes-style skills.

Use the official repository:
https://github.com/YangYuS8/project-os-skills

Preferred command after cloning the repository:
bash scripts/install.sh --mode all --dest /path/to/my/project --agents all

Ask me for the project path if it is not clear.
```

### Security note

The prompt uses a remote shell installer for convenience. If your project has a stricter security policy, ask the agent to first download and inspect `scripts/install.sh`, then run it locally.

Manual installation remains available in [`quickstart.md`](quickstart.md).

## 简体中文

最简单的安装方式是：**直接把下面这段话发给你的 Coding Agent，让它自己安装。**

在你想增强的项目里，把这段提示词发给 Agent：

```text
请把 Project OS Skills 安装到当前仓库。

官方仓库：
https://github.com/YangYuS8/project-os-skills

目标：
- 把 Project OS 的项目级上下文安装到当前仓库
- 启用主流 Agents 的适配文件
- 不要直接覆盖已有的 Agent 指令文件，遇到已有文件要保留副本或生成示例文件
- 安装完成后，检查 PROJECT_RULES.md，并帮我根据当前项目补全项目事实和规则

优先使用这个命令：
curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/main/scripts/install.sh | bash -s -- --mode project --dest . --agents all

执行命令前，先简要说明会创建或修改哪些文件。安装完成后，总结安装了哪些文件，并建议下一步如何编辑 PROJECT_RULES.md。
```

### 安装为 Hermes 原生 Skills 的提示词

如果你想把 Project OS Skills 安装进 Hermes 类 Agent 的 skills 目录，可以给 Agent 这段话：

```text
请把 Project OS Skills 安装为我的 Hermes 类 Agent 的原生 skills。

官方仓库：
https://github.com/YangYuS8/project-os-skills

优先使用这些命令：
git clone https://github.com/YangYuS8/project-os-skills.git
cd project-os-skills
bash scripts/install.sh --mode skills --target hermes

安装完成后，请确认 skills 被复制到了哪里，并列出已安装的 skill 名称。
```

### 同时安装项目适配文件和原生 Skills

```text
请把 Project OS Skills 同时安装为项目级 Agent 指令和 Hermes 类原生 skills。

官方仓库：
https://github.com/YangYuS8/project-os-skills

clone 仓库后优先使用这个命令：
bash scripts/install.sh --mode all --dest /path/to/my/project --agents all

如果项目路径不明确，请先问我。
```

### 安全说明

为了方便，上面的提示词使用了远程 shell 安装命令。如果你的项目安全要求更高，可以让 Agent 先下载并审查 `scripts/install.sh`，确认后再本地执行。

手动安装方式仍然保留在 [`quickstart.md`](quickstart.md)。
