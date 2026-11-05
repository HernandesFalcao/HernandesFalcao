#!/usr/bin/env bash
# Valida a estrutura da SSOT (AGENTS.md + docs/ + ADRs).
# Uso: scripts/check-governance.sh [--strict]
#   --strict  faz marcadores TODO(owner) falharem o check (use quando o projeto estiver definido).
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

STRICT=0
[[ "${1:-}" == "--strict" ]] && STRICT=1

errors=0
warnings=0
err()  { echo "ERRO:  $*"; errors=$((errors + 1)); }
warn() { echo "AVISO: $*"; warnings=$((warnings + 1)); }

# 1. Arquivos obrigatórios
required=(
  AGENTS.md CLAUDE.md
  docs/README.md docs/01-scope.md docs/02-business-rules.md docs/03-architecture.md
  docs/04-folder-structure.md docs/05-coding-style.md docs/06-coding-patterns.md
  docs/07-agent-system.md docs/08-development-workflow.md docs/glossary.md
  docs/adr/README.md docs/adr/0000-template.md
)
for f in "${required[@]}"; do
  [[ -f "$f" ]] || err "arquivo obrigatório ausente: $f"
done

# 2. CLAUDE.md importa AGENTS.md (ADR-0002)
grep -qx '@AGENTS.md' CLAUDE.md 2>/dev/null || err "CLAUDE.md deve conter a linha '@AGENTS.md' (ADR-0002)"

# 3. ADRs: nome, seções, status, numeração única, presença no índice
valid_status='^(Proposto|Aceito|Rejeitado|Obsoleto|Substituído por ADR-[0-9]{4})$'
declare -A seen
for adr in docs/adr/[0-9][0-9][0-9][0-9]-*.md; do
  [[ -e "$adr" ]] || continue
  base="$(basename "$adr")"
  num="${base:0:4}"
  [[ "$num" == "0000" ]] && continue
  [[ "$base" =~ ^[0-9]{4}-[a-z0-9]+(-[a-z0-9]+)*\.md$ ]] || err "$adr: nome deve ser NNNN-titulo-kebab.md"
  [[ -n "${seen[$num]:-}" ]] && err "$adr: número $num duplicado (${seen[$num]})"
  seen[$num]="$adr"
  head -1 "$adr" | grep -q "^# ADR-$num:" || err "$adr: título deve começar com '# ADR-$num:'"
  for sec in "## Contexto" "## Decisão" "## Consequências"; do
    grep -qx "$sec" "$adr" || err "$adr: seção obrigatória ausente: $sec"
  done
  status="$(sed -n 's/^- \*\*Status:\*\* *//p' "$adr" | head -1)"
  [[ "$status" =~ $valid_status ]] || err "$adr: status inválido '$status'"
  grep -q "($base)" docs/adr/README.md || err "$adr: não listado no índice docs/adr/README.md"
done

# 4. Links relativos em Markdown resolvem
while IFS= read -r md; do
  dir="$(dirname "$md")"
  # remove blocos de código antes de extrair links
  while IFS= read -r link; do
    target="${link%%#*}"
    [[ -z "$target" ]] && continue
    [[ "$target" =~ ^(https?:|mailto:) ]] && continue
    [[ -e "$dir/$target" ]] || err "$md: link quebrado -> $link"
  done < <(awk '/^```/{c=!c; next} !c' "$md" | grep -oE '\]\([^)]+\)' | sed -E 's/^\]\((.*)\)$/\1/')
done < <(find AGENTS.md CLAUDE.md docs -name '*.md' 2>/dev/null)

# 5. IDs normativos duplicados (BR, SC, PAT, ANTI, STY, AG, ARC, FS, TST)
dups="$(grep -rhoE '^(### |\| |- \*\*)(BR|SC-IN|SC-OUT|OBJ|PAT|ANTI|STY|AGT|AG|ARC|FS|TST)-[0-9]{3}' docs \
  | sed -E 's/^(### |\| |- \*\*)//' | sort | uniq -d)"
[[ -n "$dups" ]] && err "IDs normativos definidos mais de uma vez: $(echo "$dups" | tr '\n' ' ')"

# 6. Lacunas que só o owner preenche
todo_count="$(grep -rc 'TODO(owner)' AGENTS.md docs | awk -F: '{s+=$2} END{print s+0}')"
if (( todo_count > 0 )); then
  if (( STRICT )); then
    err "$todo_count marcadores TODO(owner) pendentes"
  else
    warn "$todo_count marcadores TODO(owner) pendentes (use --strict para falhar)"
  fi
fi

echo "---"
echo "check-governance: $errors erro(s), $warnings aviso(s)"
(( errors == 0 ))
