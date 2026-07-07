#!/usr/bin/env bash
set -euo pipefail

PROJECT_OS_REPO_URL="${PROJECT_OS_REPO_URL:-https://github.com/YangYuS8/project-os-skills.git}"
MODE="project"
DEST=""
AGENTS="all"
TARGET="hermes"
FORCE="0"
DRY_RUN="0"

usage() {
  cat <<'EOF'
Project OS Skills installer

Usage:
  bash scripts/install.sh [options]

Options:
  --mode project|skills|all     Install project adapters, native skills, or both. Default: project
  --dest PATH                   Project root for --mode project, or skills directory for --mode skills
  --agents LIST                 Comma list: all,codex,claude,gemini,cursor,windsurf,opencode,generic
  --target NAME                 Native skill target. Currently: hermes. Default: hermes
  --force                       Overwrite existing adapter files
  --dry-run                     Print actions without writing files
  --help                        Show this help

Examples:
  bash scripts/install.sh --mode project --dest . --agents all
  bash scripts/install.sh --mode skills --target hermes
  bash scripts/install.sh --mode all --dest /path/to/project --agents codex,claude

One-line project install:
  curl -fsSL https://raw.githubusercontent.com/YangYuS8/project-os-skills/main/scripts/install.sh | bash -s -- --mode project --dest . --agents all
EOF
}

while [ $# -gt 0 ]; do
  case "$1" in
    --mode) MODE="${2:-}"; shift 2 ;;
    --dest) DEST="${2:-}"; shift 2 ;;
    --agents) AGENTS="${2:-}"; shift 2 ;;
    --target) TARGET="${2:-}"; shift 2 ;;
    --force) FORCE="1"; shift ;;
    --dry-run) DRY_RUN="1"; shift ;;
    --help|-h) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

resolve_repo_root() {
  local script_dir
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || pwd)"
  local root
  root="$(cd "$script_dir/.." 2>/dev/null && pwd || pwd)"

  if [ -d "$root/skills" ] && [ -d "$root/templates" ]; then
    echo "$root"
    return 0
  fi

  local tmp
  tmp="${TMPDIR:-/tmp}/project-os-skills-install-$(date +%s)"
  mkdir -p "$tmp"

  if command -v git >/dev/null 2>&1; then
    git clone --depth=1 "$PROJECT_OS_REPO_URL" "$tmp/repo" >/dev/null 2>&1
    echo "$tmp/repo"
    return 0
  fi

  if command -v curl >/dev/null 2>&1 && command -v tar >/dev/null 2>&1; then
    curl -fsSL "https://github.com/YangYuS8/project-os-skills/archive/refs/heads/main.tar.gz" | tar -xz -C "$tmp"
    echo "$tmp/project-os-skills-main"
    return 0
  fi

  echo "Cannot locate repository and cannot download it. Install git or curl+tar." >&2
  exit 1
}

REPO_ROOT="$(resolve_repo_root)"

say() {
  printf '%s\n' "$*"
}

copy_dir_contents() {
  local src="$1"
  local dst="$2"
  if [ "$DRY_RUN" = "1" ]; then
    say "[dry-run] copy directory contents: $src -> $dst"
    return 0
  fi
  mkdir -p "$dst"
  cp -R "$src"/. "$dst"/
}

copy_file_safe() {
  local src="$1"
  local dst="$2"
  if [ "$DRY_RUN" = "1" ]; then
    say "[dry-run] copy file: $src -> $dst"
    return 0
  fi
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ "$FORCE" != "1" ]; then
    local alt="${dst}.project-os.example"
    cp "$src" "$alt"
    say "Skipped existing $dst; wrote $alt instead. Merge manually or rerun with --force."
  else
    cp "$src" "$dst"
    say "Installed $dst"
  fi
}

install_native_skills() {
  local dst="$DEST"
  if [ -z "$dst" ]; then
    case "$TARGET" in
      hermes) dst="${HERMES_SKILLS_DIR:-$HOME/.hermes/skills}" ;;
      *) echo "Unsupported native skill target: $TARGET" >&2; exit 1 ;;
    esac
  fi
  say "Installing native skills to $dst"
  copy_dir_contents "$REPO_ROOT/skills" "$dst"
}

normalize_agents() {
  local list="$1"
  if [ "$list" = "all" ]; then
    echo "generic,codex,claude,gemini,cursor,windsurf,opencode"
  else
    echo "$list"
  fi
}

install_project_adapters() {
  local project="$DEST"
  if [ -z "$project" ]; then
    project="$(pwd)"
  fi

  say "Installing Project OS context into $project"

  copy_dir_contents "$REPO_ROOT/skills" "$project/.project-os/skills"
  copy_dir_contents "$REPO_ROOT/templates" "$project/.project-os/templates"
  copy_file_safe "$REPO_ROOT/adapters/project/PROJECT_OS_AGENT.md" "$project/.project-os/PROJECT_OS_AGENT.md"

  if [ -f "$REPO_ROOT/PROJECT_RULES.template.md" ]; then
    if [ -e "$project/PROJECT_RULES.md" ] && [ "$FORCE" != "1" ]; then
      copy_file_safe "$REPO_ROOT/PROJECT_RULES.template.md" "$project/.project-os/PROJECT_RULES.template.md"
    else
      copy_file_safe "$REPO_ROOT/PROJECT_RULES.template.md" "$project/PROJECT_RULES.md"
    fi
  fi

  local agent_list
  agent_list="$(normalize_agents "$AGENTS")"
  IFS=',' read -r -a items <<< "$agent_list"

  for item in "${items[@]}"; do
    case "$item" in
      generic)
        copy_file_safe "$REPO_ROOT/adapters/project/AGENTS.md" "$project/AGENTS.md"
        ;;
      codex)
        copy_file_safe "$REPO_ROOT/adapters/project/AGENTS.md" "$project/AGENTS.md"
        copy_file_safe "$REPO_ROOT/adapters/project/CODEX.md" "$project/CODEX.md"
        ;;
      claude)
        copy_file_safe "$REPO_ROOT/adapters/project/CLAUDE.md" "$project/CLAUDE.md"
        ;;
      gemini)
        copy_file_safe "$REPO_ROOT/adapters/project/GEMINI.md" "$project/GEMINI.md"
        ;;
      cursor)
        copy_file_safe "$REPO_ROOT/adapters/project/cursor-rules.md" "$project/.cursor/rules/project-os.mdc"
        copy_file_safe "$REPO_ROOT/adapters/project/cursor-rules.md" "$project/.cursorrules"
        ;;
      windsurf)
        copy_file_safe "$REPO_ROOT/adapters/project/windsurf-adapter.md" "$project/.windsurfrules"
        ;;
      opencode)
        copy_file_safe "$REPO_ROOT/adapters/project/OPENCODE.md" "$project/OPENCODE.md"
        ;;
      "") ;;
      *) echo "Unknown agent adapter: $item" >&2; exit 1 ;;
    esac
  done

  say "Project OS install complete. Start by editing PROJECT_RULES.md."
}

case "$MODE" in
  project) install_project_adapters ;;
  skills) install_native_skills ;;
  all) install_native_skills; install_project_adapters ;;
  *) echo "Unsupported mode: $MODE" >&2; usage; exit 1 ;;
esac
