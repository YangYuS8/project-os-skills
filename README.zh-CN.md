# Project OS Skills

[English](README.md) | 简体中文

一个可复用的 **Project OS Skill Pack**，用于让 AI Agents 按照完整的产品工程操作系统来参与软件项目，而不是只做代码生成。

它希望让 Agent 形成这样的工作链路：

```text
产品定位
  -> 护城河与知识系统设计
  -> ADR 驱动的架构决策
  -> 清晰的工程边界
  -> 黑盒 / 安全数据契约
  -> 安全的运维交付
  -> 可复用的质量资产
  -> 事故复盘与知识库沉淀
```

目标是让 Agent 不只是“会写代码”，而是更像一个小型产品工程团队：产品经理、架构师、工程师、SRE、QA、安全审查者和知识库维护者。

## 快速安装

### 最简单：一句话让 Agent 自己安装

在你想增强的项目里，把这段提示词发给 Coding Agent：

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

更多可直接复制的提示词见 [`docs/install-with-agent.md`](docs/install-with-agent.md)。

### 手动：安装到当前项目，供主流 Agents 使用

在你希望 Agent 参与开发的项目根目录执行：

```bash
curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/main/scripts/install.sh | bash -s -- --mode project --dest . --agents all
```

这会在当前项目里安装项目级上下文，包含常见 Agent 风格的说明文件，例如：

```text
AGENTS.md
CLAUDE.md
GEMINI.md
CODEX.md
OPENCODE.md
.cursor/rules/project-os.mdc
.cursorrules
.windsurfrules
```

同时也会生成：

```text
.project-os/
PROJECT_RULES.md
```

其中 `.project-os/` 存放通用方法论和模板，`PROJECT_RULES.md` 用来记录当前项目自己的事实、约束和规则。

### 手动：安装为 Hermes 类 Agent 的原生 Skills

```bash
git clone https://github.com/YangYuS8/project-os-skills.git
cd project-os-skills
bash scripts/install.sh --mode skills --target hermes
```

默认会复制到：

```text
~/.hermes/skills
```

也可以指定目录：

```bash
bash scripts/install.sh --mode skills --dest /custom/skills/path
```

### 同时安装项目适配文件和原生 Skills

```bash
bash scripts/install.sh --mode all --dest /path/to/project --agents all
```

更多说明见：

- [`docs/quickstart.md`](docs/quickstart.md)
- [`docs/install-with-agent.md`](docs/install-with-agent.md)
- [`docs/agent-compatibility.md`](docs/agent-compatibility.md)
- [`docs/usage-with-hermes.md`](docs/usage-with-hermes.md)

## 为什么需要这个项目？

很多 Coding Agent 可以很快生成代码，但它们经常跳过那些真正决定项目能否长期维护的问题：

- 这个产品给谁用？
- 用户真正想完成的任务是什么？
- 除了调用公开模型或 API，这个项目真正的护城河是什么？
- 哪些知识应该沉淀成规则、配方、工作流或数据库？
- 哪些技术决策需要写成 ADR？
- UI、API、业务逻辑、数据层、运维层之间的边界在哪里？
- 哪些字段、Prompt、规则、凭证和内部逻辑绝不能泄露？
- 系统如何部署、回滚、测试和排障？
- 事故和踩坑经验如何变成可复用知识？

Project OS Skills 的目标不是制造更多文档，而是在正确的节点让 Agent 慢下来，显式做取舍，并把反复出现的经验变成长期资产。

## 仓库结构

```text
project-os-skills/
├── README.md
├── README.zh-CN.md
├── PROJECT_RULES.template.md
├── LICENSE
├── scripts/
│   └── install.sh
├── adapters/
│   ├── README.md
│   └── project/
│       ├── PROJECT_OS_AGENT.md
│       ├── AGENTS.md
│       ├── CLAUDE.md
│       ├── GEMINI.md
│       ├── CODEX.md
│       ├── OPENCODE.md
│       ├── cursor-rules.md
│       └── windsurf-adapter.md
├── skills/
│   ├── project-os-thinking/
│   │   └── SKILL.md
│   ├── moat-first-ai-product/
│   │   └── SKILL.md
│   ├── adr-driven-architecture/
│   │   └── SKILL.md
│   ├── clean-boundary-engineering/
│   │   └── SKILL.md
│   ├── blackbox-contract-security/
│   │   └── SKILL.md
│   ├── runbook-first-ops/
│   │   └── SKILL.md
│   ├── qa-as-asset/
│   │   └── SKILL.md
│   └── postmortem-knowledge-base/
│       └── SKILL.md
├── templates/
│   ├── ADR.md
│   ├── RUNBOOK.md
│   ├── PROJECT_OS_REVIEW.md
│   ├── QA_CHECKLIST.md
│   ├── POSTMORTEM.md
│   └── SECURITY_PROJECTION.md
├── docs/
│   ├── philosophy.md
│   ├── skill-pack-design.md
│   ├── quickstart.md
│   ├── install-with-agent.md
│   ├── agent-compatibility.md
│   └── usage-with-hermes.md
└── examples/
    ├── README.md
    └── autoqa-project-os-review.md
```

## Skills 列表

### `project-os-thinking`

用于启动新项目、设计新功能、审查已有产品，或把一个粗略想法变成可维护系统。

它会要求 Agent 在写代码前先思考产品定位、目标用户、JTBD、护城河、核心工作流、系统边界、QA、运维和知识沉淀。

### `moat-first-ai-product`

用于设计 AI 产品或 Agentic 系统。

它会让 Agent 区分“公开模型能力”和“真正可防守的产品 know-how”，例如规则、配方、工作流、评估闭环、数据、接口整合和运营经验。

### `adr-driven-architecture`

用于做数据库、框架、部署方式、队列、供应商、系统形态等技术选择。

它会让 Agent 用 ADR 记录重要决策，而不是只给一句模糊建议。

### `clean-boundary-engineering`

用于实现功能或审查代码组织。

它会要求 Agent 区分 UI、API、业务逻辑、持久化、安全和运维脚本的职责，避免把项目写成一团能跑但难维护的代码。

### `blackbox-contract-security`

用于系统存在隐藏 Prompt、配方、规则、凭证、评分逻辑、私有数据或管理员字段时。

它会要求 Agent 设计服务端 public/admin 投影，避免依赖“前端不展示”来保护敏感信息。

### `runbook-first-ops`

用于部署、排障、迁移、回滚、服务器操作和线上变更。

它会要求 Agent 先给只读诊断，再给备份、变更、验证和回滚步骤，避免高风险一次性命令。

### `qa-as-asset`

用于新增功能、改功能、发版前检查或构建自动化测试方案。

它会让 Agent 把测试脚本、冒烟检查、回归清单和质量门禁当成可长期复用的项目资产。

### `postmortem-knowledge-base`

用于事故、疑难排障、重复踩坑和故障复盘。

它会让 Agent 把症状、影响、根因、修复、验证和预防措施沉淀成知识库，而不是只停留在“修好了”。

## Agent 支持策略

Project OS Skills 支持两种集成方式。

### 1. 原生 Skill 模式

适用于 Hermes 这类支持 skills 目录的 Agent。

安装器会把 `skills/*` 复制到目标 skills 目录，例如：

```text
~/.hermes/skills
```

### 2. 项目适配器模式

适用于会读取项目级说明文件的主流 Agents。

安装器会在项目中生成 `.project-os/` 和对应的适配文件，例如：

```text
AGENTS.md
CLAUDE.md
GEMINI.md
CODEX.md
OPENCODE.md
.cursor/rules/project-os.mdc
.cursorrules
.windsurfrules
```

这些适配文件包含自动使用矩阵，使 Agent 可以根据任务类型自行选择合适的 Skill。

例如：

| 任务类型 | 推荐 Skill |
|---|---|
| 新项目、新功能、产品审查 | `project-os-thinking` |
| AI 产品、Prompt / 规则系统、模型集成 | `moat-first-ai-product` |
| 架构选型 | `adr-driven-architecture` |
| 代码组织和功能实现 | `clean-boundary-engineering` |
| 隐藏 Prompt、规则、凭证、敏感字段 | `blackbox-contract-security` |
| 部署、排障、回滚 | `runbook-first-ops` |
| 测试与发版检查 | `qa-as-asset` |
| 事故和重复问题 | `postmortem-knowledge-base` |

## 设计原则

1. **代码只是系统的一层。**
2. **先识别护城河，再堆功能。**
3. **重要决策必须被记录。**
4. **清晰边界比炫技更重要。**
5. **敏感知识必须由服务端契约保护。**
6. **运维交付是产品工程的一部分。**
7. **测试和复盘都是长期资产。**
8. **模板只是脚手架，不是空泛作文。**

## 常用提示词

```text
Use project-os-thinking to design this project before writing code.
```

```text
Use moat-first-ai-product to identify the real moat of this AI product.
```

```text
Use adr-driven-architecture to record the key technical choices and tradeoffs.
```

```text
Use clean-boundary-engineering while implementing this feature.
```

```text
Use blackbox-contract-security to prevent internal prompts/rules/fields from leaking.
```

```text
Use runbook-first-ops to produce a safe deployment and rollback plan.
```

```text
Use qa-as-asset to create durable tests and regression checks.
```

```text
Use postmortem-knowledge-base to turn this incident into reusable knowledge.
```

## 推荐使用方式

在项目中安装后，先编辑：

```text
PROJECT_RULES.md
```

把当前项目的事实写进去，例如：

- 产品约束
- 已接受的 ADR
- 敏感字段
- 部署规则
- 测试要求
- 已知事故

之后让 Agent 工作时，可以直接说：

```text
Use Project OS Skills and follow PROJECT_RULES.md as the project-specific source of truth.
```

## 许可证

本项目采用 [Apache License 2.0](LICENSE) 开源。